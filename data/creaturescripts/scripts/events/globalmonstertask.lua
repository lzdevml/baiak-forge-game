function onLogin(cid)
    --registerCreatureEvent(cid, "GMTkill")
    local hunted_creature = getGlobalStorageValue(GMT.storages.monster)
    if hunted_creature ~= -1 then
        local check_time = getGlobalStorageValue(GMT.storages.event_time)
        local reset_time = getPlayerStorageValue(cid, GMT.storages.need_reset)
        if reset_time ~= -1 and os.difftime(os.time(), reset_time) > mathtime(GMT.event_duration) then
            setPlayerStorageValue(cid, GMT.storages.kills, 0)
            setPlayerStorageValue(cid, GMT.storages.need_reset, -1)
        end
        if getPlayerStorageValue(cid, GMT.storages.kills) == -1 then
            setPlayerStorageValue(cid, GMT.storages.kills, 0)
        end
        if os.difftime(os.time(), check_time) < mathtime(GMT.event_duration) then
            local stor = getPlayerStorageValue(cid, GMT.storages.kills)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "[Global Monster Task]: Event is active! Today's hunted creature: ".. hunted_creature)
            if stor > 0 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Global Monster Task]: You killed "..  stor .. " "..hunted_creature.. addPlural(stor, "s", hunted_creature) ..".")
            end
        end
    else
        if getPlayerStorageValue(cid, GMT.storages.kills) > 0 then
            setPlayerStorageValue(cid, GMT.storages.kills, 0)
        end
    end
    return true
end

function onLogout(cid)
    if getGlobalStorageValue(GMT.storages.monster) ~= -1 then
        if getPlayerStorageValue(cid, GMT.storages.kills) > 0 then
            setPlayerStorageValue(cid, GMT.storages.need_reset, os.time())
        end
    end
    return true
end

function onDeath(target, corpse, deathList) 
    local killers = deathList
    local cid = #killers > 1 and killers[2] or killers[1]
    if not isPlayer(cid) then 
        return true
    end 

    if isPlayer(target) or getCreatureMaster(target) then return true end
    local hunted_creature = getGlobalStorageValue(GMT.storages.monster)
    if hunted_creature ~= -1 then
        local monster_name = getCreatureName(target):lower()
        if monster_name == tostring(hunted_creature):lower() then
            local stor = getPlayerStorageValue(cid, GMT.storages.kills) + 1
            setPlayerStorageValue(cid, GMT.storages.kills, stor)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Global Monster Task]: You killed ".. stor .. " "..monster_name.. addPlural(stor, "s", monster_name) ..".")
        end
    end
    return true
end  
