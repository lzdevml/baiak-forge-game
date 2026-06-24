function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	if itemEx.itemid ~= 11893 then 
		return true 
	end
	if getThingfromPos({x = 33459, y = 32813, z = 13, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss1) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss1, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098014) == 5 then
			setPlayerStorageValue(cid, 1098014, 6)
		end
	elseif getThingfromPos({x = 33204, y = 31503, z = 13, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss2) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss2, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098015) == 5 then
			setPlayerStorageValue(cid, 1098015, 6)
		end
	elseif getThingfromPos({x = 33678, y = 32748, z = 12, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss3) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss3, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098016) == 5 then
			setPlayerStorageValue(cid, 1098016, 6)
		end
	elseif getThingfromPos({x = 33614, y = 32672, z = 14, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss4) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss4, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098017) == 3 then
			setPlayerStorageValue(cid, 1098017, 4)
		end
	elseif getThingfromPos({x = 33427, y = 32845, z = 12, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss5) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss5, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098013) == 11 then
			setPlayerStorageValue(cid, 1098013, 12)
		end
	elseif getThingfromPos({x = 33466, y = 32385, z = 13, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss6) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss6, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098019) == 6 then
			setPlayerStorageValue(cid, 1098019, 7)
		end
	elseif getThingfromPos({x = 33359, y = 32435, z = 13, stackpos = 1}).itemid == 11893 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss7) == 1 then
		setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss7, 2)
		setPlayerStorageValue(cid, 1098020, getPlayerStorageValue(cid, 1098020) + 1)
		doCreatureSay(cid,"Completed Access...", TALKTYPE_MONSTER_SAY)
		if getPlayerStorageValue(cid, 1098018) == 5 then
			setPlayerStorageValue(cid, 1098018, 6)
		end
	elseif getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss1) == 2 or getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss2) == 2 or getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss3) == 2 or getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss4) == 2 or	getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss5) == 2 or getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss6) == 2 or	getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss7) == 2 then
		doCreatureSay(cid,"You have already completed this access...", TALKTYPE_MONSTER_SAY)
	end
end