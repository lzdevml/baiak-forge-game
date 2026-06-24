function onUse(cid, item, fromPosition, itemEx, toPosition)
    removals = {
        { item = 1304, pos = {x = 244, y = 500, z = 10} },  
    }
    local pos = {x = 244, y = 500, z = 10}
	local newpos = {x = 246, y = 499, z = 10}
    if item.itemid == 1945 then
        for i = 1, #removals do
            removals[i].pos.stackpos = 1
            doRemoveItem(getThingfromPos(removals[i].pos).uid, 1)
			doSendMagicEffect(pos,2)
        end
        doTransformItem(item.uid, item.itemid + 1)
    elseif item.itemid == 1946 then
        for i = 1, #removals do
            doCreateItem(removals[i].item, 1, removals[i].pos)
			doSendMagicEffect(pos,2)
        end
		pos.stackpos = 253
		if getThingFromPos(pos).itemid > 0 then
		doTeleportThing(cid, newpos)
		doSendMagicEffect(getCreaturePosition(cid),10)
		end
        doTransformItem(item.uid, item.itemid - 1)
    end
    return TRUE
end  