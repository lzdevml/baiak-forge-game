function onLogin(cid)
    registerCreatureEvent(cid, "ResetExp")
    registerCreatureEvent(cid, "ResetDamage")

    local reset = getPlayerStorageValue(cid, STORAGE_RESET)
    if reset > 0 and RESET_TABLE[reset] then
        local bonus = RESET_TABLE[reset].life
        setCreatureMaxHealth(cid,
            getCreatureMaxHealth(cid) + math.floor(getCreatureMaxHealth(cid) * bonus / 100))
        setCreatureMaxMana(cid,
            getCreatureMaxMana(cid) + math.floor(getCreatureMaxMana(cid) * bonus / 100))
    end
    return true
end
