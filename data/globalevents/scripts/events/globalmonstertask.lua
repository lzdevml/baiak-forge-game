function onThink(interval, lastExecution)
    local t = GMT.days[os.date("%A")]
    if t and isInArray(t.hour, os.date("%X"):sub(1,5)) then
        local monster_task_index = math.random(1, #t.possible_monsters)
        local monster_task = t.possible_monsters[monster_task_index]
        doBroadcastMessage("[Global Monster Task]: The hunted creature is the "..monster_task.."! The one who most kills this creature within ".. getStrTime(GMT.event_duration).. " will be rewarded.\n[Reward: 10 Gold Tokens + 15 Silver Tokens]", MESSAGE_EVENT_ADVANCE)
        setGlobalStorageValue(GMT.storages.monster, monster_task)
        setGlobalStorageValue(GMT.storages.event_time, os.time())
        for _, pid in ipairs(getPlayersOnline()) do
            setPlayerStorageValue(pid, GMT.storages.kills, 0)
        end
        addEvent(doBroadcastMessage, math.ceil(0.9 * mathtime(GMT.event_duration)) * 1000 , "[Global Monster Task]: Event is almost over! How many hunted creatures have you killed?\n[Reward: 10 Gold Tokens + 15 Silver Tokens]", MESSAGE_EVENT_ADVANCE)
        addEvent(function()
            local rank, str, place, winner = {}, "\nGlobal Monster Task Rank\n", 0, ""
            for _, pid in ipairs(getPlayersOnline()) do
                local player_kills = getPlayerStorageValue(pid, GMT.storages.kills)
                if player_kills > 0 then
                    rank[pid] = player_kills
                    setPlayerStorageValue(pid, GMT.storages.kills, -1)
                end
            end
            if count(rank) > 0 then
                for player, monster_kills in spairs(rank, function(t,a,b) return t[b] < t[a] end) do
                    if place <= 3 then
                        local player_name = getPlayerName(player)
                        place = place + 1
                        str = str .. place .. " - " .. player_name .. ": " .. monster_kills .. "\n"
                        if place == 1 then
                            winner = player_name
                            local x = GMT.reward
                            doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, "Congratulations! You killed ".. monster_kills .." ".. monster_task .. addPlural(monster_kills, "s", monster_task) .. " and won the Global Monster Task! Take you reward.")
                            getEventReward(player, "hard")
                            --[[if #x.items > 0 then
                                for k = 1, #x.items do
                                    doPlayerAddItemTab(player, x.items[k]) 
                                end
                            end]]
                            if x.level > 0 then
                                doPlayerAddLevel(player, x.level)
                            end
                            if x.money > 0 then
                                doPlayerAddMoney(player, x.money)
                            end
                        end
                    end
                end
                doBroadcastMessage("[Global Monster Task]: Congratulations to ".. winner .. "!\n"..str, MESSAGE_EVENT_ADVANCE)
            else
                doBroadcastMessage("[Global Monster Task]: Nobody won the event.", MESSAGE_EVENT_ADVANCE)
            end
            setGlobalStorageValue(GMT.storages.monster, -1)
        end, mathtime(GMT.event_duration) * 1000)
    end
    return true
end