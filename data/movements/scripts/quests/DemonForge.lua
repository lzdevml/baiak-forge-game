function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 100055378) >= 23 then
		doTeleportThing(cid, {x = 334, y = 289, z = 13})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

		if getPlayerStorageValue(cid, 100055378) == 23 then
			setPlayerStorageValue(cid, 100055378, 24)
			setPlayerStorageValue(cid, 100079, 1)
		end
		
	else
		doTeleportThing(cid, fromPosition)
		doCreatureSay(cid,"You do not have access to Demon Forges...", TALKTYPE_ORANGE_1)
	end
	return TRUE
end
