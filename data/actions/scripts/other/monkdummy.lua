local CONSTRUCTIONS = {
	[13430] = 13442,[13431] = 13442,[13432] = 13443,[13433] = 13443, [13434] = 13444, [13435] = 13444
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x == CONTAINER_POSITION) then
		doPlayerSendCancel(cid, "Put the construction kit on the floor first.")
	elseif(not getTileInfo(fromPosition).house) then
		doPlayerSendCancel(cid,"You may construct this only inside a house.")		
	elseif(CONSTRUCTIONS[item.itemid] ~= nil) then
		doTransformItem(item.uid, CONSTRUCTIONS[item.itemid])
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	else
		return false
	end

	return true
end
