function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
		if item.itemid == 12656 then
			doTransformItem(item.uid, 12657)
			if getPlayerStorageValue(cid, 1098014) == 3 then
				setPlayerStorageValue(cid, 1098014, 4)
			end
		elseif item.itemid == 12657 then
			doTransformItem(item.uid, 12658)
			if getPlayerStorageValue(cid, 1098014) == 3 then
				setPlayerStorageValue(cid, 1098014, 4)
			end
		elseif item.itemid == 12658 then
			doTransformItem(item.uid, 12659)
			if getPlayerStorageValue(cid, 1098014) == 3 then
				setPlayerStorageValue(cid, 1098014, 4)
			end
		elseif item.itemid == 12659 then
			doTransformItem(item.uid, 12656)
			if getPlayerStorageValue(cid, 1098014) == 3 then
				setPlayerStorageValue(cid, 1098014, 4)
			end
		end
	end
	return true
end