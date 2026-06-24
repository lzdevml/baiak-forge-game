function onStepIn(cid, item, position, fromPosition, toPosition)
	if getPlayerLevel(cid) >= SafeZone.minLevel then
		local players = SafeZone.getPlayers()
		if #players < SafeZone.maxPlayers then
			local pp = getCreaturesFromArea({x=1993, y=165, z=7}, {x=2024, y=177, z=7}, true)
			for i=1, #pp do
				pid = pp[i]
				if (getPlayerIp(cid) == getPlayerIp(pid)) then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[SafeZone Event] Só é permitido 1 jogador por IP.")
					doTeleportThing(cid, fromPosition)
					doSendMagicEffect(fromPosition, CONST_ME_POFF)
					return true
				end
			end

			doTeleportThing(cid, SafeZone.waitingRoom)
			doSendMagicEffect(SafeZone.waitingRoom, CONST_ME_TELEPORT)
			doSendAnimatedText(SafeZone.waitingRoom, "JOIN!", COLOR_WHITE)
			doCreatureSetStorage(cid, SafeZone.storages.inGame, 1)
			registerCreatureEvent(cid, "safeZoneThrow")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[SafeZone Event] O evento já atingiu o número máximo de participantes.")
			doTeleportThing(cid, fromPosition)
			doSendMagicEffect(fromPosition, CONST_ME_POFF)
			return true
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[SafeZone Event] Somente jogadores com level ".. SafeZone.minLevel .." ou mais podem entrar.")
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		return true
	end
	return true
end