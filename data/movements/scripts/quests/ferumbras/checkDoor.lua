function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)

	local storageDoorTwo = 98006
	local storageDoor = 98003
	local storageTarbazNotes = 98004
	local storageTarbazDoor = 98008

	if getPlayerStorageValue(cid, storageDoor) == 1 and getPlayerStorageValue(cid, storageDoorTwo) == 1 and getPlayerStorageValue(cid, storageTarbazNotes) == 2 and getPlayerStorageValue(cid, storageTarbazDoor) == 1 then
		doCreatureSay(cid, "Your access has been released.", TALKTYPE_MONSTER_SAY)
		doSendMagicEffect(fromPosition, 14)
	else
		doPlayerSendTextMessage(cid, 22, "The door seems to be sealed against unwanted intruders.")
		doTeleportThing(cid,fromPosition)
		doSendMagicEffect(fromPosition, 2)
	end
	return true
end