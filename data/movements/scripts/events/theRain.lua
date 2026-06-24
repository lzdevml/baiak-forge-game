function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then return true end
	if getPlayerAccess(cid) > 3 then return doTeleportThing(cid, Fire.teleport[2]) end
	if getPlayerLevel(cid) < Fire.minLevel then
		doTeleportThing(cid, fromPosition, true)
		doPlayerSendCancel(cid, "[The Rain Event] Você precisa estar pelo menos level " .. Fire.minLevel .. " para participar do evento.")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
		return true
	end

	local checkPlayers = getCreaturesFromArea(Fire.arena[1], Fire.arena[2], true)
	if (#checkPlayers > 0) then
		for i=1, #checkPlayers do
			pid = checkPlayers[i]
			if (getPlayerIp(pid) == getPlayerIp(cid)) then
				doTeleportThing(cid, fromPosition, false)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Só é permitido 1 jogador por IP no evento.")
				return true
			end
		end
	end

	if getGlobalStorageValue(Fire.storages[1]) <= Fire.players.max then
		doTeleportThing(cid, Fire.teleport[2])
		setGlobalStorageValue(Fire.storages[1], getGlobalStorageValue(Fire.storages[1])+1)
		doBroadcastMessage("[The Rain Event] " .. getPlayerName(cid) .. " entrou no evento! Atualmente o evento está com " .. getGlobalStorageValue(Fire.storages[1]) .. " players!", MESSAGE_STATUS_CONSOLE_RED)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[The Rain Event] Não seja pego pela chuva. Ganhará o último jogador que sobreviver.")
		if getGlobalStorageValue(Fire.storages[1]) == Fire.players.max then
			setGlobalStorageValue(Fire.storages[1], getGlobalStorageValue(Fire.storages[1])+1)
			removeFireTp()
			doBroadcastMessage("[The Rain Event] Evento vai começar em "..Fire.timeToStartEvent.." segundos. Prepare-se!")
			addEvent(doFireInArea, Fire.timeToStartEvent*1000, 1)
		end 
	end
	return true
end