local storage = Storage.FerumbrasAscension.storageThethTile

function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	if item.actionid == 47030 and getPlayerStorageValue(cid, storage) ~= 1 then
		doPlayerAddItem(cid, 10601, 1)
		setPlayerStorageValue(cid, storage, 1)
		doSendMagicEffect(getCreaturePosition(cid), 9)
    	doPlayerSendCancel(cid, "You received vampire theth.")
	else
		doSendMagicEffect(getCreaturePosition(cid),2)
		doPlayerSendCancel(cid, "Empty.")
	end
end