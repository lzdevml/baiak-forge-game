function onUse(cid, item, fromPosition, itemEx, toPosition)
    -- storages
    local storageWz1 = 50000
    local storageWz2 = 50001

    -- recompensas da Warzone 1
    local rewardsWz1 = {
        {2494, 1, 1},   -- crystalline arrow
        {8884, 1, 1},   -- bolt
        {12396, 1, 1,  -- small enchanted sapphire
        {2155, 1, 1},   -- green gem
        {2346, 1, 1},  -- crystal coin
        {12575, 1, 1},  -- rusty armor
        {2421, 1, 1},   -- giant shimmering pearl
        {7443, 1, 1},   -- infernal bolt
        {9971, 10, 30}, -- gold token
        {2495, 1, 1}    -- other item
    }

    -- recompensas da Warzone 2 (itens melhores)
    local rewardsWz2 = {
        {2156, 1, 1},   -- red gem
        {2158, 1, 1},   -- blue gem
        {8924, 1, 1},   -- blue gem
        {7456, 1, 1},   -- blue gem
        {5468, 1, 1},   -- blue gem
        {9971, 20, 50}, -- gold token
        {8981, 1, 1},   -- blue gem
        {12396, 1, 1},   -- blue gem
        {7440, 1, 1},   -- blue gem
        {8905, 1, 1},   -- blue gem
        {6132, 1, 1},   -- blue gem
        {2346, 1, 1},   -- blue gem
        {8867, 1, 1},   -- blue gem
        {2471, 1, 1},   -- blue gem
        {8850, 1, 1}    -- master archer's armor
    }

    -- função genérica pra dar recompensas
    local function giveRewards(cid, rewardList)
        local maxItems = 5 -- máximo de itens que pode vir
        local chosen = {}
        local count = 0

        while count < maxItems do
            local rnd = math.random(1, #rewardList)
            local item = rewardList[rnd]

            if not chosen[rnd] then
                local amount = math.random(item[2], item[3])
                doPlayerAddItem(cid, item[1], amount)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
                chosen[rnd] = true
                count = count + 1
            end
        end
    end

    local gotReward = false

    -- WZ2
    if getPlayerStorageValue(cid, storageWz2) > 0 then
        setPlayerStorageValue(cid, storageWz2, 0)
        doPlayerSendTextMessage(cid, 22, "Aqui está sua recompensa da Warzone 2!")
        giveRewards(cid, rewardsWz2)
        gotReward = true
    end

    -- WZ1
    if getPlayerStorageValue(cid, storageWz1) > 0 then
        setPlayerStorageValue(cid, storageWz1, 0)
        doPlayerSendTextMessage(cid, 22, "Aqui está sua recompensa da Warzone 1!")
        giveRewards(cid, rewardsWz1)
        gotReward = true
    end

    -- Se não concluiu nenhuma
    if not gotReward then
        doPlayerSendTextMessage(cid, 22, "Você não concluiu nenhuma Warzone.")
    end

    return true
end
