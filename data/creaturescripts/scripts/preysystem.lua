-- Prey System by Scriptzone
function onLogin(cid)
    registerCreatureEvent(cid, "PreySystem")
    registerCreatureEvent(cid, "PreySystemLeave")
    registerCreatureEvent(cid, "PreySystemCombat")
    registerCreatureEvent(cid, "PreySystemTarget")
    registerCreatureEvent(cid, "PreySystemKill")
    registerCreatureEvent(cid, "PreySystemStats")
    if getPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_config) == -1 then
        setPlayerPreyConfig(cid)
    end
    doPlayerOpenChannel(cid, PREY_CHANNEL_ID)
    setPlayerPreyChannelStatus(cid, 0)
    setPlayerPreyChannelStatus(cid, 1)
    
    
    local offlineTime = 0
    if playerHavePrey(cid) then
        if os.time() > getPlayerPreyEventId(cid) then
            offlineTime = os.time() - getPlayerLastLogout(cid)
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time, getPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time) + offlineTime)
        end
    end
    local checkFinalTime = getPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_time) - os.time() + offlineTime
    if checkFinalTime >= 0 then
        setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_time, checkFinalTime + os.time())
        local eventId = getPlayerPreyEventId(cid)
        addEvent(function()
            if isPlayer(cid) then
                if getPlayerPreyEventId(cid) == eventId then
                    doPlayerResetPreyConfig(cid)
                    doPlayerSendChannelMessage(cid, "", "Your prey stamina is over. Prey monster and bonus were reseted. Say 'start' to choose a monster.", TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID) 
                    setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_check, -1)
                    setPlayerPreyStamina(cid, 0)
                    setPlayerPreyEventId(cid, -1)
                end
            end
        end, checkFinalTime * 1000)
    end
    if isPreyChannelStatus(cid, 1) then
        setPlayerPreyChannelStatus(cid, 0)
    end
    return true
end

