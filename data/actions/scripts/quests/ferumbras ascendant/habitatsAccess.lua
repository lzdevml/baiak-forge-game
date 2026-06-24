function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storageLiberaAcessoHabitats = Storage.FerumbrasAscension.storageLiberaAcessoHabitats
	if getPlayerStorageValue(cid, storageLiberaAcessoHabitats) ~= 1 then
		doTransformItem(itemEx.uid, 10045)
		setPlayerStorageValue(cid, storageLiberaAcessoHabitats, 1)
		addEvent(function()
			doTransformItem(getTileThingByPos({x = 33628, y = 32616, z = 11, stackpos = 1}).uid, 10044)
		end, 1000)
		if getPlayerStorageValue(cid, 1098016) == 1 then
			setPlayerStorageValue(cid, 1098016, 2)
		end
	else
		doSendMagicEffect(getCreaturePosition(cid),2)
	end
	return true
end