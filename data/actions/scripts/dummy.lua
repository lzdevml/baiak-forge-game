---@ list of training ids dummies.
local dummies = {
    [13429] = { skillRate = 1.0, skillSpeed = 2 },
    [13430] = { skillRate = 1.0, skillSpeed = 1 },
    [13431] = { skillRate = 1.0, skillSpeed = 1 },
    [13432] = { skillRate = 1.0, skillSpeed = 1 },
    [13433] = { skillRate = 1.0, skillSpeed = 1 },
    [13434] = { skillRate = 1.0, skillSpeed = 1 },
    [13435] = { skillRate = 1.0, skillSpeed = 1 }
}

---@ Global training parameters of the system.
local staminaTries = 1 --# on minutes
local skillTries = 7 --# tries by blow
local skillSpent = function() return math.random(425, 575) end --# mana consumed by blow
local slotForUse = CONST_SLOT_HAND

---@ list of weapons to train.
local weapons = {
    [13441] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_POISON, skillType = SKILL_MAGLEVEL }, -- magicLevel Dru
    [13448] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_POISON, skillType = SKILL_MAGLEVEL }, -- magicLevel Dru
    [13454] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_POISON, skillType = SKILL_MAGLEVEL }, -- magicLevel Dru	
	
    [13440] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ENERGY, skillType = SKILL_MAGLEVEL }, -- magicLevel Sor
    [13450] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ENERGY, skillType = SKILL_MAGLEVEL }, -- magicLevel Sor
    [13456] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ENERGY, skillType = SKILL_MAGLEVEL }, -- magicLevel Sor
	
    [13437] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ARROW, skillType = SKILL_DISTANCE }, -- distance
    [13446] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ARROW, skillType = SKILL_DISTANCE }, -- distance
    [13452] = { shootEffect = CONST_ME_HITAREA, shootDistEffect = CONST_ANI_ARROW, skillType = SKILL_DISTANCE }, -- distance
	
    [13439] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
    [13449] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
    [13455] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_SWORD }, -- sword
	
    [13436] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe
    [13445] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe
    [13436] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_AXE }, -- axe	
	
    [13438] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB }, -- club
    [13447] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB }, -- club
    [13453] = { shootEffect = CONST_ME_HITAREA, skillType = SKILL_CLUB } -- club	
}

---@ EDTE is the global event table to control the system correctly.
if not EDTE then EDTE = {} end

---@ functions to assign or obtain the training status of a player.
function getPlayerExerciseTrain(cid) return EDTE[cid] or false end
function setPlayerExerciseTrain(cid, status) EDTE[cid] = status return status end

---@ local training function.
local function exerciseDummyTrainEvent(params, weapon)
    if isPlayer(params.cid) and getPlayerSlotItem(params.cid, CONST_SLOT_LEFT).itemid == params.itemid then -- patch
        local item = getPlayerItemById(params.cid, true, params.itemid)
        local playerPosition = getCreaturePosition(params.cid)
        if getDistanceBetween(playerPosition, params.currentPos) == 0 then
            local weaponCharges = getItemAttribute(item.uid, "charges") or getItemInfo(params.itemid).charges
            local reloadMs = getVocationInfo(getPlayerVocation(params.cid)).attackSpeed * params.dummy.skillSpeed
            if weaponCharges >= 1 then
                doItemSetAttribute(item.uid, "charges", weaponCharges -1)
                if weapon.shootDistEffect then doSendDistanceShoot(playerPosition, params.dummyPos, weapon.shootDistEffect) end
                if weapon.shootEffect then doSendMagicEffect(params.dummyPos, weapon.shootEffect) end
                if weapon.skillType == SKILL_MAGLEVEL then
                    doPlayerAddSpentMana(params.cid, (skillSpent() * params.dummy.skillRate) * getConfigValue("rateMagic"))
                else
                if weapon.skillType == SKILL_NONE then
                return false
              
                else
                    doPlayerAddSkillTry(params.cid, weapon.skillType, (skillTries * params.dummy.skillRate) * getConfigValue("rateSkill"))
                end
                end
                local currentStamina = getPlayerStamina(params.cid)
                doPlayerSetStamina(params.cid, currentStamina + staminaTries)
                if weaponCharges <= 1 then
                    exerciseDummyTrainEvent(params, weapon)
                else
                    setPlayerExerciseTrain(params.cid, addEvent(exerciseDummyTrainEvent, reloadMs, params, weapon))
                end
                return true
            else
                setPlayerStorageValue(params.cid, 9979891, 0)
                doRemoveItem(item.uid)
                doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "Your exercise weapon has expired, therefore your training too.")
            end
        else
            doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "You have finished your training.")
        end
        else
        doPlayerSendTextMessage(params.cid, MESSAGE_EVENT_ADVANCE, "Put weapon in your right hand.")
        return false
    end
    return setPlayerExerciseTrain(params.cid, nil)
end

function onUse(cid, item, fromPos, target, toPos, isHotkey)
    if not target then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
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
    if getDistanceBetween(playerPosition, dummyPosition) > 1 then
        return doPlayerSendDefaultCancel(cid, RETURNVALUE_THEREISNOWAY)
    end
    if not getPlayerExerciseTrain(cid) then
        setPlayerStorageValue(cid, 9979891, 1)
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
        doPlayerSendCancel(cid, "Por favor, relogue.")
    end
    return true
end