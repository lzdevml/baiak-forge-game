-- Prey System by Scriptzone

PREY_CHANNEL_ID = 10

-- Constants

PREY_DAMAGE_BOOST = 1
PREY_DAMAGE_REDUCTION = 2
PREY_BONUS_XP = 3
PREY_IMPROVED_LOOT = 4

PREY_TYPE = 1
PREY_BONUS_VALUE = 2
PREY_STAMINA = 3
PREY_MONSTER = 4

PREY_TYPES_NAMES = {
    [PREY_DAMAGE_BOOST] = "Damage Boost",
    [PREY_DAMAGE_REDUCTION] = "Damage Reduction",
    [PREY_BONUS_XP] = "Experience",
    [PREY_IMPROVED_LOOT] = "Improved Loot"
}

PREY_TEXT_COLOR = {
    [PREY_DAMAGE_BOOST] = COLOR_ORANGE,
    [PREY_DAMAGE_REDUCTION] = COLOR_TEAL,
    [PREY_BONUS_XP] = COLOR_MAYABLUE,
    [PREY_IMPROVED_LOOT] = COLOR_LIGHTGREEN
}


PREY_SYSTEM = { 

    monsters_config = {
    
        [{0, 50}] = {"amazon", "giant spider", "cyclops", "cyclops drone", "witch", "valkyrie", "bug", "poacher", "hunter", "bear", "cyclops smith", "dragon"},
        
        [{51, 150}] = {"elf arcanist", "bog raider", "dragon lord", "giant spider", "minotaur mage", "dwarf guard", "frost dragon", "dragon hatchling", "hellspawn", "energy elemental", "dragon", "hydra", "blue djinn", "green djinn", "behemoth", "nightmare", "infernalist", "wyrm", "grim reaper"},
        
        [{151, 250}] = {"demon", "nightmare", "plaguesmith", "hydra", "serpent spawn", "frost dragon", "dragon lord", "medusa", "hellspawn", "defiler", "phantasm", "wyrm", "infernalist", "warlock", "midnight asura", "dawnfire asura", "Blood Beast", "Devourer", "Glooth Blob", "Rot Elemental", "Minotaur Hunter", "Mooh'Tah Warrior", "Worm Priestess", "Minotaur Amazon", "Guzzlemaw"},

        [{251, math.huge}] = {"demon", "nightmare", "plaguesmith", "lost soul", "diabolic imp", "destroyer", "dark torturer", "hydra", "serpent spawn", "frost dragon", "dragon lord", "medusa", "hellspawn", "defiler", "phantasm", "hellfire fighter", "wyrm", "infernalist", "juggernaut", "grim reaper", "warlock", "fury", "undead dragon", "midnight asura", "dawnfire asura", "true frost flower asura", "true dawnfire asura", "true midnight asura", "Blood Beast", "Devourer", "Glooth Blob", "Rot Elemental", "Minotaur Hunter", "Mooh'Tah Warrior", "Worm Priestess", "Minotaur Amazon"}
    },
    
    monsters_ignored_list = {"training monk", "trainer"},
    
    player_number_of_options = 5,
        
    stamina = {2, "hour"},
    
    bonus_range = {
        [PREY_DAMAGE_BOOST] = {5, 25},
        [PREY_DAMAGE_REDUCTION] = {5, 20},
        [PREY_BONUS_XP] = {5, 28},
        [PREY_IMPROVED_LOOT] = {5, 40}
    },
    
    bonus_message = true,
    
    list_reroll_time = {20, "hour"},
    list_reroll_price = 950, -- per level
    
    bonus_reroll_price = 1000, -- per level
    
    loot_ignored_list = {},
    
    storages = {
        listreroll = 87620,
        prey_config = 87621,
        prey_stamina_time = 87622,
        final_stamina_time = 87623,
        final_stamina_check = 87624,
        channel_status = 87625,
        eventfinish = 87626,
        channel_exhausted = 87627
    }
}

function getPlayerPreyStamina(cid)
    return getStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_STAMINA, cid)
end

function setPlayerPreyStamina(cid, stamina)
    return setStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_STAMINA, type(stamina) == 'table' and mathtime(stamina) or stamina, cid)
end

function playerHavePrey(cid)
    if getPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_config) ~= -1 then
        if getPlayerPreyMonster(cid) ~= 0 then
            return getPlayerPreyStamina(cid) > 0
        end
    end
    return false
end

function setPlayerPreyConfig(cid)
    addValueInTable(PREY_SYSTEM.storages.prey_config, 0, cid)
    addValueInTable(PREY_SYSTEM.storages.prey_config, 0, cid)  
    addValueInTable(PREY_SYSTEM.storages.prey_config, 0, cid)  
    addValueInTable(PREY_SYSTEM.storages.prey_config, 0, cid) 
end

function getPlayerPreyBonusType(cid)
    return getStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_TYPE, cid)
end

function getPlayerPreyBonusValue(cid)
    return getStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_BONUS_VALUE, cid)
end

