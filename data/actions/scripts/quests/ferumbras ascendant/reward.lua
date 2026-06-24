local items = {
	{itemid = 12642, count = 4},
	{itemid = 25431, count = 1},
	{itemid = 2160, count = 10},
	{itemid = 25172, count = 5}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1746 then
		return false
	end

	if getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageReward) >= 1 then
		doPlayerSendTextMessage(cid, 25, "The treasure chest is empty.")
		return true
	end

	setPlayerStorageValue(cid, 79009, 0) -- Rift Outfit
	--addOutfitAddon(852, 3)
	--addOutfitAddon(846, 3)
	
	local bag
	if getPlayerFreeCap(cid) < 65 then
		doPlayerSendCancel(cid, "You have found a bag, but you have no room to take it.")
		return true
	else
		bag = doPlayerAddItem(cid, 1988, 1)
	end

	local checking_backpack = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)                
    if checking_backpack.uid == 0 then
    	selfSay('There is not enough room.', cid)
        return true
    else
        local slots_free = getAllContainerFree(checking_backpack.uid)
        if slots_free == 0 then
        	selfSay('There is not enough room.', cid)
            return true
        end
    end 

	for i = 1, #items do
		doAddContainerItem(bag, items[i].itemid, items[i].count)
	end
	doSendMagicEffect(getCreaturePosition(cid), 49)
	setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageReward, 1)
	return true

end
