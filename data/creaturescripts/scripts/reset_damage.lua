function onStatsChange(cid, attacker, type, combat, value)
    if not isPlayer(attacker) then return true end

    local reset = getPlayerStorageValue(attacker, STORAGE_RESET)
    if reset > 0 and RESET_TABLE[reset] and type == STATSCHANGE_HEALTHLOSS then
        local bonus = RESET_TABLE[reset].damage
        local extra = math.floor((value * bonus) / 100)
        doTargetCombatHealth(attacker, cid, combat, -extra, -extra, 255)
    end
    return true
end
