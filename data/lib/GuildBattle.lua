-- Guild Battle Event developed by Dwarfer

GUILD_BATTLE = {
    days = {
        ["Monday"] = {"22:30"},
        ["Tuesday"] = {"22:30"},
        ["Wednesday"] = {"22:30"},
        ["Thursday"] = {"22:30"},
        ["Friday"] = {"22:30"},
        ["Saturday"] = {"22:30"},
        ["Sunday"] = {"21:00"}
    },
    min_level = 100,
    max_players_per_guild = 15,
    min_rank_to_register = GUILDLEVEL_VICE, 
    battle_duration = {2, "min"},
    time_to_start = {2, "min"},
    teleport = {id = 1387, createPosition = {x=165, y=53, z=7}, actionid = 5300},
    teleport_exit_actionid = 5301,
    rewards = {items = {{12544, 1}, {2160, 50}, {6527, 50}}, exp = 0, level = 0, goblet = {false, 5805}},
    -- 5301
    guilds = {
        [1] = {
            spawn = {x = 768, y = 935, z = 7},
            walls = {
                [1] = {id = 8539, pos = {x = 773, y = 934, z = 7}},
                [2] = {id = 8539, pos = {x = 773, y = 935, z = 7}},
                [3] = {id = 8539, pos = {x = 773, y = 936, z = 7}}
            },
            storage = 53004,
            players_count = 53005
        },
        [2] = {
            spawn = {x = 768, y = 984, z = 7},
            walls = {
                [1] = {id = 8539, pos = {x = 773, y = 983, z = 7}},
                [2] = {id = 8539, pos = {x = 773, y = 984, z = 7}},
                [3] = {id = 8539, pos = {x = 773, y = 985, z = 7}}
            },
            storage = 53006,
            players_count = 53007
        },
	        [3] = {
            spawn = {x = 805, y = 995, z = 7},
            walls = {
                [1] = {id = 8539, pos = {x = 804, y = 990, z = 7}},
                [2] = {id = 8539, pos = {x = 805, y = 990, z = 7}},
                [3] = {id = 8539, pos = {x = 806, y = 990, z = 7}}
            },
            storage = 53008,
            players_count = 53009
        },
		    [4] = {
            spawn = {x = 842, y = 984, z = 7},
            walls = {
                [1] = {id = 8539, pos = {x = 837, y = 983, z = 7}},
                [2] = {id = 8539, pos = {x = 837, y = 984, z = 7}},
                [3] = {id = 8539, pos = {x = 837, y = 985, z = 7}}
            },
            storage = 53010,
            players_count = 53011
        },
		    [5] = {
            spawn = {x = 842, y = 935, z = 7},
            walls = {
                [1] = {id = 8539, pos = {x = 837, y = 934, z = 7}},
                [2] = {id = 8539, pos = {x = 837, y = 935, z = 7}},
                [3] = {id = 8539, pos = {x = 837, y = 936, z = 7}}
            },
            storage = 53012,
            players_count = 53013
        },
			[6] = {
            spawn = {x = 805, y = 924, z = 7},
            walls = {
                [1] = {id = 8539, pos = {x = 804, y = 929, z = 7}},
                [2] = {id = 8539, pos = {x = 805, y = 929, z = 7}},
                [3] = {id = 8539, pos = {x = 806, y = 929, z = 7}}
            },
            storage = 53012,
            players_count = 53013
        },
    },
    
    removeConditions = {CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_INFIGHT},
    storages = {
        guild_battle = 53000,
        frags = 53001,
        running = 53002,
        registration = 53003
    }
}

-- All functions by Dwarfer

