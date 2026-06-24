local count = 0

function onStatsChange(cid, attacker, type, combat, value)
    if string.lower(getCreatureName(cid)) == "lady tenebris" then
        if type == 1 and (getCreatureHealth(cid) <= getCreatureMaxHealth(cid)*0.12) then
            if count == 0 then
                doCreatureSay(cid, "Lady Tenebris begins to draw on the nightmares to HEAL himself!", TALKTYPE_MONSTER_SAY, nil, nil, getCreaturePosition(cid))
                count = count + 1
                addEvent(function()
                    if isMonster(cid) then
                        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
                        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
                        doCreatureSay(cid, "Lady Tenebris HEALS himself!", TALKTYPE_MONSTER_SAY, nil, nil, getCreaturePosition(cid))
                        count = 0
                    end
                end, 7000)
            end
        end
    end
    return true
end