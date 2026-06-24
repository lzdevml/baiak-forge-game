-- ########################################################
-- #####       	  Name: Adriano Swatt'   	          #####
-- ##### 			  Version: 1.0                    #####
-- ########################################################
-- #####  		Developed by Adriano Swatt'			  #####
-- #####  	 Contact: adrianoswat@yahoo.com.br        #####
-- #####	   GUILD TOURNEY SYSTEM BY SWATT'    	  #####
-- ########################################################
GUILD_TOURNEY_CFG = {
	eventDuration = 40, -- Tempo em Minutos de Duração da Batalha
	playerLimit = {min = 1, max = 15}, -- Min e Max de Players p/ Guild p/ Evento Ocorrer
	
	--[[ Configurações Administrativas ]]--
	group2Ctrl = 5, -- Patente no Servidor p/ Abrir novo Torneio 5 = GM, 6 = ADMIN
}

function getTimeToEndOfDay()
	local timeInSeconds = 0
	local ostime = os.time()
	local n = { -- time now
		hour = os.date("%H"),
		minute = os.date("%M"),
		seconds = os.date("%S")
	}
	local l = { -- left time
		hour = 23 - n.hour,
		minute = 59 - n.minute,
		seconds = 59 - n.seconds,
	}
	timeInSeconds = ((l.hour * 60 * 60) + (l.minute * 60) + (l.seconds))
return timeInSeconds
end

-- STATUS = "open", "progress", "ended"
function getGuildTourneyLastEndedEvent()
	local result = {} 
	local r = db.getResult("SELECT * FROM `guild_tourney` ORDER BY `id` DESC;")
	if(r:getID() ~= -1) then
		local time_now = os.time()
		local id = r:getDataInt("id")
		local opened = r:getDataInt("register_open")
		local closed = r:getDataInt("register_closed")
		local t = db.getResult("SELECT `tourney_id` FROM `guild_tourney` WHERE `id` = " .. id .. " ORDER BY `tourney_id` DESC;")
		if(t:getID() ~= -1) then -- Search 4 Lastest Event
			local id = r:getDataInt("id")
			local tid = r:getDataInt("tourney_id")
			local ordem = r:getDataInt("tourney_ord")
			local status = r:getDataString("tourney_status")
			local guild1 = r:getDataString("guild_id_1")
			local guild2 = r:getDataString("guild_id_2")
			local reg_open = r:getDataInt("register_open")
			local reg_closed = r:getDataInt("register_closed")
			
			result["id"] = id
			result["tid"] = tid
			result["ordem"] = ordem
			result["status"] = status
			result["guild1"] = guild1
			result["guild2"] = guild2
			result["reg_open"] = reg_open
			result["reg_closed"] = reg_closed
		end

	else -- No Events Registereds
		result["ordem"] = 0
		result["status"] = 0
	end	
return result
end

function checkGuildToTourney(guildId)
	local r = db.getResult("SELECT * FROM `guild_tourney` ORDER BY `id` DESC;")
	if(r:getID() ~= -1) then
		local id = r:getDataInt("id")
		local tourney_id = r:getDataInt("tourney_id")
		local t = db.getResult("SELECT * FROM `guild_tourney` WHERE `tourney_id` = " .. tourney_id .. " AND `guild_id_1` = " .. guildId .. " OR `guild_id_2` = " .. guildId .. ";")
		if(t:getID() ~= -1) then -- Search 4 Lastest Event
			return false
		end
	end
return true
end