function onChannelJoin(cid, channelId, users)
    if(channelId ~= PREY_CHANNEL_ID) then
        return false
    end
    if getPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_config) == -1 then
        setPlayerPreyConfig(cid)
    end
    addEvent(function()
        if isPlayer(cid) then
            doPlayerSendChannelMessage(cid, "", "Welcome to your Prey System. For more information, visit our website: Sv.styller-Ots.com", TALKTYPE_CHANNEL_MANAGEMENT, PREY_CHANNEL_ID)
            doPlayerSendChannelMessage(cid, "", "[Prey System]: Say 'start' to see the list of monsters, 'monsters' to change the list of monsters, 'bonus' to change the type of the bonus, 'time' to see prey time left.", TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
            if getPlayerPreyMonster(cid) == 0 and getPlayerPreyBonusType(cid) ~= 0 then
                local bonusType = getPlayerPreyBonusType(cid)
                local bonusTypeName = PREY_TYPES_NAMES[bonusType]
                local bonusValue = getPlayerPreyBonusValue(cid)
                local bonusTabRange = PREY_SYSTEM.bonus_range[bonusType]
                local starsCount = getPreyStars(bonusTabRange[1], bonusTabRange[2], bonusValue)
                local starStr = string.rep("* ", starsCount)
                -- doPlayerSendChannelMessage(cid, "", "Current bonus type: " .. bonusTypeName .. " | Value: "..starStr.. "["..bonusValue.."%]", TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
            end
        end
    end, 200)
    if playerHavePrey(cid) then
        addEvent(function()
            if isPlayer(cid) then
                local monster = getPreyMonsterNameById(cid, getPlayerPreyMonster(cid))
                local str = "Active prey (Left: ".. getPlayerPreyLeftTime(cid) .."):\nMonster: ".. capitalizeAll(monster)
                local bonusType = getPlayerPreyBonusType(cid)
                local bonusTypeName = PREY_TYPES_NAMES[bonusType]
                str = str .. "\nBonus: "..bonusTypeName
                local minv, maxv = PREY_SYSTEM.bonus_range[bonusType][1], PREY_SYSTEM.bonus_range[bonusType][2]
                local bonusValue = getPlayerPreyBonusValue(cid)
                local stars = getPreyStars(minv, maxv, bonusValue)
                local starstr = string.rep("* ", stars)
                str = str .. "\nValue: " .. starstr .. "["..bonusValue.."%]"
                doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID) 
            end
        end, 201) 
    end
    return true
end

function onChannelLeave(cid, channelId, users)
    if(channelId ~= PREY_CHANNEL_ID) then
        return true
    end
    setPlayerPreyChannelStatus(cid, 1)
    return true
end

function onKill(cid, target, damage, flags)
    if not isPlayer(cid) or not isMonster(target) then return true end
    if isSummon(target) then return true end
    local mname = getCreatureName(target)
    local monster_exp = getMonsterInfo(mname).experience
    if monster_exp == 0 then return true end

    if isInArray(PREY_SYSTEM.monsters_ignored_list, mname:lower()) then return true end
    if playerHavePrey(cid) then
        usePlayerPreyStamina(cid)
    end    

    stage_Atual = getExperienceStage(getPlayerLevel(cid), getVocationInfo(getPlayerVocation(cid)).experienceMultiplier)
    return true
end

function onDeath(cid, corpse, deathList)
    if not isMonster(cid) then return true end
    if isSummon(cid) then return true end
    local mname = getCreatureName(cid)
    local monster_exp = getMonsterInfo(mname).experience
    if monster_exp == 0 then return true end
    if isInArray(PREY_SYSTEM.monsters_ignored_list, mname:lower()) then return true end
    local killers = deathList
    local mostDamageKiller = #killers > 1 and killers[2] or killers[1]
    if not isPlayer(mostDamageKiller) then 
        return true
    end
    if playerHavePrey(mostDamageKiller) then
        local preyMonsterId = getPlayerPreyMonster(mostDamageKiller)
        local preyMonsterName = getPreyMonsterNameById(mostDamageKiller, preyMonsterId)
        if preyMonsterName:lower() == mname:lower() then
            local p = getCreaturePosition(cid)
            local playerPreyBonusType = getPlayerPreyBonusType(mostDamageKiller)
            local playerPreyBonusValue = getPlayerPreyBonusValue(mostDamageKiller)
            if playerPreyBonusType == PREY_BONUS_XP then
                local exp_added = math.floor((playerPreyBonusValue * monster_exp * stage_Atual)/100)
                doPlayerAddExperience(mostDamageKiller, exp_added)
                doPlayerSendTextMessage(mostDamageKiller, MESSAGE_EVENT_DEFAULT, "You gained " .. exp_added .. " experience points due to prey bonus.")
                local color = PREY_TEXT_COLOR[playerPreyBonusType]
                --doSendAnimatedText(p, "Prey", color)
                doSendMagicEffect(p, 49)
            elseif playerPreyBonusType == PREY_IMPROVED_LOOT then
                local prey_corpse = corpse.uid
                local newRate = (1 + (playerPreyBonusValue/100)) * getConfigValue("rateLoot")
                local monsterLoot = getMonsterLootList(mname)
                for i, loot in pairs(monsterLoot) do
                    --print("Itemid: " .. loot.id .. " - ".. getItemNameById(loot.id) .." | Chance: " .. loot.chance*2 .. " | NewChance: " .. newRate * loot.chance)
                    local itemId = loot.id
                    if not isItemContainer(itemId) then
                        if math.random(1, 100000) <= newRate * loot.chance then 
                            if #PREY_SYSTEM.loot_ignored_list > 0 then
                                if (not isInArray(PREY_SYSTEM.loot_ignored_list, itemId)) then
                                    doAddContainerItem(prey_corpse, itemId, loot.countmax and math.random(1, loot.countmax) or 1)
                                end
                            else
                                doAddContainerItem(prey_corpse, itemId, loot.countmax and math.random(1, loot.countmax) or 1)
                            end
                        end
                    else
                        for j, item in pairs(loot.child) do                            
                            itemId = item.id
                            --print("(BAG) -> Itemid: " .. item.id .. " - ".. getItemNameById(item.id) .." | Chance: " .. item.chance*2 .. " | NewChance: " .. newRate * item.chance)
                            if math.random(1, 100000) <= newRate * item.chance then 
                                if #PREY_SYSTEM.loot_ignored_list > 0 then
                                    if (not isInArray(PREY_SYSTEM.loot_ignored_list, itemId)) then
                                        doAddContainerItem(prey_corpse, itemId, loot.countmax and math.random(1, item.countmax) or 1)
                                    end
                                else
                                    doAddContainerItem(prey_corpse, itemId, item.countmax and math.random(1, item.countmax) or 1)
                                end
                            end
                        end
                    end
                end 
                --print("**** Loot Bonus ***** ("..playerPreyBonusValue.."%)")
                if PREY_SYSTEM.bonus_message then
                    local color = PREY_TEXT_COLOR[playerPreyBonusType]
                    --doSendAnimatedText(p, "Prey", color)
                    doSendMagicEffect(p, 49)
                end
                doPlayerSendTextMessage(mostDamageKiller, MESSAGE_INFO_DESCR, "(boosted looted)")
            end
        end
    end
    return true
end

function onTarget(cid, target)
    if not isPlayer(cid) or not isMonster(target) then return true end
    if isSummon(target) then return true end
    if isInArray(PREY_SYSTEM.monsters_ignored_list, getCreatureName(target):lower()) then return true end    
    registerCreatureEvent(target, "PreySystemStats")
    registerCreatureEvent(target, "quickloot")
    return true
end

function onCombat(cid, target)
    if not isPlayer(cid) or not isMonster(target) then return true end
    if isSummon(target) then return true end
     if isInArray(PREY_SYSTEM.monsters_ignored_list, getCreatureName(target):lower()) then return true end
    registerCreatureEvent(target, "PreySystemStats")
    registerCreatureEvent(target, "quickloot")
    return true
end

function checkImbue(cid, typeStats, typeDamage)
    percentImbueProtect = {}
    percentImbueProtect[cid] = 0
    percentImbueDamage = {}
    percentImbueDamage[cid] = 0
    imbueTypeStats = {}
    imbueTypeStats[cid] = false
    if typeStats == "protection" then
        if typeDamage == COMBAT_ENERGYDAMAGE then
            if getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1) and getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage2) then
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1) + getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage2)
            else
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1) > 0 and getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage2)
            end
        elseif typeDamage == COMBAT_HOLYDAMAGE then
            if getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1) and getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage2) then
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1) + getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage2)
            else
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1) > 0 and getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage2)
            end
        elseif typeDamage == COMBAT_FIREDAMAGE then
            if getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1) and getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage2) then
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1) + getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage2)
            else
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1) > 0 and getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage2)
            end
        elseif typeDamage == COMBAT_DEATHDAMAGE then
            if getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1) and getPlayerStorageValue(cid, imbu_Bonus["death"].Storage2) then
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1) + getPlayerStorageValue(cid, imbu_Bonus["death"].Storage2)
            else
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1) > 0 and getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["death"].Storage2)
            end
        elseif typeDamage == COMBAT_ICEDAMAGE then
            if getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1) and getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage2) then
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1) + getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage2)
            else
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1) > 0 and getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage2)
            end
        elseif (typeDamage == COMBAT_POISONDAMAGE or typeDamage == COMBAT_EARTHDAMAGE) then
            if getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1) and getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage2) then
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1) + getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage2)
            else
                percentImbueProtect[cid] = getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1) > 0 and getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage2)
            end
        else 
            return percentImbueProtect[cid]
        end
        return (tonumber(percentImbueProtect[cid]) and percentImbueProtect[cid] or 0) > 0 and percentImbueProtect[cid] or 0
    elseif typeStats == "damage" then
        if getPlayerStorageValue(attacker, imbu_Bonus["strike"].Storage1) > 0 then
            local chance = math.random(1,100)
            if chance <= 15 then
                percentImbueDamage[cid] = getPlayerStorageValue(attacker, imbu_Bonus["strike"].Storage1)
            end
        end
        if getPlayerStorageValue(attacker, imbu_Bonus["electrify"].Storage1) > 0 and combat == 1 then
            percentImbueDamage[cid] = getPlayerStorageValue(attacker, imbu_Bonus["electrify"].Storage1)
            imbueTypeStats[cid] = COMBAT_ENERGYDAMAGE
        elseif getPlayerStorageValue(attacker, imbu_Bonus["frost"].Storage1) > 0 and combat == 1 then
            percentImbueDamage[cid] = getPlayerStorageValue(attacker, imbu_Bonus["frost"].Storage1)
            imbueTypeStats[cid] = COMBAT_ICEDAMAGE
        elseif getPlayerStorageValue(attacker, imbu_Bonus["reap"].Storage1) > 0 and combat == 1 then
            percentImbueDamage[cid] = getPlayerStorageValue(attacker, imbu_Bonus["reap"].Storage1)
            imbueTypeStats[cid] = COMBAT_DEATHDAMAGE
        elseif getPlayerStorageValue(attacker, imbu_Bonus["scorch"].Storage1) > 0 and combat == 1 then
            percentImbueDamage[cid] = getPlayerStorageValue(attacker, imbu_Bonus["scorch"].Storage1)
            imbueTypeStats[cid] = COMBAT_FIREDAMAGE
        elseif getPlayerStorageValue(attacker, imbu_Bonus["venom"].Storage1) > 0 and combat == 1 then
            percentImbueDamage[cid] = getPlayerStorageValue(attacker, imbu_Bonus["venom"].Storage1)
            imbueTypeStats[cid] = COMBAT_EARTHDAMAGE
        end
        return (tonumber(percentImbueDamage[cid]) and percentImbueDamage[cid] or 0) > 0 and percentImbueDamage[cid] or 0, imbueTypeStats[cid]
    end