function getPlayerPreyMonster(cid)
    return getStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_MONSTER, cid)
end

function setPlayerPreyBonusType(cid, prey_type)
    return setStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_TYPE, prey_type, cid)
end

function setPlayerPreyBonusValue(cid, value)
    return setStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_BONUS_VALUE, value, cid)
end

function setPlayerPreyMonster(cid, monster_id)
    return setStorageTableValue(PREY_SYSTEM.storages.prey_config, PREY_MONSTER, monster_id, cid)
end

function doPlayerResetPreyConfig(cid)
    setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_config, -1)
    setPlayerPreyConfig(cid)
    db.executeQuery("DELETE FROM `prey_system` WHERE `player_id` = ".. getPlayerGUID(cid) .. ";")
end

function getPreyMonsterIdByName(cid, monster_name)
    local tab = getPlayerCurrentList(cid)
    for index, name in ipairs(tab) do
        if name:lower() == monster_name:lower() then
            return index
        end
    end
end

function getPreyMonsterNameById(cid, monster_id)
    local tab, monster_id = getPlayerCurrentList(cid), getPlayerPreyMonster(cid)
    return tab[monster_id]
end

function setPlayerCurrentList(cid, monsterList)
    local query = db.getResult("SELECT `monster_list` FROM prey_system WHERE `player_id` = ".. getPlayerGUID(cid) .. ";")
    local listStr = table.serialize(monsterList)
    if query:getID() == -1 then
        db.executeQuery("INSERT INTO `prey_system` (`player_id`, `monster_list`) VALUES (" .. getPlayerGUID(cid) .. "," .. db.escapeString(listStr) .. ");")
    else
        db.executeQuery("UPDATE `prey_system` SET `monster_list` = " .. db.escapeString(listStr) .. " WHERE `player_id` = " .. getPlayerGUID(cid) ..";")
        query:free()
    end
end

function getPlayerCurrentList(cid)
    local list = {}
    local query = db.getResult("SELECT `monster_list` FROM `prey_system` WHERE player_id = ".. getPlayerGUID(cid) .. ";")
    if query:getID() ~= -1 then
        local list_str = query:getDataString("monster_list")
        list = table.unserialize(list_str)
        query:free()
    end
    return list
end

function getPlayerPreyList(cid, choices_amount)
    local currentList = getPlayerCurrentList(cid)
    local monsters = getPlayerPreyMonsters(cid)
    local counter = 1
    local choicesTab = {}
    repeat
        local randMonster = monsters[math.random(#monsters)]
        if not isInArray(choicesTab, randMonster) then
            if not isInArray(currentList, randMonster) then
                choicesTab[counter] = randMonster
                counter = counter + 1
            end
        end
    until counter == (choices_amount+1)
    return choicesTab
end

function getPlayerPreyMonsters(cid)
    local tab = PREY_SYSTEM.monsters_config
    local level = getPlayerLevel(cid)
    for levelrange, configmonsters in pairs(tab) do
        if level >= levelrange[1] and level <= levelrange[2] then
            return configmonsters
        end
    end
    return {}
end

function getPreyStars(minvalue, maxvalue, rand)
    local star = 0
    if rand == minvalue then
        star = 1
    elseif rand > .85 * maxvalue then
        star = 10
    else
        star = math.floor((rand/(maxvalue-minvalue))*10)
    end
    return star >= 10 and 10 or star
end

function getPlayerPreyLeftTime(cid)
    local currentStamina = getPlayerPreyStamina(cid)
    local intervalStaminaTime = getPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time) - os.time()
    local leftStaminaTime = intervalStaminaTime > 0 and intervalStaminaTime or 0
    local check_final = getPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_check)
    local strTime = check_final == -1 and (currentStamina + (leftStaminaTime)) or (intervalStaminaTime)
    local str = getStringTime(strTime)
    return str
end

function setPlayerPreyEventId(cid, eventId)
    return setPlayerStorageValue(cid, PREY_SYSTEM.storages.eventfinish, eventId)
end

function getPlayerPreyEventId(cid)
    return getPlayerStorageValue(cid, PREY_SYSTEM.storages.eventfinish)
end

function usePlayerPreyStamina(cid)
    if getPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time) <= os.time() then
        local currentStamina = getPlayerPreyStamina(cid)
        local usedStamina = currentStamina - 60
        local newStamina = usedStamina > 0 and usedStamina or 0
        if newStamina ~= 0 then
            setPlayerPreyStamina(cid, newStamina)
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time, 60 + os.time())
        else
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time, 60 + os.time())
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_check, 1)
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_time, mathtime({60, "sec"}) + os.time())
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.preventoffline, os.time())
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
            end, mathtime({60, "sec"}) * 1000)
        end
        return true
    end
    return false
end

function isPreyChannelStatus(cid, status)
    return getPlayerStorageValue(cid, PREY_SYSTEM.storages.status) == status
end

function setPlayerPreyChannelStatus(cid, status)
    return setPlayerStorageValue(cid, PREY_SYSTEM.storages.status, status)
end