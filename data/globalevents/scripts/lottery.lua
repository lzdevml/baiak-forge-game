local config = {
        lottery_hour = "2 hours", -- Tempo ate a proxima loteria (Esse tempo vai aparecer somente como broadcast message)
        rewards_id = {5809, 5953, 5919, 5804, 5015, 2472, 2160, 11197, 11198}, -- ID dos Itens Sorteados na Loteria
        crystal_counts = 30, -- Usado somente se a rewards_id for crystal coin (ID: 2160).
        website = "yes", -- Only if you have php scripts and table `lottery` in your database!
        days = {
                "Monday-11:00",
                "Monday-14:00",
                "Monday-17:00",
                "Monday-20:00",
                "Monday-23:00",

                "Tuesday-11:00",
                "Tuesday-14:00",
                "Tuesday-16:00",
                "Tuesday-20:00",
                "Tuesday-23:00",

                "Wednesday-11:00",
                "Wednesday-14:00",
                "Wednesday-17:00",
                "Wednesday-20:00",
                "Wednesday-23:00",

                "Thursday-11:00",
                "Thursday-14:00",
                "Thursday-17:00",
                "Thursday-20:00",
                "Thursday-23:00",

                "Friday-11:00",
                "Friday-14:00",
                "Friday-17:00",
                "Friday-20:00",
                "Friday-23:00",

                "Saturday-11:00",
                "Saturday-14:00",
                "Saturday-17:00",
                "Saturday-20:00",
                "Saturday-23:00",

                "Sunday-11:00",
                "Sunday-14:00",
                "Sunday-17:00",
                "Sunday-20:00",
                "Sunday-23:00"
                }
        }
local function getPlayerWorldId(cid)
    if not(isPlayer(cid)) then
        return false
    end
    local pid = getPlayerGUID(cid)
    local worldPlayer = 0
    local result_plr = db.getResult("SELECT * FROM `players` WHERE `id` = "..pid..";")
    if(result_plr:getID() ~= -1) then
        worldPlayer = tonumber(result_plr:getDataInt("world_id"))
        result_plr:free()
        return worldPlayer
    end
    return false
end

local function getOnlineParticipants()
    local players = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerAccess(pid) <= 2 and getPlayerStorageValue(pid, 281821) <= os.time() then
            table.insert(players, pid)
        end
    end
    if #players > 0 then
        return players
    end
    return false
end
     
function onThink(cid, interval)
    if table.find(config.days, os.date("%A-%H:%M")) then
        if(getWorldCreatures(o) <= 0)then
            return true
        end

        local query = db.query or db.executeQuery
        local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
        local item_name = getItemNameById(random_item)  
        local data = os.date("%d/%m/%Y - %H:%M:%S")
        local online = getOnlineParticipants()
       
        if online then
            local winner = online[math.random(1, #online)]
            local world = tonumber(getPlayerWorldId(winner))
           
            if(random_item == 2160) then
                doPlayerSetStorageValue(winner, 281821, os.time() + 3600 * 24)
                doPlayerAddItem(winner, random_item, config.crystal_counts)
                doBroadcastMessage("[LOTTERY SYSTEM] Winner: " .. getCreatureName(winner) .. ", Reward: " .. config.crystal_counts .." " .. getItemNameById(random_item) .. "s! Congratulations! (Next lottery in " .. config.lottery_hour .. ")")
            else
                doPlayerSetStorageValue(winner, 281821, os.time() + 3600 * 24)
                doBroadcastMessage("[LOTTERY SYSTEM] Winner: " .. getCreatureName(winner) .. ", Reward: " ..getItemNameById(random_item) .. "! Congratulations! (Next lottery in " .. config.lottery_hour .. ")")
                doPlayerAddItem(winner, random_item, 1)
            end
            if(config.website == "yes") then
                query("INSERT INTO `lottery` (`name`, `item`, `world_id`, `item_name`, `date`) VALUES ('".. getCreatureName(winner).."', '".. random_item .."', '".. world .."', '".. item_name .."', '".. data .."');")
            end
        else
            print("Ninguem OnLine pra ganhar na loteria")
        end
    end
    return true
end