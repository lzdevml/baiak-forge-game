function onGainExperience(cid, source, exp)
    local reset = getPlayerStorageValue(cid, STORAGE_RESET)
    if reset > 0 and RESET_TABLE[reset] then
        exp = exp + math.floor((exp * RESET_TABLE[reset].exp) / 100)
    end
    return exp
end
