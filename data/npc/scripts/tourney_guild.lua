local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

local key, id, tourney_id, tourney_ord, reg_open, reg_closed = 0, 0, 0, 0, 0, 0
local day2seconds = 86400
local cfg = GUILD_TOURNEY_CFG
function creatureSayCallback(cid, type, msg)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if msgcontains(msg, 'help') or msgcontains(msg, 'ajuda') then
        selfSay("Welcome "..getPlayerName(cid).."! Here, you can {enter}, {register} or {leave} from Tourney Guild.", cid)
		if getPlayerGroupId(cid) >= cfg.group2Ctrl then
			selfSay("[Exlusive] Você é o ADMIN do Servidor, diga {open} ou {abrir} para cadastrar um novo Tourney Guild Event.", cid)
		end
        talkState[cid] = 0
		
	elseif msgcontains(msg, 'leave') or msgcontains(msg, 'left') then
		selfSay("Vai sair, cuza1?", cid)
        talkState[cid] = 10
		
	elseif msgcontains(msg, 'open') or msgcontains(msg, 'abrir') then
		if getPlayerGroupId(cid) >= cfg.group2Ctrl then
			selfSay("Você gostaria de abrir cadastrar um novo Evento?", cid)
			talkState[cid] = 20
		else
			selfSay("Sorry, but only ADMINISTRATOR have access.", cid)
			talkState[cid] = 0
		end
-----------------------------------------------------------------
------------------------ ENTER / REGISTER -----------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'enter') or msgcontains(msg, 'register') then
		local name = getPlayerName(cid)
		local guildRank = getPlayerGuildRank(cid)
		if guildRank == "Leader" then
			check = getGuildTourneyLastEndedEvent()
			local ostime = os.time()
			if check["status"] == "open" then
				id = check["id"]
				tourney_id = check["tid"]
				tourney_ord = check["ordem"]
				reg_open = check["reg_open"]
				reg_closed = check["reg_closed"]
				local guild1 = check["guild1"]
				local guild2 = check["guild2"]
				local tourney_status = check["status"]
				if reg_closed > 0 and ostime >= reg_closed then
					selfSay('Sorry, but the time to register for '..tourney_id..'º Guild Tourney closed at '..os.date("%b %d, %Y at %X", reg_closed)..'.', cid)
					if tourney_status == "open" then
						db.query("UPDATE `guild_tourney` SET `tourney_status` = 'progress' WHERE tourney_id = " .. tourney_id .. ";")
					end
					talkState[cid] = 0
					return true
				end
				if guild1 == '' then
					key = 1
					selfSay('[Guild_1] Ok, let\'s register your guild on '..tourney_id..'º Guild Tourney, can I continue?', cid)
					talkState[cid] = 1
				elseif guild2 == '' then
					key = 2
					selfSay('[Guild_2] Ok, let\'s register your guild on '..tourney_id..'º Guild Tourney, can I continue?', cid)
					talkState[cid] = 1
				else
					key = 3
					selfSay('[Create_New] Ok, let\'s register your guild on '..tourney_id..'º Guild Tourney, can I continue?', cid)
					talkState[cid] = 0
				end
				
			elseif check["status"] == "progress" then
				selfSay('Sorry, but the registration for the '..tourney_id..'º Guild Tourney is now closed and the tournament is in progress.', cid)
				talkState[cid] = 0
			elseif check["status"] == "ended" then
				selfSay('Sorry, but the last Guild Tourney has already ended.', cid)
				talkState[cid] = 0
			elseif check["status"] == 0 then
				selfSay('Sorry, but don\'t have any Guild Tourney open right now.', cid)
				talkState[cid] = 0
			end
		else			
			selfSay('Sorry, but only Leaders can register Guild on the Tourney.', cid)
			talkState[cid] = 0
		end

    elseif talkState[cid] == 1 then
        if msgcontains(msg, 'yes') then
			if tourney_id == 0 or tourney_ord == 0 then
				selfSay('Sorry, but some ERROR have occurred, please contact the administrator.', cid)
				talkState[cid] = 0
				return true
			end
			local guildId = getPlayerGuildId(cid)
			agree = checkGuildToTourney(guildId)
			if not agree then 
				selfSay('Sorry, but your Guild already registered on '..tourney_id..'º Guild Tourney.', cid)
				talkState[cid] = 0
			return true
			end
			if key == 1 then -- Register 1
				db.query("UPDATE `guild_tourney` SET `guild_id_1` = " .. guildId .. " WHERE id = " .. id .. " AND tourney_id = " .. tourney_id .. ";")
			elseif key == 2 then -- Register and Create New Line
				db.query("UPDATE `guild_tourney` SET `guild_id_2` = " .. guildId .. " WHERE id = " .. id .. " AND  tourney_id = " .. tourney_id .. ";")
				db.query("INSERT INTO `guild_tourney` (`tourney_id`, `tourney_ord`, `tourney_status`, `register_open`, `register_closed`) VALUES (" .. tourney_id .. ", " .. (tourney_ord + 1) .. ", 'open', " .. reg_open .. ", " .. reg_closed .. ");")
			elseif key == 3 then -- Create New Line to Register
				db.query("INSERT INTO `guild_tourney` (`tourney_id`, `tourney_ord`, `tourney_status`, `guild_id_1`, `register_open`, `register_closed`) VALUES (" .. tourney_id .. ", " .. (tourney_ord + 1) .. ", " .. guildId .. ", 'open', " .. reg_open .. ", " .. reg_closed .. ");")
			end			
			selfSay('Congratulations, your Guild was registered successfully on the '..tourney_id..'º Guild Tourney.', cid)
			talkState[cid] = 0
        else
            selfSay('Ok, can I {help} you?', cid)
            talkState[cid] = 0
        end

