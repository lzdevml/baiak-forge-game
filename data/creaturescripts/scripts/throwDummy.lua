local dummy = {
	[13430] = 13442,
	[13431] = 13442,

	[13432] = 13443,
	[13433] = 13443,

	[13434] = 13444,
	[13435] = 13444
}
function onThrow(cid, item, fromPosition, toPosition)
	if dummy[item.itemid] then	
		if toPosition.y < 100 or (not getTileInfo(toPosition).house) then
			doSendMagicEffect(fromPosition, 2)
			doTransformItem(item.uid, dummy[item.itemid])
		end
	end
	return true
end