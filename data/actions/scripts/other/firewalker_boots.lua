local ITEM_ID = {
	[10022] = 9933
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if (item.itemid == 10022) then 
		if getPlayerMoney(cid) >= 20000 then
			if doPlayerRemoveMoney(cid, 20000) then
				local pos = getThingPos(cid)    
				doSendMagicEffect(pos, CONST_ME_FIREWORK_RED)
				doTransformItem(item.uid, ITEM_ID[item.itemid])
			else
				doPlayerSendCancel(cid, "ERROR! Please contact the administrator.")
			end
		else
			doPlayerSendCancel(cid, "You need 20000golds (20k).")
		end
	else
		doPlayerSendCancel(cid, "You cannot use this object.") 
	end
	return true
end
