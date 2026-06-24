function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local storageFonte = Storage.FerumbrasAscension.storageFonte
	local storageEstatua = GlobalStorage.FerumbrasAscension.storageEstatua

	if getGlobalStorageValue(storageEstatua) == 1 and item.actionid == 47024 and getPlayerStorageValue(cid, storageFonte) < 1 then
		if doPlayerRemoveItem(cid, 2230, 1) then
			setPlayerStorageValue(cid, storageFonte, 1)
			doSendMagicEffect(toPosition, 14)
		else
			doCreatureSay(cid, "You don't have bones.", TALKTYPE_MONSTER_SAY)
		end
	elseif getGlobalStorageValue(storageEstatua) == 1 and item.actionid == 47024 and getPlayerStorageValue(cid, storageFonte) == 1 then
		if doPlayerRemoveItem(cid, 2747, 1) then
			setPlayerStorageValue(cid, storageFonte, 2)
			doSendMagicEffect(toPosition, 14)
		else
			doCreatureSay(cid, "You don't have flower.", TALKTYPE_MONSTER_SAY)
		end
	elseif getGlobalStorageValue(storageEstatua) == 1 and item.actionid == 47024 and getPlayerStorageValue(cid, storageFonte) == 2 then
		if doPlayerRemoveItem(cid, 12624, 1) then
			setPlayerStorageValue(cid, storageFonte, 3)
			doSendMagicEffect(toPosition, 14)
		else
			doCreatureSay(cid, "You don't have a ring.", TALKTYPE_MONSTER_SAY)
		end
	elseif getGlobalStorageValue(storageEstatua) == 1 and item.actionid == 47024 and getPlayerStorageValue(cid, storageFonte) == 3 then
		if doPlayerRemoveItem(cid, 1968, 1) then
			setPlayerStorageValue(cid, storageFonte, 4)
			doSendMagicEffect(toPosition, 14)
		else
			doCreatureSay(cid, "You don't have a document.", TALKTYPE_MONSTER_SAY)
		end
	elseif getGlobalStorageValue(storageEstatua) == 1 and item.actionid == 47024 and getPlayerStorageValue(cid, storageFonte) == 4 then
		if doPlayerRemoveItem(cid, 10601, 1) then
			setPlayerStorageValue(cid, storageFonte, 5)
			if getPlayerStorageValue(cid, 1098019) == 3 then
				setPlayerStorageValue(cid, 1098019, 4)
			end
			doSendMagicEffect(toPosition, 14)
			doTransformItem(getThingfromPos({x = 33423, y = 32386, z = 12, stackpos = 1}).uid, 3735)
			doTransformItem(getThingfromPos({x = 33423, y = 32385, z = 12, stackpos = 1}).uid, 3733)
			doTransformItem(getThingfromPos({x = 33424, y = 32386, z = 12, stackpos = 1}).uid, 3736)
			doTransformItem(getThingfromPos({x = 33424, y = 32385, z = 12, stackpos = 1}).uid, 3734)
			addEvent(function()
				doTransformItem(getThingfromPos({x = 33423, y = 32386, z = 12, stackpos = 1}).uid, 3731)
				doTransformItem(getThingfromPos({x = 33423, y = 32385, z = 12, stackpos = 1}).uid, 3729)
				doTransformItem(getThingfromPos({x = 33424, y = 32386, z = 12, stackpos = 1}).uid, 3732)
				doTransformItem(getThingfromPos({x = 33424, y = 32385, z = 12, stackpos = 1}).uid, 3730)
			end, 2000)
		else
			doCreatureSay(cid, "You don't have a vampire theth.", TALKTYPE_MONSTER_SAY)
		end
	elseif getPlayerStorageValue(cid, storageFonte) == 5 then
		doSendMagicEffect(toPosition, 2)
		doCreatureSay(cid, "Completed.", TALKTYPE_MONSTER_SAY)
	end
end