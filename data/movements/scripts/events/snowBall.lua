function onStepIn(cid, item, position, fromPosition, toPosition)
	if (not isPlayer(cid)) then
		return true
	end

	if (getPlayerLevel(cid) < 80) then
		doCreatureSay(cid, "Only for level 80+", TALKTYPE_ORANGE_1, false, 0, position)
		doTeleportThing(cid, fromPosition, false)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
		return true
	end

	local checkPlayers = getCreaturesFromArea(SBW_WAITROOM[1], SBW_WAITROOM[2], true)
	if (#checkPlayers > 0) then
		for i=1, #checkPlayers do
			pid = checkPlayers[i]
			if (getPlayerIp(pid) == getPlayerIp(cid)) then
				doTeleportThing(cid, fromPosition, false)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
				doPlayerSendCancel(cid, "[Castle24Hrs] Só é permitido 1 jogador por IP dentro do castelo.")
				return true
			end
		end
	end

	doTeleportThing(cid, SBW_TPGO)
	doBroadcastMessage("[SNOWBALL WAR] O jogador " ..getCreatureName(cid).. " ingressou no evento.", MESSAGE_STATUS_CONSOLE_ORANGE)
    return true
end