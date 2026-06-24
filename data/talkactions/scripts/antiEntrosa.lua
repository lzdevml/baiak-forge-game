local block_area_entrosa = {
	{{x = 1924, y = 75, z = 7}, {x = 1969, y = 118, z = 7}}, -- snowball
	{{x = 2128, y = 162, z = 7}, {x = 2241, y = 240, z = 6}}, -- DTT
	{{x = 2121, y = 51, z = 7}, {x = 2196, y = 142, z = 7}}, -- bomberman 
	{{x = 1985, y = 157, z = 7}, {x = 2032, y = 180, z = 7}}, -- safe 
	{{x = 1925, y = 152, z = 7}, {x = 1965, y = 193, z = 7}}, -- zombie
	{{x = 2030, y = 64, z = 7}, {x = 2095, y = 133, z = 7}}, -- csbattle
	{{x = 1933, y = 221, z = 7}, {x = 2003, y = 263, z = 6}}, -- ctf
	{{x = 19859, y = 20072, z = 7}, {x = 20069, y = 20204, z = 7}}, -- ctf	
	{{x = 2054, y = 160, z = 7}, {x = 2090, y = 188, z = 7}} -- therain
}

function onSay(cid, words, param)
	local CommandParam = string.explode(param, ",")
	if getPlayerGuildId(cid) == 0 then
		doPlayerSendCancel(cid, "É necessário você estar em uma guild para ir no Anti Entrosa.")
	elseif getPlayerLevel(cid) < WarConfigs.WarMinLevel then
		doPlayerSendCancel(cid, "Você não tem level para participar do evento.")
	elseif not CommandParam[1] and CommandParam[1] ~= "" then
		doPlayerSendCancel(cid, "Insira os parametros, invite, accept, cancel ou go.")

	else
		if string.lower(CommandParam[1]) == "invite" then
			if CommandParam[2] then
				GetStorageCaseID = table.find(WarConfigs.WarCitys, string.lower(CommandParam[2]))
			end
			if getPlayerGuildLevel(cid) < 3 then
				doPlayerSendCancel(cid, "Apenas leaders da guild podem usar o comando.")
			elseif getPlayerLevel(cid) < WarConfigs.WarGuildLeaderMinLevel then
				doPlayerSendCancel(cid, "Apenas leaders de Guilds com level ".. WarConfigs.WarGuildLeaderMinLevel .." ou mais pode usar este comando.")
			elseif not CommandParam[2] or CommandParam[2] == "" then
				doPlayerSendCancel(cid, "Insira o segundo parâmetros, selecione cidade.")
			elseif not isInArray(WarConfigs.WarCitys, CommandParam[2]) then
				doPlayerSendCancel(cid, "Seleciona uma cidade válida, para mais informações acesse nosso site..")
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cidades disponíveis para a guerra ".. table.concat(WarConfigs.WarCitys, ', ') ..".")
			elseif not CommandParam[3] or CommandParam[3] == "" or not tonumber(CommandParam[3]) then
				doPlayerSendCancel(cid, "Insira o terceiro parâmetro, selecione quantidade frags para terminar a guerra, insira apenas números.")
			elseif not CommandParam[4] or CommandParam[4] == "" or string.lower(CommandParam[4]) ~= "enabled" and string.lower(CommandParam[4]) ~= "disabled" then
				doPlayerSendCancel(cid, "Insira o quarto parâmetro, select if ultimate explosion, enabled or disabled.")
			elseif not CommandParam[5] or CommandParam[5] == "" or string.lower(CommandParam[5]) ~= "enabled" and string.lower(CommandParam[5]) ~= "disabled" then
				doPlayerSendCancel(cid, "Insira o quinto parâmetro, select if area runes, enabled or disabled.")
			elseif not CommandParam[6] or CommandParam[6] == "" or string.lower(CommandParam[6]) ~= "enabled" and string.lower(CommandParam[6]) ~= "disabled" then
				doPlayerSendCancel(cid, "Insira o sexto parâmetro, select whether the amulet block stone skin and stealth ring, enabled or disabled.")
			elseif not CommandParam[7] or CommandParam[7] == "" or not tonumber(CommandParam[7]) then
				doPlayerSendCancel(cid, "Insira o setimo parâmetro, selecione limite de jogadores para cada aliança, insira apenas números.")
			elseif tonumber(CommandParam[7]) < WarConfigs.WarMinPlayers then
				doPlayerSendCancel(cid, "Minímo de jogadores necessário em cada Guild ".. WarConfigs.WarMinPlayers ..".")
			elseif not CommandParam[8] or CommandParam[8] == "" or string.lower(CommandParam[8]) ~= "enabled" and string.lower(CommandParam[8]) ~= "disabled" then
				doPlayerSendCancel(cid, "Insira o oitavo parâmetro, se quer limitar ou nao o numero de front lines na guerra.")				
			elseif not CommandParam[9] or CommandParam[9] == "" then
				doPlayerSendCancel(cid, "Insira o nono parâmetro, selecione o nome de alianças que você quer a guerra.")
			elseif not CommandParam[10] or CommandParam[10] == "" or not tonumber(CommandParam[10]) then
				doPlayerSendCancel(cid, "Insira o décimo parâmetro, valor numérico do level máximo dos players.")
			elseif not getGuildId(CommandParam[9]) then
				doPlayerSendCancel(cid, "A guild com esse nome não existe.")
			elseif getGuildId(CommandParam[9]) == getPlayerGuildId(cid) then
				doPlayerSendCancel(cid, "Você não pode chamar sua própria aliança a guerra.")
			elseif getHavePlayersInGuildByGuildID(getPlayerGuildId(cid)) < WarConfigs.WarMinPlayersInGuild then
				doPlayerSendCancel(cid, "Para convidar qualquerum de sua aliança deve ter o mínimo de ".. WarConfigs.WarMinPlayersInGuild .." membros.")
			elseif getHavePlayersInGuildByGuildID(getGuildId(CommandParam[9])) < WarConfigs.WarMinPlayersInGuild then
				doPlayerSendCancel(cid, "A aliança está convidando você para uma guerra não tem o mínimo de ".. WarConfigs.WarMinPlayersInGuild .." jogadores para iniciar a guerra.")
			elseif not checkWarCitysIps(getPlayerGuildId(cid)) then
				doPlayerSendCancel(cid, "Sua aliança não cumpre os requisitos daf ".. WarConfigs.WarNeedDiferentIps .." diferente IPS.")
			elseif not checkWarCitysIps(getPlayerGuildId(cid)) then
				doPlayerSendCancel(cid, "A guilda que você convidou-o a guerra não está em conformidade com os requisitos da ".. WarConfigs.WarNeedDiferentIps .." IPs diferentes para começar uma guerra.")
			elseif checkActiveWarInGuild(getPlayerGuildId(cid)) then
				doPlayerSendCancel(cid, "Sua guild já está em guerra.")
			elseif checkActiveWarInGuild(getGuildId(CommandParam[9])) then
				doPlayerSendCancel(cid, "Essa Guild ".. CommandParam[9] .." já está em guerra.")
			elseif checkActiveInviteInGuild(getPlayerGuildId(cid)) then
				doPlayerSendCancel(cid, "Sua aliança já tem um convite na ativa, esperar convite ou aguardar acabamento.")
			elseif checkActiveInviteInGuild(getGuildId(CommandParam[9])) then
				doPlayerSendCancel(cid, "Essa guild ".. CommandParam[9] .." já tem um convite ativo, aguarde.")
			elseif getGlobalStorageValue(WarConfigs["WarAcceptTimeArena"][GetStorageCaseID]) > os.time() then
				doPlayerSendCancel(cid, "There is a call in progress is to arena, wait for the call to end if the invitation is accepted wait until the end of the war.")
			elseif getGlobalStorageValue(WarConfigs["WarArenaStorage"][GetStorageCaseID]) > 0 then
				doPlayerSendCancel(cid, "Arena já está em uso, espere terminar a guerra.")
			elseif #getOnlineGuildMembers(getGuildId(CommandParam[9]), {3}) == 0 then
				doPlayerSendCancel(cid, "nenhum dos líderes da aliança convidado está online.")
			else
				warSetOptions(GetStorageCaseID, 0, os.time() + WarConfigs.WarAcceptTime, CommandParam[3], CommandParam[4], CommandParam[5], CommandParam[6], CommandParam[7], CommandParam[8], getPlayerGuildId(cid), getGuildId(CommandParam[9]), CommandParam[10])
				warBroadcastGuild(getPlayerGuildId(cid), MESSAGE_EVENT_ADVANCE, "O líder da guilda convidou a guild, ".. CommandParam[9] .." para uma guerra em ".. CommandParam[2] .." com level máximo ".. CommandParam[10] .."!", {3})
				warBroadcastGuild(getGuildId(CommandParam[9]), MESSAGE_EVENT_ADVANCE, "".. getCreatureName(cid) .." da guild ".. getPlayerGuildName(cid) .." convidou sua guild para uma guerra em ".. CommandParam[2] .." com level máximo ".. CommandParam[10] ..", para aceitar digite, !citywar accept ou /citywar accept, ".. getPlayerGuildName(cid) .."", {3})
                doBroadcastMessage(getPlayerGuildName(cid) .. " Declarou guerra contra guild ".. CommandParam[9] .." para ".. CommandParam[3] .." mortes e ".. CommandParam[7] .." VS ".. CommandParam[7] ..", em ".. CommandParam[2] .." com level máximo ".. CommandParam[10] .." no sistema Private War. O leader da guild rival recebeu informações no Local Chat e Server Log sobre a guerra.", 19)
				warBroadcastGuild(getGuildId(CommandParam[9]), MESSAGE_STATUS_CONSOLE_BLUE, "Opção de Guerra: Cidade ".. CommandParam[2] ..", frags ".. CommandParam[3] ..", Mágias em área ".. CommandParam[4] ..", Runas em área ".. CommandParam[5] ..", DontSSAMight ".. CommandParam[6] ..", ".. CommandParam[7] .." jogadores por Guild.", {3})
			end
		elseif string.lower(CommandParam[1]) == "accept" then
			if CommandParam[2] then
				getStorageEntry = seachGuildInStorages(getGuildId(CommandParam[2]), getPlayerGuildId(cid))
			end
			if getPlayerGuildLevel(cid) < 3 then
				doPlayerSendCancel(cid, "Apenas leaders podem usar o comando.")
			elseif not CommandParam[2] or CommandParam[2] == "" then
				doPlayerSendCancel(cid, "Insira o segundo parâmetro, selecione aliança que convidou você.")
			elseif not getGuildId(CommandParam[2]) then
				doPlayerSendCancel(cid, "Essa guild não existe ou o nome está inválido.")
			elseif getGuildId(CommandParam[2]) == getPlayerGuildId(cid) then
				doPlayerSendCancel(cid, "Não é possível aceitar uma chamada guerra do seu próprio clã.")
			elseif getGlobalStorageValue(WarConfigs["WarSecondGuildID"][getStorageEntry]) ~= getPlayerGuildId(cid) then
				doPlayerSendCancel(cid, "Não há convite ".. CommandParam[2] .." para lutar com a sua aliança.")
			elseif getGlobalStorageValue(WarConfigs["WarAcceptTimeArena"][getStorageEntry]) < os.time() then
				doPlayerSendCancel(cid, "O tempo para aceitar o convite guerra expirou.")
			else
				doInitWar(getStorageEntry)
			end
		elseif string.lower(CommandParam[1]) == "cancel" then
			local GetGuildAndEntryID = checkActiveWarInGuildAndEntryID(getPlayerGuildId(cid))
			if getPlayerGuildLevel(cid) < 3 then
				doPlayerSendCancel(cid, "Apenas os líderes da guilda pode usar este comando.")
			elseif not GetGuildAndEntryID then
				doPlayerSendCancel(cid, "Sua Guild não está na guerra para executar este comando.")
			elseif getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) ~= 1 then
				doPlayerSendCancel(cid, "Somente líderes ativos na guerra pode executar um cancelamento.")
			elseif getGlobalStorageValue(WarConfigs["WarArenaStorage"][GetGuildAndEntryID[1]]) < WarConfigs.WarWaitTimeToCancel + os.time() then
				doPlayerSendCancel(cid, "O cancelamento de tempo é maior do que o tempo restante para acabar com a guerra, aguarde o fim da guerra.")
			elseif getGlobalStorageValue(WarConfigs["WarCanceledCity"][GetGuildAndEntryID[1]]) == 1 then
				doPlayerSendCancel(cid, "Já há um cancelamento em andamento nesta guerra.")
			else
				executeCancelWarCity(getPlayerNameByGUID(getPlayerGUID(cid)), GetGuildAndEntryID[1], true)
			end
		elseif string.lower(CommandParam[1]) == "go" then
			local GetGuildAndEntryID = checkActiveWarInGuildAndEntryID(getPlayerGuildId(cid))
			if not getTilePzInfo(getThingPos(cid)) then
				doPlayerSendCancel(cid, "Você só pode usar esse comando em área protegida.")
			elseif not GetGuildAndEntryID then
				doPlayerSendCancel(cid, "Sua guild não está em guerra.")
			elseif getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) == 1 then
				doPlayerSendCancel(cid, "Você já está lutando na guerra.")
			elseif (getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == 2164 or getPlayerItemCount(cid, 2164) > 0) and getGlobalStorageValue(WarConfigs["WarDontSSAMight"][GetGuildAndEntryID[1]]) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Anti-Entrosa] Remove your might ring from slot ring and backpack first.")
			elseif (getPlayerSlotItem(cid, CONST_SLOT_NECKLACE).itemid == 2197 or getPlayerItemCount(cid, 2197) > 0) and getGlobalStorageValue(WarConfigs["WarDontSSAMight"][GetGuildAndEntryID[1]]) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Anti-Entrosa] Remove your stone skin amulet from slot necklace and backpack first.")
			elseif (getPlayerSlotItem(cid, CONST_SLOT_RING).itemid == 2202 or getPlayerItemCount(cid, 2165) > 0) and getGlobalStorageValue(WarConfigs["WarDontSSAMight"][GetGuildAndEntryID[1]]) == 1 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Anti-Entrosa] Remove your stealth ring from slot ring and backpack first.")
			elseif getPlayerLevel(cid) > getGlobalStorageValue(WarConfigs["WarArenaMaxLevel"][GetGuildAndEntryID[1]]) then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Anti-Entrosa] Sorry, but your level is higher than allowed. [Max Level: "..getGlobalStorageValue(WarConfigs["WarArenaMaxLevel"][GetGuildAndEntryID[1]]).."].")
			else
				-- Verifica se está em área permitida	
				for _, block_entrosa_area in ipairs(block_area_entrosa) do
					if isInRange(getCreaturePosition(cid), block_entrosa_area[1], block_entrosa_area[2]) then
						doPlayerSendCancel(cid, "[War Anti-Entrosa] Você não pode usar esse comando nesta área.")
						return true
					else
						executeEnterArena(cid, GetGuildAndEntryID[2], GetGuildAndEntryID[1])
						return true -- pronto porra deus te ouça mano aleluia o gloria jesus amem mano -- teste aí que todo mau cai sobre a terra senhor em nome de jeuss
					end
				end
			end

		elseif string.lower(CommandParam[1]) == "exit" then
			local GetGuildAndEntryID = checkActiveWarInGuildAndEntryID(getPlayerGuildId(cid))
			if not getTilePzInfo(getThingPos(cid)) then
				doPlayerSendCancel(cid, "Você só pode usar esse comando em área protegida (procure uma area dentro do anti-entrosa.")
			elseif not GetGuildAndEntryID then
				doPlayerSendCancel(cid, "Sua guild não está em guerra.")
			else
				doPlayerExitArena(cid)
			end
		else
			doPlayerSendCancel(cid, "Insira primeiro os comandos corretamente, invite, accept ou go.")
		end
	end
	return true
end
