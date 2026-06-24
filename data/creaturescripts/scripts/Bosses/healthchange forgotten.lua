local healPercentage = 0.10  -- 10% de cura

local count = 0

function onStatsChange(cid, attacker, type, combat, value)
    if string.lower(getCreatureName(cid)) == "lady tenebris" then
        if type == 1 and (getCreatureHealth(cid) <= getCreatureMaxHealth(cid) * (1 - healPercentage)) then
            if count == 0 then
                doCreatureSay(cid, "Lady Tenebris HEALS HAHAHAHAHAHA!", TALKTYPE_MONSTER_SAY, nil, nil, getCreaturePosition(cid))
                count = count + 1
                addEvent(function()
                    if isMonster(cid) then
                        local healAmount = math.floor(getCreatureMaxHealth(cid) * healPercentage)
                        doCreatureAddHealth(cid, healAmount)
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
                        doCreatureSay(cid, "Lady Tenebris HEALS himself for " .. healAmount .. " health points!", TALKTYPE_MONSTER_SAY, nil, nil, getCreaturePosition(cid))
                        count = 0
                    end
                end, 7000)
            end
        end
    end
    return true
end
