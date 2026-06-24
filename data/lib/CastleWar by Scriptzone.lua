-- Castle War by Scriptzone

CASTLEWAR = {

    days = {
        ["Thursday"] = {"19:15"},
        ["Wednesday"] = {"21:00"},
        ["Friday"] = {"21:00"}
    }, 
    
    days_to_liberate = {
        ["Monday"] = {"12:00"},
        ["Tuesday"] = {"12:00"},
        ["Wednesday"] = {"12:00"},
        ["Thursday"] = {"19:14"},
        ["Friday"] = {"12:00"},
        ["Saturday"] = {"12:00"},
        ["Sunday"] = {"12:00"}
    },
    
    min_level = 100,
    check_mc = false,
    battle_duration = {5, "min"},
    time_to_start = {1, "min"},
    main_town_id = 4, 
    banner = {pos = {x = 308, y = 86, z = 7}, id = 1810},
    
    actionids = {
        throne = 5655, 
        enter_invasion_area = 5656,
        exit_invasion_area = 5659,

        castle_entrance = 5657,
        castle_exit = 5658,        
        check_dominant = 5660
    },
    
    site_information = true, 
        
    storages = {
        running = 56420, 
        guilds = 56421, 
        current_domain = 56422, 
        guilds_time = 56423, 
        dominant_guild = 56424,
        player_inwar = 56425, 
        player_incastle = 56426, 
        player_castlemsg = 56427
    }
}

function isCastleWarRunning()
    return getGlobalStorageValue(CASTLEWAR.storages.running) == 1
end

function isPlayerInCastleWarBattle(cid)
    return getPlayerStorageValue(cid, CASTLEWAR.storages.player_inwar) == 1
end

function isPlayerInsideCastleWar(cid)
    return getPlayerStorageValue(cid, CASTLEWAR.storages.player_incastle) == 1
end

function isDominantCastleWar(cid)
    return getPlayerGuildId(cid) == getGlobalStorageValue(CASTLEWAR.storages.dominant_guild)
end

function doUpdateCastleWar(keep_guild)
    local x = CASTLEWAR.storages
    local current, guilds_tab = getStorageTableValue(x.current_domain, 1), getStorageTable(x.guilds)
    local guilds_domain_time, dominated_time = getStorageTable(x.guilds_time), getStorageTableValue(x.current_domain, 2)
    for index, id_guild in pairs(guilds_tab) do
        if id_guild == current then
            setStorageTableValue(x.guilds_time, index, guilds_domain_time[index] + os.difftime(os.time(), dominated_time))
            if keep_guild then
                setStorageTableValue(x.current_domain, 2, os.time())
            end
            break
        end
    end
end

function getCastleWarRank()
    local rank, str , place = {}, "Castle War Ranking:\n\n", 0
    local guilds_tab = getStorageTable(CASTLEWAR.storages.guilds)
    local guilds_domain_time = getStorageTable(CASTLEWAR.storages.guilds_time)
    for index, guildId in pairs(guilds_tab) do
        rank[guildId] = guilds_domain_time[index]
    end
    for guild_id, dominatedTime in spairs(rank, function(t,a,b) return t[b] < t[a] end) do
        local guildName = getGuildName(guild_id)
        if guildName then
            place = place + 1
            str = str .. place .. " - ".. guildName .. ": " .. getStringTime(dominatedTime) .. "\n"
        end
    end
    return str
end

function checkMCInCastleWar(cid)
    for _, pid in ipairs(getPlayersOnline()) do
        if isPlayerInCastleWarBattle(pid) then
            if cid ~= pid then
                if getPlayerIp(pid) == getPlayerIp(cid) then
                    return true
                end
            end
        end
    end
    return false
end

function doPlayerNotFragInCastleWar(cid)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This frag was not counted because you are in the Castle War battle.")
    doPlayerSetSkullEnd(cid, 0, SKULL_WHITE)
    doRemoveCondition(cid, CONDITION_INFIGHT)
    doCreatureSetSkullType(cid, SKULL_NONE)
    db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ") ORDER BY `death_id` DESC LIMIT 1;")
end