function getGuildBattleWinner()
    local rank, winner = {}, {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isPlayerInGuildBattle(pid) then
            local guildFrags = rank[getPlayerGuildId(pid)]
            rank[getPlayerGuildId(pid)] = (not guildFrags and getPlayerGuildBattleFrags(pid) or (guildFrags + getPlayerGuildBattleFrags(pid)))
        end
    end
    for guildId, frags in spairs(rank, function(t,a,b) return t[b] < t[a] end) do
        if not winner.id then
            winner.id = guildId
            winner.frags = frags
            break
        end
    end
    doGuildBattleSendMsg("[Guild Battle]: A Guild vencedora foi "..getGuildName(winner.id).." venceu a batalha com "..winner.frags.." kill"..(winner.frags > 1 and "s" or "")..", Todo os jogadores da guild Recebeu 50 Crystal Coins, 50 Tibia Token, 1 Double Boost e 1 Stamina Elixir!", MESSAGE_EVENT_ADVANCE)
    for _, pid in ipairs(getPlayersOnline()) do
        if isPlayerInGuildBattle(pid) then
            local destination = getTownTemplePosition(getPlayerTown(pid))
            doTeleportThing(pid, destination)
            doCreatureAddHealth(pid, getCreatureMaxHealth(pid))
            doPlayerAddMana(pid, getPlayerMaxMana(pid))
            if getPlayerGuildId(pid) == winner.id then
                local pfrags = getPlayerGuildBattleFrags(pid)
                local rwd = GUILD_BATTLE.rewards
                if #rwd.items > 0 then
                    for i = 1, #rwd.items do
                        advancedDoPlayerAddItem(pid, rwd.items[i])
                    end
                end
                if rwd.exp > 0 then
                    doPlayerAddExperience(pid, rwd.exp)
                    doSendAnimatedText(getPlayerPosition(pid), rwd.exp, COLOR_WHITE)
                end
                if rwd.level > 0 then
                    doPlayerAddLevel(pid, rwd.level)
                end
                if rwd.goblet[1] then
                    local goblet = doPlayerAddItem(pid, rwd.goblet[2], 1)
                    doItemSetAttribute(goblet, "description", "Awarded to " .. getPlayerName(pid) .. " for winning Guild Battle Event at ".. os.date("%d %B %Y", os.time())..".")
                end
                doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você ajudou sua guilda a vencer o evento Guild Battle com "..pfrags.." frag"..(pfrags > 1 and "s" or "").."!")  
            end
            doPlayerRemoveGuildBattle(pid)
            for _, cond in pairs(GUILD_BATTLE.removeConditions) do
                doRemoveCondition(pid, cond, CONDITIONID_DEFAULT)
            end
            if isPlayerPzLocked(pid) then
               doPlayerSetPzLocked(pid, false)
            end
            unregisterCreatureEvent(pid, "GuildBattle")
            unregisterCreatureEvent(pid, "GuildBattleCombat")
            unregisterCreatureEvent(pid, "GuildBattleTarget")
        end
    end
    resetGuildBattle(false)
end

function getGuildName(guildId)
local query = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. guildId .. ";")
if query:getID() == -1 then
    return nil
end
local guildName = query:getDataString("name")
query:free()
return tostring(guildName)
end

function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end


function getPlayerGuildBattleFrags(cid)
    return getPlayerStorageValue(cid, GUILD_BATTLE.storages.frags)
end

function doGuildBattleSendMsg(message, msg_type)
    for _, pid in ipairs(getPlayersOnline()) do
        if isPlayerInGuildBattle(pid) then
            doPlayerSendTextMessage(pid, msg_type, message)
        end
    end
end

function isGuildBattleRunning()
    return getGlobalStorageValue(GUILD_BATTLE.storages.running) == 1
end

function canRegisterGuildInBattle()
    return getGlobalStorageValue(GUILD_BATTLE.storages.registration) == 1
end

function getMembersInGuildBattle(cid)
    return getGlobalStorageValue(GUILD_BATTLE.guilds[getPlayerGuildBattleId(cid)].players_count)
end

function isPlayerInGuildBattle(cid)
    return getPlayerStorageValue(cid, GUILD_BATTLE.storages.guild_battle) == 1
end

function doPlayerJoinGuildBattle(cid)
    setGlobalStorageValue(GUILD_BATTLE.guilds[getPlayerGuildBattleId(cid)].players_count, getMembersInGuildBattle(cid) + 1)
    setPlayerStorageValue(cid, GUILD_BATTLE.storages.guild_battle, 1)
    setPlayerStorageValue(cid, GUILD_BATTLE.storages.frags, 0)
    registerCreatureEvent(cid, "GuildBattle")
    registerCreatureEvent(cid, "GuildBattleCombat")
    registerCreatureEvent(cid, "GuildBattleTarget")
end

