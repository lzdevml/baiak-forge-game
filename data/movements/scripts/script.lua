function onStepIn(cid, item, position, fromPosition)
	local newnPosition = {x = 138, y = 119, z = 9}


	doTeleportThing(cid, newnPosition)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	setPlayerStorageValue(cid, 100078, 25)
	doCreatureSay(cid, 'You succesfully destroyed the Shadow Nexus', 19, false, cid)
end