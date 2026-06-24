function onStepIn(cid, item, pos, fromPosition)
	if not isPlayer(cid) then
		return true
	end

	local name = getPlayerName(cid)
	local actionId = item.actionid
	local guildId = getPlayerGuildId(cid)
	if actionId == 35097 then
		if guildId == 0 then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, 'Você não é membro de uma guild.')
			return true
		end
		if getPlayerLevel(cid) < Castle48h.minLevel then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, 'Você precisa ser level ' .. Castle48h.minLevel .. '+ para passar.')
			return true
		end
		if Castle48h:eventState() == CASTLE48H_STATE_CLOSED then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendCancel(cid, 'O castelo não está aberto para invasões.')
			return true
		end

		Castle48h.invaders[name] = os.mtime()
		registerCreatureEvent(cid, 'Castle48hThink')
		registerCreatureEvent(cid, 'Castle48hDeath')

	elseif actionId == 35098 then
		if Castle48h:eventState() == CASTLE48H_STATE_OPEN then
			Castle48h.invaders[name] = nil
			unregisterCreatureEvent(cid, 'Castle48hThink')
			unregisterCreatureEvent(cid, 'Castle48hDeath')
		end
	end
	return true
end
