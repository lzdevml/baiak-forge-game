function onEquip(cid, item, slot, boolean)
    if getPlayerStorageValue(cid, WarConfigs.WarSSAMight) > 0 then
        return false
    elseif slot == CONST_SLOT_NECKLACE and getPlayerStorageValue(cid, WarConfigs.WarSSAMight) <= 0 then
        return true
    end
    return false
end