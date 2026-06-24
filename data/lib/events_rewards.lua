local rewards = {
    event_tokens = {
        ["low"] = {min = 2, max = 5},
        ["medium"] = {min = 7, max = 14},
        ["hard"] = {min = 15, max = 35},
    },
    items = {
        [1] = {id = 13393, min = 2, max = 4}, -- Minor Crystalline Token
        [2] = {id = 13394, min = 1, max = 2}, -- Major Crystalline Token

        [3] = {id = "exercise", min = 200, max = 550}, -- exercise weapons
        [4] = {id = "kegs", min = 3, max = 6},
        [5] = {id = "imbuiment"}

    }
}

local exercise_weapons = {
    ["druid"] = 13454,
    ["sorcerer"] = 13456,
    ["paladin"] = 13452,
    ["knight"] = {sword = 13455, axe = 13451, club = 13453}
}

local kegs = {
    ["druid"] = {13394},
    ["sorcerer"] = {13394},
    ["knight"] = {13394},
    ["paladin"] = {13394}
}

function getEventReward(cid, nivel)
    -- Adicionar Event Tokens:
    local event_tokenid = 13393
    local eventTokens_count = math.random(rewards.event_tokens[nivel].min, rewards.event_tokens[nivel].max)
    doPlayerAddItem(cid, event_tokenid, eventTokens_count)
    local str = 'Rewards: '.. eventTokens_count .. 'x event tokens and'


    local randomItem = rewards.items[math.random(1, #rewards.items)]
    -- Items comuns:
    if tonumber(randomItem.id) then 
        local count = math.random(randomItem.min, randomItem.max)
        doPlayerAddItem(cid, randomItem.id, count)
        str = str .. " ".. count .. "x "..getItemNameById(randomItem.id).."."

    -- Exercise Items:
    elseif randomItem.id == "exercise" then
        local itemid = events_getExerciseItem(cid)
        local item = doPlayerAddItem(cid, itemid, 1) 
        local count = math.random(randomItem.min, randomItem.max)
        doItemSetAttribute(item, "charges", count)
        str = str .. " 1x "..getItemNameById(itemid).." ("..count.."x charges)."

    -- Kegs:
    elseif randomItem.id == "kegs" then
        local itemid = events_getKeg(cid)
        local item = doPlayerAddItem(cid, itemid, 1)
        local count = math.random(randomItem.min, randomItem.max)
        doItemSetAttribute(item, "charges", count)
        str = str .. " 1x "..getItemNameById(itemid).." ("..count.."x charges)."

    -- Imbuiments:
    elseif randomItem.id == "imbuiment" then
        if nivel == "low" then
            addPlayerImbuVoucher(cid, "basic", 1)
            str = str .. " 1x Basic Imbuiment Voucher"
        elseif nivel == "medium" then
            addPlayerImbuVoucher(cid, "intricate", 1)
            str = str .. " 1x Intricate Imbuiment Voucher"
        elseif nivel == "hard" then
            addPlayerImbuVoucher(cid, "powerful", 1)
            str = str .. " 1x Powerful Imbuiment Voucher"
        end
        str = str .. " ("..translate(cid, {"Utilize a Imbuiment Machine mais proxima usar sua recompensa","Use the nearest Imbuiment Machine to enjoy your reward"}) .. ")."
    end
    doPlayerSendTextMessage(cid, 19, str)

end

function events_getKeg(cid)
    local itemid
    if isDruid(cid) then
        itemid = kegs["druid"][math.random(1, #kegs["druid"])]
    elseif isSorcerer(cid) then
        itemid = kegs["sorcerer"][math.random(1, #kegs["sorcerer"])]
    elseif isKnight(cid) then
        itemid = kegs["knight"][math.random(1, #kegs["knight"])]
    elseif isPaladin(cid) then
        itemid = kegs["paladin"][math.random(1, #kegs["paladin"])]
    end
    return itemid
end

function events_getExerciseItem(cid)
    
    local item
    if isDruid(cid) then
        item = exercise_weapons["druid"]
    elseif isSorcerer(cid) then
        item = exercise_weapons["sorcerer"]
    elseif isPaladin(cid) then
        item = exercise_weapons["paladin"]
    elseif isKnight(cid) then
        --right hand = 5
        --left hand = 6
        if (getPlayerSlotItem(cid, 5).uid ~= 0 and isSword(getPlayerSlotItem(cid, 5).uid)) or (getPlayerSlotItem(cid, 6).uid ~= 0 and isSword(getPlayerSlotItem(cid, 6).uid)) then
            item = exercise_weapons["knight"].sword
        elseif (getPlayerSlotItem(cid, 5).uid ~= 0 and isAxe(getPlayerSlotItem(cid, 5).uid)) or (getPlayerSlotItem(cid, 6).uid ~= 0 and isAxe(getPlayerSlotItem(cid, 6).uid)) then
            item = exercise_weapons["knight"].axe
        elseif (getPlayerSlotItem(cid, 5).uid ~= 0 and isClub(getPlayerSlotItem(cid, 5).uid)) or (getPlayerSlotItem(cid, 6).uid ~= 0 and isClub(getPlayerSlotItem(cid, 6).uid)) then
            item = exercise_weapons["knight"].club
        else
            item = exercise_weapons["knight"].sword
        end
    end
    return item
end