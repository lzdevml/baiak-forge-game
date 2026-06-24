function onEquip(cid, item, slot, boolean)
    if getPlayerStorageValue(cid, WarConfigs.WarSSAMight) > 0 then
        return false
    elseif slot == CONST_SLOT_RING and getPlayerStorageValue(cid, 46093) <= 0 then
        return true
    end
    return false
end