---------------------------------------------------------------------
------------------------ OPEN AND DECLARE NEW -----------------------
---------------------------------------------------------------------
	elseif talkState[cid] == 20 then
        if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			check = getGuildTourneyLastEndedEvent()
			if check["status"] == "open" then
				selfSay('Lamento, temos um Torneio em Aberto que é melhor aguardar encerrar antes de registrar o próximo.', cid)
				talkState[cid] = 0
			elseif check["status"] == "progress" then
				selfSay('Lamento, temos um Torneio em Progresso que é melhor aguardar encerrar antes de registrar o próximo.', cid)
				talkState[cid] = 0
			elseif check["status"] == "ended" then
				selfSay('Se deseja adicionar um novo evento diga o {número de dias} (valor numérico) que a Inscrição ficará aberta.\nCaso contrário, diga {não} ou {no}.', cid)
				talkState[cid] = 40
			elseif check["status"] == 0 then
				selfSay('Ainda não há eventos cadastrados.\nCaso deseje adicionar um novo evento diga o {número de dias} (valor numérico) que a Inscrição ficará aberta.\nCaso contrário, diga {não} ou {no}.', cid)
				talkState[cid] = 30
			end

        else
            selfSay('Ok, can I {help} you?', cid)
            talkState[cid] = 0
        end

	-- [[ REGISTRANDO PRIMEIRO EVENTO ]]--
	-- [[ REGISTRANDO PRIMEIRO EVENTO ]]--
	elseif talkState[cid] == 30 then -- FIRST EVENT
		if isNumber(msg) then
			time_now = os.time()
			data = getTimeToEndOfDay() -- Get seconds till end of the Day
			final_data = ((time_now + data) + ((tonumber(msg) - 1) * day2seconds))
			selfSay('Certo, gostaria que a inscrição de guild para este evento dure até '..os.date("%b %d, %Y at %X", final_data)..'?', cid)
			talkState[cid] = 31
		else
			selfSay('Por favor, diga a quantidade de dias que a inscrição para este evento ficará aberta.', cid)
            talkState[cid] = 30
		end
		
	elseif talkState[cid] == 31 then -- REGISTERIN' THE FIRST EVENT
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			selfSay('Certo, abrimos a inscrição do evento desde agora até: '..os.date("%b %d, %Y às %X", final_data)..'.', cid)
			--[[ Registrando na Database ]]--
			db.query("INSERT INTO `guild_tourney` (`tourney_id`, `tourney_ord`, `tourney_status`, `register_open`, `register_closed`) VALUES (1, 1, 'open', " .. time_now .. ", " .. final_data .. ");")
			talkState[cid] = 0
		else
			selfSay('Ok, can I {help} you?', cid)
			talkState[cid] = 0
		end
			
	-- [[ REGISTRANDO NOVO EVENTO ]]--
	-- [[ REGISTRANDO NOVO EVENTO ]]--
	elseif talkState[cid] == 40 then
		if isNumber(msg) then
			time_now = os.time()
			data = getTimeToEndOfDay() -- Get seconds till end of the Day
			final_data = ((time_now + data) + ((tonumber(msg) - 1) * day2seconds))
			selfSay('Certo, gostaria que a inscrição de guild para este evento dure até '..os.date("%b %d, %Y at %X", final_data)..'?', cid)
			talkState[cid] = 41
		else
			selfSay('Por favor, diga a quantidade de dias que a inscrição para este evento ficará aberta.', cid)
            talkState[cid] = 40
		end
		
	elseif talkState[cid] == 41 then -- REGISTERIN' THE FIRST EVENT
		if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
			selfSay('Certo, abrimos a inscrição do evento desde agora até: '..os.date("%b %d, %Y às %X", final_data)..'.', cid)
			--[[ Registrando na Database ]]--
			local new_tourney_id = check["tid"] + 1
			db.query("INSERT INTO `guild_tourney` (`tourney_id`, `tourney_ord`, `tourney_status`, `register_open`, `register_closed`) VALUES (" .. new_tourney_id .. ", 1, 'open', " .. time_now .. ", " .. final_data .. ");")
			talkState[cid] = 0
		else
			selfSay('Ok, can I {help} you?', cid)
			talkState[cid] = 0
		end
	end
    return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())