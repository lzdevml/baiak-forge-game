function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local storageFlute = Storage.FerumbrasAscension.storageFlute

	if getPlayerStorageValue(cid, storageFlute) >= 1 then
		return false
	end

	if not isInArea(getThingPos(cid),{x = 33477, y = 32775, z = 11},{x = 33493, y = 32781, z = 11}) then
		return false
	end

	if getCreatureName(itemEx.uid) == "Snake" or getCreatureName(itemEx.uid) == "Lion" or getCreatureName(itemEx.uid) == "Seagull" or getCreatureName(itemEx.uid) == "Bear" then
		local rand = math.random(0, 100)
		if rand <= 5 then
			doCreatureSay(cid,"Finally this one reveal your spirit animal.", TALKTYPE_MONSTER_SAY)
			setPlayerStorageValue(cid, storageFlute, 1)
			doPlayerRemoveItem(cid, 2556, 1)
			if getPlayerStorageValue(cid, 1098013) == 5 then
				setPlayerStorageValue(cid, 1098013, 6)
				setPlayerStorageValue(cid, 28725, 1)
			end
			return true
		elseif rand > 5 and rand <= 50 then
			doCreatureSay(cid,"This one has shaken its head. This probably means it\'s not your spirit animal.", TALKTYPE_MONSTER_SAY)
			return true
		elseif rand > 50 then
			doCreatureSay(cid, "This one\'s still unwilling reveal whether it\'s your spirit animal.", TALKTYPE_MONSTER_SAY)
			return true
		end
	elseif not isMonster() then
		doPlayerSendCancel(cid, "Impossible.")
		doSendMagicEffect(toPosition, 2)
	end
	return true
end