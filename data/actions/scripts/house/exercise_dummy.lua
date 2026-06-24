---@ list of training dummies.
local dummies = {
    [13429] = { skillRate = 1, skillSpeed = 1.2 },

    [13430] = { skillRate = 1, skillSpeed = 1.0 },
    [13431] = { skillRate = 1, skillSpeed = 1.0 },

    [13432] = { skillRate = 1, skillSpeed = 1.0 },
    [13433] = { skillRate = 1, skillSpeed = 1.0 },

    [13434] = { skillRate = 1, skillSpeed = 1.0 },
    [13435] = { skillRate = 1, skillSpeed = 1.0 }    
    
}

---@ Global training parameters of the system.
local staminaTries = 1 --# on minutes
local skillTries = 4 --# tries by blow
local skillSpent = function() return math.random(980, 1120) end --# mana consumed by blow
local stoTraining = 455918
---@ list of weapons to train.
local weapons = {
    [13456] = { shootEffect = 15, shootDistEffect = 3, skillType = SKILL_MAGLEVEL }, -- magicLevel Sorc
    [13454] = { shootEffect = 43, shootDistEffect = 36, skillType = SKILL_MAGLEVEL }, -- magicLevel Druid
    [13452] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ARROW, skillType = SKILL_DISTANCE }, -- distance
    [13455] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
    [13451] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe
    [13453] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB } -- club
}

---@ EDTE is the global event table to control the system correctly.
if not EDTE then EDTE = {} end

---@ functions to assign or obtain the training status of a player.
function getPlayerExerciseTrain(cid) return EDTE[cid] or false end
function setPlayerExerciseTrain(cid, status) EDTE[cid] = status return status end

---@ local training function.
local function exerciseDummyTrainEvent(params, weapon)

    if isPlayer(params.cid) then
        local stoPotion = getPlayerStorageValue(params.cid, 823505)
        local item = getPlayerItemById(params.cid, true, params.itemid)
        local playerPosition = getCreaturePosition(params.cid)
        local dummyCheck = dummies[getThingfromPos(params.dummyPos).itemid]

        if getDistanceBetween(playerPosition, params.currentPos) == 0 and item.uid ~= 0 and (stoPotion+4 < os.time()) and dummyCheck then
            local weaponCharges = getItemAttribute(item.uid, "charges") or getItemInfo(params.itemid).charges
            local reloadMs = getVocationInfo(getPlayerVocation(params.cid)).attackSpeed * params.dummy.skillSpeed
            if weaponCharges >= 1 then
            	doItemSetAttribute(item.uid, "charges", weaponCharges -1)
            	if weapon.shootDistEffect then doSendDistanceShoot(playerPosition, params.dummyPos, weapon.shootDistEffect) end
            	if weapon.shootEffect then doSendMagicEffect(params.dummyPos, weapon.shootEffect) end
                if weapon.skillType == SKILL_MAGLEVEL then
                    --doPlayerAddSpentMana(params.cid, (skillSpent() * params.dummy.skillRate) * getPlayerRates(params.cid)[SKILL__MAGLEVEL])
                    doPlayerAddSpentMana(params.cid, (skillSpent() * params.dummy.skillRate))
                else
                    doPlayerAddSkillTry(params.cid, weapon.skillType, (skillTries * params.dummy.skillRate))                    
                end
                doPlayerAddSkillTry(params.cid, SKILL_SHIELD, 1) -- SHIELD
                --local currentStamina = getPlayerStamina(params.cid)
                --doPlayerSetStamina(params.cid, currentStamina + staminaTries)
                setPlayerStorageValue(params.cid, stoTraining, os.time())
                if weaponCharges <= 1 then
                    exerciseDummyTrainEvent(params, weapon, cid)
                else
                    setPlayerExerciseTrain(params.cid, addEvent(exerciseDummyTrainEvent, reloadMs, params, weapon))
                end
            	return true
            else
                doRemoveItem(item.uid)
                doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "Your exercise weapon has expired, therefore your training too.")
            end
        else
            doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "You have finished your training.")
        end
    end
    return setPlayerExerciseTrain(params.cid, nil)
end

function onUse(cid, item, fromPos, target, toPos, isHotkey, itemEx)
    if item.itemid == 12688 then
        doPlayerPopupFYI(cid, "To start training, it is necessary to use an Exercise Weapon in the Dummy.")
    end
    if not target then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end


    if getHouseFromPos(toPos) and not getHouseFromPos(getCreaturePosition(cid)) then
        return doPlayerSendCancel(cid, "You need to be inside house.")
    end


    local playerPosition = getCreaturePosition(cid)
    if not getTileInfo(playerPosition).protection then
        return doPlayerSendCancel(cid, "You can only train in protection zone.")
    end
    local dummy = dummies[target.itemid]
    local weapon = weapons[item.itemid]
    if not weapon or not dummy then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTUSETHISOBJECT)
    end
    local dummyPosition = getThingPosition(target.uid)
    if getDistanceBetween(playerPosition, dummyPosition) > 1 and (weapons[item.itemid].skillType == SKILL_SWORD or weapons[item.itemid].skillType == SKILL_AXE or weapons[item.itemid].skillType == SKILL_CLUB) then
        return doPlayerSendCancel(cid, "Get closer to the dummy.")
    end
    if weapons[item.itemid].skillType == SKILL_SWORD or weapons[item.itemid].skillType == SKILL_CLUB or weapons[item.itemid].skillType == SKILL_AXE then
        if getPlayerVocation(cid) ~= 4 and getPlayerVocation(cid) ~= 8 then
            doPlayerSendCancel(cid, "This weapon is only for knights.")
            return true
        end
    elseif weapons[item.itemid].shootEffect == 43 then
        if getPlayerVocation(cid) ~= 2 and getPlayerVocation(cid) ~= 6 then
            doPlayerSendCancel(cid, "This weapon is only for Druids.")
            return true
        end
        --[[
    elseif weapons[item.itemid].shootEffect == 15 then
        if getPlayerVocation(cid) ~= 1 and getPlayerVocation(cid) ~= 5 then
            doPlayerSendCancel(cid, "This weapon is only for Sorcerers.")
            return true
        end]]
    elseif weapons[item.itemid].skillType == SKILL_DISTANCE then
        if getPlayerVocation(cid) ~= 3 and getPlayerVocation(cid) ~= 7 then
            doPlayerSendCancel(cid, "This weapon is only for Paladins.")
            return true
        end
    end

    if getPlayerStorageValue(cid, 823505)+5 > os.time() then
        doPlayerSendCancel(cid, "You must wait a few seconds to start training.")
        doSendMagicEffect(toPos, 2)
        return true
    end
	if not getPlayerExerciseTrain(cid) then
	    local params = {}
	    params.cid = cid
	    params.currentPos = playerPosition
	    params.dummyPos = dummyPosition
	    params.item = item.uid
	    params.itemid = item.itemid
	    params.dummy = dummy
	    exerciseDummyTrainEvent(params, weapon)
	    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have started training with dummy.")
	else
	    doPlayerSendCancel(cid, "You cannot start two training sessions at the same time.")
	end
    return true
end