function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local storage = GlobalStorage.FerumbrasAscension.storageEstatua

	if getGlobalStorageValue(storage) < 1 then
		doTransformItem(getTileThingByPos({x = 33417, y = 32381, z = 12, stackpos = 2}).uid, 3697)
		setGlobalStorageValue(storage, 1)
		addEvent(function()
			doTransformItem(getTileThingByPos(fromPosition).uid, 3698)
			setGlobalStorageValue(storage, 0)
		end, 60000)
	else

	end
end