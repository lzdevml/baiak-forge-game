function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return true
end
	doTeleportThing(cid, {x = 148, y = 52, z = 10}, false)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
    return true
end