function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local storageDoorTwo = Storage.FerumbrasAscension.storageDoorTwo
	local storageColorLever = Storage.FerumbrasAscension.storageColorLever
	if getPlayerStorageValue(cid, storageDoorTwo) >= 1 and getPlayerStorageValue(cid, 320987) <= os.time() then
		doTransformItem(itemEx.uid, 10045)
		setPlayerStorageValue(cid,320987,os.time()+5)
		doCreatureSay(cid,"You already completed this puzzle.", TALKTYPE_MONSTER_SAY)
		addEvent(function()
			doTransformItem(getTileThingByPos({x = 33451, y = 32779, z = 11, stackpos = 1}).uid, 10044)
			doTransformItem(getTileThingByPos({x = 33448, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			doTransformItem(getTileThingByPos({x = 33450, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			doTransformItem(getTileThingByPos({x = 33452, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			doTransformItem(getTileThingByPos({x = 33454, y = 32804, z = 10, stackpos = 1}).uid, 10044)
		end, 5000)
		setPlayerStorageValue(cid,320987,os.time()+5)
		return true
	end
	if item.actionid == 47004 and getPlayerStorageValue(cid, 320987) <= os.time() then
		if getPlayerStorageValue(cid, storageColorLever) < 1 then
			setPlayerStorageValue(cid,320987,os.time()+5)
			local rand = math.random(1, 4)
			setPlayerStorageValue(cid, storageColorLever, rand)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			if getPlayerStorageValue(cid, storageColorLever) == 1 then
				doCreatureSay(cid,"You choose the colour of decay [RED].", TALKTYPE_MONSTER_SAY)
			elseif getPlayerStorageValue(cid, storageColorLever) == 2 then
				doCreatureSay(cid,"You choose the colour of decay [ORANGE].", TALKTYPE_MONSTER_SAY)
			elseif getPlayerStorageValue(cid, storageColorLever) == 3 then
				doCreatureSay(cid,"You choose the colour of decay [GREEN].", TALKTYPE_MONSTER_SAY)
			elseif getPlayerStorageValue(cid, storageColorLever) == 4 then
				doCreatureSay(cid,"You choose the colour of decay [BLUE].", TALKTYPE_MONSTER_SAY)
			end
			doTransformItem(itemEx.uid, 10045)
			addEvent(function()
				doTransformItem(getTileThingByPos({x = 33451, y = 32779, z = 11, stackpos = 1}).uid, 10044)
			end, 5000)
			return true
		end
	elseif item.actionid == 47005 then --red
		if getPlayerStorageValue(cid, storageColorLever) == 1 then
			setPlayerStorageValue(cid, storageDoorTwo, 1)
			setPlayerStorageValue(cid, 38724, 1)
			doCreatureSay(cid,"You select the correct colour.", TALKTYPE_MONSTER_SAY)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			doTransformItem(itemEx.uid, 10045)
			setPlayerStorageValue(cid,320987,os.time()+5)
			if getPlayerStorageValue(cid, 1098013) == 4 then
				setPlayerStorageValue(cid, 1098013, 5)
			end
			addEvent(function()
				doTransformItem(getTileThingByPos({x = 33448, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			end, 5000)
		else
			setPlayerStorageValue(cid,320987,os.time()+5)
			doCreatureSay(cid,"This is incorrect lever.", TALKTYPE_MONSTER_SAY)
		end
	elseif item.actionid == 47006 then --green
		if getPlayerStorageValue(cid, storageColorLever) == 3 then
			setPlayerStorageValue(cid, storageDoorTwo, 1)
			setPlayerStorageValue(cid, 38724, 1)
			doCreatureSay(cid,"You select the correct colour.", TALKTYPE_MONSTER_SAY)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			doTransformItem(itemEx.uid, 10045)
			setPlayerStorageValue(cid,320987,os.time()+5)
			if getPlayerStorageValue(cid, 1098013) == 4 then
				setPlayerStorageValue(cid, 1098013, 5)
			end
			addEvent(function()
				doTransformItem(getTileThingByPos({x = 33450, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			end, 5000)
		else
			setPlayerStorageValue(cid,320987,os.time()+5)
			doCreatureSay(cid,"This is incorrect lever.", TALKTYPE_MONSTER_SAY)
		end
	elseif item.actionid == 47007 then --blue
		if getPlayerStorageValue(cid, storageColorLever) == 4 then
			setPlayerStorageValue(cid, storageDoorTwo, 1)
			setPlayerStorageValue(cid, 38724, 1)
			doCreatureSay(cid,"You select the correct colour.", TALKTYPE_MONSTER_SAY)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			doTransformItem(itemEx.uid, 10045)
			setPlayerStorageValue(cid,320987,os.time()+5)
			if getPlayerStorageValue(cid, 1098013) == 4 then
				setPlayerStorageValue(cid, 1098013, 5)
			end
			addEvent(function()
				doTransformItem(getTileThingByPos({x = 33452, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			end, 5000)
		else
			setPlayerStorageValue(cid,320987,os.time()+5)
			doCreatureSay(cid,"This is incorrect lever.", TALKTYPE_MONSTER_SAY)
		end
	elseif item.actionid == 47008 then --orange
		if getPlayerStorageValue(cid, storageColorLever) == 2 then
			setPlayerStorageValue(cid, storageDoorTwo, 1)
			setPlayerStorageValue(cid, 38724, 1)
			doCreatureSay(cid,"You select the correct colour.", TALKTYPE_MONSTER_SAY)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
			doTransformItem(itemEx.uid, 10045)
			setPlayerStorageValue(cid,320987,os.time()+5)
			if getPlayerStorageValue(cid, 1098013) == 4 then
				setPlayerStorageValue(cid, 1098013, 5)
			end
			addEvent(function()
				doTransformItem(getTileThingByPos({x = 33454, y = 32804, z = 10, stackpos = 1}).uid, 10044)
			end, 5000)
		else
			setPlayerStorageValue(cid,320987,os.time()+5)
			doCreatureSay(cid,"This is incorrect lever.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
