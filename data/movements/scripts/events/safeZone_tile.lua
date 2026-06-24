function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(not isPlayer(cid)) then
		return true
	end
	
	doCreateItem(1548, 1, getCreaturePosition(cid))
	return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(not isPlayer(cid)) then
		return true
	end

	local protectTile = getTileItemById(lastPosition, 1548)
	if protectTile.uid > 0 then
		doRemoveItem(protectTile.uid)
	end
	return true
end