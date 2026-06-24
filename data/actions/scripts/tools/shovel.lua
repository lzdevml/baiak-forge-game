function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(isInArray(HOLES, itemEx.itemid)) then
		if(itemEx.itemid ~= 8579) then
			itemEx.itemid = itemEx.itemid + 1
		else
			itemEx.itemid = 8585
		end

		doTransformItem(itemEx.uid, itemEx.itemid)
		doDecayItem(itemEx.uid)
		return true
	end

	return false
end