function doPlayerRemoveGuildBattle(cid)
    setGlobalStorageValue(GUILD_BATTLE.guilds[getPlayerGuildBattleId(cid)].players_count, getMembersInGuildBattle(cid) - 1)
    setPlayerStorageValue(cid, GUILD_BATTLE.storages.guild_battle, -1)
    setPlayerStorageValue(cid, GUILD_BATTLE.storages.frags, -1)
    unregisterCreatureEvent(cid, "GuildBattle")
    unregisterCreatureEvent(cid, "GuildBattleCombat")
    unregisterCreatureEvent(cid, "GuildBattleTarget")
end

function getPlayerGuildBattleId(cid)
    local guilds = GUILD_BATTLE.guilds
    for i = 1, #guilds do
        if getGlobalStorageValue(guilds[i].storage) == getPlayerGuildId(cid) then
            return i
        end
    end
    return -1
end

function doGuildRegisterInBattle(cid)
    local guilds = GUILD_BATTLE.guilds
    for i = 1, #guilds do
        if getGlobalStorageValue(guilds[i].storage) == -1 then
            setGlobalStorageValue(guilds[i].storage, getPlayerGuildId(cid))
            setGlobalStorageValue(guilds[i].players_count, 0)
            return true
        end
    end
end

function doGuildUnregisterInBattle(cid)
    local guilds = GUILD_BATTLE.guilds
    for i = 1, #guilds do
        if getGlobalStorageValue(guilds[i].storage) == getPlayerGuildId(cid) then
            setGlobalStorageValue(guilds[i].storage, -1)
            setGlobalStorageValue(guilds[i].players_count, -1)
            return true
        end
    end
end

function getGuildsRegisteredInBattle()
    local guilds, t = GUILD_BATTLE.guilds, {}
    for i = 1, #guilds do
        if getGlobalStorageValue(guilds[i].storage) ~= -1 then
            table.insert(t, i)
        end
    end
    return t
end

function resetGuildBattle(check)
    local guilds = GUILD_BATTLE.guilds
    setGlobalStorageValue(GUILD_BATTLE.storages.registration, -1)
    setGlobalStorageValue(GUILD_BATTLE.storages.running, -1)
    if check then
        for _, pid in ipairs(getPlayersOnline()) do
            if isPlayerInGuildBattle(pid) then
                local destination = getTownTemplePosition(getPlayerTown(pid))
                doTeleportThing(pid, destination)
                doPlayerRemoveGuildBattle(pid)
            end
        end
    end
    for i = 1, #guilds do
        setGlobalStorageValue(guilds[i].storage, -1)
        setGlobalStorageValue(guilds[i].playerscount, -1)
    end
    doGuildBattleWallsAction("close")
end

function doGuildBattleWallsAction(action)
    local guilds = GUILD_BATTLE.guilds
    for i = 1, #guilds do
        local current_guild = guilds[i].walls
        for _, wall_info in pairs(current_guild) do
            local wall = getTileItemById(wall_info.pos, wall_info.id)
            if action == "open" then
                if wall.uid > 0 then
                    doSendMagicEffect(wall_info.pos, CONST_ME_POFF)
                    doRemoveItem(wall.uid)
                end
            elseif action == "close" then
                if wall.uid == 0 then
                    doSendMagicEffect(wall_info.pos, CONST_ME_TELEPORT)
                    doCreateItem(wall_info.id, 1, wall_info.pos)
                end
            end
        end
    end
end

function doGuildBattleWallsCountdown(delay)
    if delay ~= 0 then
        local guilds = GUILD_BATTLE.guilds
        for i = 1, #guilds do
            local current_guild = guilds[i].walls
            for _, wall_info in pairs(current_guild) do
                doSendAnimatedText(wall_info.pos, delay, COLOR_WHITE)
            end
        end
        addEvent(doGuildBattleWallsCountdown, 1000, delay - 1)
    end
end

function advancedDoPlayerAddItem(cid, itemTable) -- by dwarfer
    if (not isItemStackable(itemTable[1]) and itemTable[2] > 1) then
        for k = 1, itemTable[2] do
            doPlayerAddItem(cid, itemTable[1], 1)
        end
    else
        doPlayerAddItem(cid, itemTable[1], itemTable[2])
    end
    return true
end

function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
for i, v in pairs(unit) do
if v == table[2] then
return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
end
end
return error("Bad declaration in mathtime function.")
end

function getStrTime(table) -- by dwarfer
local unit = {["sec"] = "second",["min"] = "minute",["hour"] = "hour",["day"] = "day"}
return tostring(table[1].." "..unit[table[2]]..(table[1] > 1 and "s" or ""))
end