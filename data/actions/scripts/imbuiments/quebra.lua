function onUse(cid, item, fromPosition, itemEx, toPosition)
	items = getContainerSize(item.uid)

	if items == 0 then
		doRemoveItem(item.uid)
		doSendMagicEffect(toPosition, 3)
		return true
	else
		return false
	end
end