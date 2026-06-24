-- simple quests based on uniqueId
-- to make quest create chest on map and set its uniqueId to id of quest item

function onUse(cid, item, frompos, item2, topos)


	if item. itemid == 1945 then
	doTransformItem(item.uid, item.itemid+1)
	end
	if item. itemid == 1945 then
	doTransformItem(item.uid, item.itemid+1)
	end


	if getPlayerItemCount(cid,2159) < 10 then
	doPlayerSendTextMessage(cid,25,"Você precisa de 10 event coin na BP para alterar descrição do item")
	doSendMagicEffect(getCreaturePos(cid),2)
	return true
	end

	local itemdesc = getThinFromPos({x=150,y=849,z=7,stackpos = 2})
	if itemdesc.itemid == 5907 then
	doItemSetAttribute(itemdesc.uid, "desc", "Item pertence a " .. getCreatureName(cid) .. ".")
	doPlayerRemoveItem(cid,2159,10)
	doSendMagicEffect(getCreaturePosition(cid),12)
	return true
	end


end