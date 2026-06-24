function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
    if isPlayer(cid) then
		if getPlayerLevel(cid) < 80 then
			doPlayerSendTextMessage(cid, 25, "Supere o nivel 80+")
			doTeleportThing(cid, fromPosition, true)
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
		elseif getPlayerLevel(cid) >= 81 and getPlayerLevel(cid) < 190 then
		end
	end
    return true
end