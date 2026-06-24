function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storageFluteWall = Storage.FerumbrasAscension.storageFluteWall
	if getPlayerStorageValue(cid, storageFluteWall) ~= 1 then
		doPlayerAddItem(cid,2556,1)
		setPlayerStorageValue(cid, storageFluteWall, 1)
		doSendMagicEffect(toPosition,2)
	else
		doPlayerSendTextMessage(cid, 22, "You already got this item.")
	end
end