function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local storageFireBug = Storage.FerumbrasAscension.storageFireBug
	local storageTarbazNotes = Storage.FerumbrasAscension.storageTarbazNotes
	if itemEx.actionid == 47002 and getPlayerStorageValue(cid, storageTarbazNotes) < 1 then
		if getPlayerStorageValue(cid, storageFireBug) ~= 8 then
			return false
		end
		doPlayerSendTextMessage(cid, 22, "Suddenly, you see the big picture. It all makes sense now. And then you despair.")
		setPlayerStorageValue(cid, storageTarbazNotes, 1)
		doSendMagicEffect(toPosition, CONST_ME_ENERGYAREA)
	elseif itemEx.actionid == 47003 and getPlayerStorageValue(cid, storageTarbazNotes) < 2 then
		if getPlayerStorageValue(cid, storageFireBug) ~= 8 and getPlayerStorageValue(cid, storageTarbazNotes) == 1 then
			return false
		end
		doPlayerSendTextMessage(cid, 22, "Suddenly, you see the latter A. It all makes sense now. And then you now the secret.")
		setPlayerStorageValue(cid, storageTarbazNotes, 2)
		doSendMagicEffect(toPosition, CONST_ME_ENERGYAREA)
		if getPlayerStorageValue(cid, 1098013) == 8 then
			setPlayerStorageValue(cid, 1098013, 9)
		end
	end
	return true
end