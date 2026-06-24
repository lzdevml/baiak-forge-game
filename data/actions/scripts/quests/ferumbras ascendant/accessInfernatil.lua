function onUse(cid, item, fromPosition, itemEx, toPosition)

	local pos = {x = 33591, y = 32658, z = 14}

	if item.actionid == 47020 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.acessoInfernatil) == 2 then
		doTransformItem(itemEx.uid, 10030)
		doTeleportThing(cid, pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		addEvent(function()
			doTransformItem(getTileThingByPos({x = 33671, y = 32688, z = 13, stackpos = 1}).uid, 10029)
		end, 2000)
	elseif item.actionid == 47021 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.acessoInfernatil) == 2 then
		doTransformItem(getTileThingByPos({x = 33672, y = 32688, z = 13, stackpos = 1}).uid, 10030)
		doTeleportThing(cid, pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		addEvent(function()
			doTransformItem(getTileThingByPos({x = 33672, y = 32688, z = 13, stackpos = 1}).uid, 10029)
		end, 2000)
	elseif item.actionid == 47022 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.acessoInfernatil) == 2 then
		doTransformItem(getTileThingByPos({x = 33673, y = 32688, z = 13, stackpos = 1}).uid, 10030)
		doTeleportThing(cid, pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		addEvent(function()
			doTransformItem(getTileThingByPos({x = 33673, y = 32688, z = 13, stackpos = 1}).uid, 10029)
		end, 2000)
	else
		doPlayerSendCancel(cid, "You didn't complete the puzzle")
	end

end
