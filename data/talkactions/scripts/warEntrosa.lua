local arena_storage = 454523
local players_storage = 456512
local storage_accept = 151230
local storage_check = 153201
local guild_invite = 542351
local guild_accept = 456121
local time_1_pos = {x = 26366, y = 31962, z = 6}
local time_2_pos = {x = 26484, y = 31957, z = 6}
local city = "Carlin"

local function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks)
    if not rank then
        rank = 3
        selectLowerRanks = true
    end
    local list = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerGuildId(pid) == guildId then
            local playerRank = getPlayerGuildLevel(pid)
            if playerRank == rank or (selectLowerRanks and playerRank <= rank) then
                table.insert(list, pid)
            end
        end
    end
    return list
end

function onSay(cid, words, param, channel)
    if param == "" then
        doPlayerSendCancel(cid, "Use os parametros corretos.")
        return true
    end
    
    local t = string.explode(param, ",")
    
    if words == "!war"..city.." invite," then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false) > 0 then
                if getGlobalStorageValue(arena_storage) <= os.time() then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce convidou a guild "..t[2].." para uma war em "..city.."!")
                    for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, false)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).." da guild "..getPlayerGuildName(cid).." chamou sua guild para uma war em "..city.." Para aceitar diga /war"..city.." accept, "..getPlayerGuildName(cid)..".")
                        setPlayerStorageValue(gid, storage_accept, os.time() + 20*60)
                        setPlayerStorageValue(gid, storage_check, getPlayerGuildId(cid))
                    end
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A arena ja esta ocupada.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Nenhum lider da guild "..t[2].." esta online.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif "!war"..city.." accept," then
        if getPlayerGuildLevel(cid) < 3 then
            doPlayerSendCancel(cid, "Somente liders de guild podem usar esse comando.")
            return true
        end
        if getGuildId(t[2]) and getGuildId(t[2]) ~= getPlayerGuildId(cid) then
            if getPlayerStorageValue(cid, storage_accept) > os.time() then
                if getPlayerStorageValue(cid, storage_check) == getGuildId(t[2]) then
                    setGlobalStorageValue(arena_storage, os.time() + 3600)
                    setGlobalStorageValue(guild_accept, getPlayerGuildId(cid))
                    setGlobalStorageValue(guild_invite, getGuildId(t[2]))
                    if #getOnlineGuildMembersByRank(getGuildId(t[2]), 3, true) > 0 then
                        for _, gid in pairs(getOnlineGuildMembersByRank(getGuildId(t[2]), 3, true)) do
                        doPlayerSendTextMessage(gid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild entrou em war contra a guild "..getPlayerGuildName(cid).."! Para participar diga /war"..city.." go")
                        end
                    end
                    if #getOnlineGuildMembersByRank(getPlayerGuildId(cid), 3, true) > 0 then
                        for _, pid in pairs(getOnlineGuildMembersByRank(getPlayerGuildId(cid), 3, true)) do
                            doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild entrou em war contra a guild "..t[2].."! Para participar diga /war"..city.." go")
                        end
                    end
                    addEvent(function()
                        for _, pid in pairs(getPlayersOnline()) do
                            if isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 3}, {x = 26507, y = 32030, z = 3}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 4}, {x = 26507, y = 32030, z = 4}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 5}, {x = 26507, y = 32030, z = 5}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 6}, {x = 26507, y = 32030, z = 6}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 7}, {x = 26507, y = 32030, z = 7}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 8}, {x = 26507, y = 32030, z = 8}) or isInArea(getThingPos(pid), {x = 26357, y = 31906, z = 9}, {x = 26507, y = 32030, z = 9}) then
                                doTeleportThing(pid, getTownTemplePosition(getPlayerTown(cid)))
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi teleportado para o templo pq o tempo de war acabou")
                            end
                        end
                    end, 1000*3600)
                    addEvent(setGlobalStorageValue, 3600*1000, guild_accept, -1)
                    addEvent(setGlobalStorageValue, 3600*1000, guild_invite, -1)
                else
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao te invitou para uma war.")
                end
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sua guild n foi chamada para nenhuma war.")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa guild nao existe.")
        end
    elseif "!war"..city.." go" then
        if getTilePzInfo(getThingPos(cid)) == false then
            doPlayerSendCancel(cid, "Vc precisa estar na pz")
            return true
        end
        if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) or getGlobalStorageValue(guild_accept) == getPlayerGuildId(cid) then
            doPlayerSetStorageValue(cid, 888123, os.time() + getGlobalStorageValue(arena_storage))
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce entrou na war!")
            if getGlobalStorageValue(guild_invite) == getPlayerGuildId(cid) then
                doTeleportThing(cid, time_1_pos)
            else
                doTeleportThing(cid, time_2_pos)
            end
        else
            doPlayerSendCancel(cid, "Sua guild nao esta em war")
        end
    end
    return true
end