end

local protect, protection = {}, {}
function onStatsChange(cid, attacker, type, combat, value)
    if not isCreature(cid) or not isCreature(attacker) then return true end
    if (isSummon(attacker) or isSummon(cid)) then return true end
    if (not isPlayer(cid) and isMonster(attacker)) or (not isPlayer(attacker) and isMonster(cid)) then return true end
    if isPlayer(cid) and isMonster(attacker) then
        local mname = getCreatureName(attacker)
        if not isInArray(PREY_SYSTEM.monsters_ignored_list, mname:lower()) then 
            if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and value >= 1 then
                if playerHavePrey(cid) then
                    usePlayerPreyStamina(cid)
                    local preyMonsterId = getPlayerPreyMonster(cid)
                    local preyMonsterName = getPreyMonsterNameById(cid, preyMonsterId)
                    if preyMonsterName:lower() == mname:lower() then
                        local playerPreyBonusType = getPlayerPreyBonusType(cid)
                        if playerPreyBonusType == PREY_DAMAGE_REDUCTION then
                            local playerPreyBonusValue = getPlayerPreyBonusValue(cid)
                            if playerPreyBonusValue > 0 then
                                if protect[attacker] then protect[attacker] = nil return true end
                                checkImbue(cid, "protection", combat)
                                if percentImbueProtect[cid]<0 then percentImbueProtect[cid] = 0 end
                                --print(playerPreyBonusValue .. " < Prey | Imbui > " .. percentImbueProtect[cid])
                                --[[
                                if getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage2) or getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage2) or getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage2) or getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["death"].Storage2) or getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage2) or getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage2) then
                                    local p, color = getPlayerPosition(cid), PREY_TEXT_COLOR[playerPreyBonusType]
                                    doSendMagicEffect(p, 67)
                                    return true
                                else   
                                ]]                             
                                value = (1 - ((0.01 * playerPreyBonusValue)+(0.01 * percentImbueProtect[cid]))) * value
                                protect[attacker] = true
                                doTargetCombatHealth(attacker, cid, combat, -value, -value, CONST_ME_NONE)
                                if PREY_SYSTEM.bonus_message then
                                    local p, color = getPlayerPosition(cid), PREY_TEXT_COLOR[playerPreyBonusType]
                                    --doSendAnimatedText(p, "prey", color)
                                    doSendMagicEffect(p, 67)
                                end
                                percentImbueProtect[cid] = 0
                                return false
                            end
                        end
                    end
                end 
            end
        end
    elseif isPlayer(attacker) and isMonster(cid) then
        local mname = getCreatureName(cid)
        if not isInArray(PREY_SYSTEM.monsters_ignored_list, mname:lower()) then 
            if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and value >= 1 then
                if playerHavePrey(attacker) then
                    usePlayerPreyStamina(attacker)
                    local preyMonsterId = getPlayerPreyMonster(attacker)
                    local preyMonsterName = getPreyMonsterNameById(attacker, preyMonsterId)
                    if preyMonsterName:lower() == mname:lower() then
                        local playerPreyBonusType = getPlayerPreyBonusType(attacker)
                        if playerPreyBonusType == PREY_DAMAGE_BOOST then
                            local playerPreyBonusValue = getPlayerPreyBonusValue(attacker)
                            if playerPreyBonusValue > 0 then
                                if protection[attacker] then protection[attacker] = nil return true end

                                if getPlayerStorageValue(cid, imbu_Bonus["strike"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["electrify"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["frost"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["reap"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["scorch"].Storage1) or getPlayerStorageValue(cid, imbu_Bonus["venom"].Storage1) then
                                    local p, color = getPlayerPosition(cid), PREY_TEXT_COLOR[playerPreyBonusType]
                                        doSendMagicEffect(p, 68)
                                        return true
                                else
                                    --checkImbue(cid, "damage", combat)
                                    value = (1 + (0.01 * playerPreyBonusValue)) * value
                                    protection[attacker] = true
                                    doTargetCombatHealth(attacker, cid, combat, -value, -value, CONST_ME_NONE)
                                    --local attackBonusImbuiment = math.ceil((value * percentImbueDamage[cid])/100)
                                    if PREY_SYSTEM.bonus_message then
                                        local p, color = getPlayerPosition(cid), PREY_TEXT_COLOR[playerPreyBonusType]
                                        --doSendAnimatedText(p, "prey", color)
                                        doSendMagicEffect(p, 68)
                                    end
                                    return false
                                end

                            end
                        end
                    end
                end
            end  
        end
    end
    return true
end