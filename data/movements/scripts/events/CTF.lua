local conditionBlue = {lookType = 2721, lookHead = 87, lookBody = 87, lookLegs = 87, lookFeet = 87, lookTypeEx = 0, lookAddons = 3}
local conditionRed = {lookType = 2721, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 3}

function onStepIn(cid, item, position, fromPosition)
	if getStorage(ctfConfig.joinEventStorage) == 1 then
		if getPlayerLevel(cid) < ctfConfig.minLevel then
			doTeleportThing(cid, fromPosition, true)
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'Você não pode entrar no evento CTF se você não tiver um nível exigido. [' .. ctfConfig.minLevel .. ']')
		end
	
		if getCreatureStorage(cid, ctfConfig.blue.storage) == 1 or getCreatureStorage(cid, ctfConfig.red.storage) == 1 then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'Você já se juntou ao evento CTF.')
		end

		local blue, red = getAmountParticipantsCTF()
		if #blue == ctfConfig.maxOfParticipants and #red == ctfConfig.maxOfParticipants then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, 'Evento lotado!')
			return true
		end

		if getPlayerGroupId(cid) > 3  then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, 'Gm não pode!')
			return true
		end

		-- Check IP
		local checkPlayers = getCreaturesFromArea({x=1940,y=224,z=6}, {x=1999,y=265,z=7}, true)
		if (#checkPlayers > 0) then
			for i=1, #checkPlayers do
				pid = checkPlayers[i]
				if (getPlayerIp(pid) == getPlayerIp(cid)) then
					doTeleportThing(cid, fromPosition, true)
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
					doPlayerSendCancel(cid, "[CTF] Só é permitido 1 jogador por IP dentro do evento.")
					return true
				end
			end
		end

		if #blue > 0 or #red > 0 then
			if #blue > #red then
				doTeleportThing(cid, ctfConfig.red.teleportPos)
				doCreatureSetStorage(cid, ctfConfig.red.storage, 1)
				doSetCreatureOutfit(cid, conditionRed, -1)
			elseif #blue < #red then
				doTeleportThing(cid, ctfConfig.blue.teleportPos)
				doCreatureSetStorage(cid, ctfConfig.blue.storage, 1)
				doSetCreatureOutfit(cid, conditionBlue, -1)
			elseif #blue == #red then
				local team = math.random(2) == 1 and ctfConfig.blue or ctfConfig.red
				doTeleportThing(cid, team.teleportPos)
				doCreatureSetStorage(cid, team.storage, 1)
				doSetCreatureOutfit(cid, (getCreatureStorage(cid, ctfConfig.blue.storage) > 0 and conditionBlue or conditionRed), -1)
			end
		else
			local team = math.random(2) == 1 and ctfConfig.blue or ctfConfig.red
			doTeleportThing(cid, team.teleportPos)
			doCreatureSetStorage(cid, team.storage, 1)
			doSetCreatureOutfit(cid, (getCreatureStorage(cid, ctfConfig.blue.storage) > 0 and conditionBlue or conditionRed), -1)
		end

		registerCreatureEvent(cid, "CtfStats")
		registerCreatureEvent(cid, "CtfCombat")
		doPlayerPopupFYI(cid, ctfConfig.text)
	else
		doTeleportThing(cid, fromPosition, true)
		doPlayerSendCancel(cid, 'Ainda não é tempo!')
	end
	return true
end