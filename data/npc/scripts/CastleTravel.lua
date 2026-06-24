local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                          
    npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)                       
    npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)                  
    npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()                                      
    npcHandler:onThink()
end

local storage_InCastleHunts = 458781

local citiesTravel = {
    ["center"] = {pos = {x = 34781, y = 34515, z = 6}, cost = 0},
    ["east"] = {pos = {x = 34765, y = 34404, z = 7}, cost = 0},
    ["west"] = {pos = {x = 34543, y = 34474, z = 7}, cost = 0},
    ["north"] = {pos = {x = 34619, y = 34197, z = 7}, cost = 0},
    ["blood city"] = {pos = {x = 209, y = 76, z = 6}, cost = 0, free = true},
    ["back"] = {pos = {x = 305, y = 88, z = 7}, cost = 0, free = true},
}

function greetCallback(cid)
    local msg = 'Your guild has no castle domain!'

    if getPlayerGroupId(cid) > 4 or (getPlayerGuildId(cid) == getGlobalStorageValue(123123) and getGlobalStorageValue(123124) >= os.time()) then
        msg = "You can travel to " .. getCastleCities(cid) .. "."
    end

    npcHandler:setMessage(MESSAGE_GREET, msg)
    return true
end

function creatureSayCallback(cid, type, msg)
    if isPlayerPzLocked(cid) then
        npcHandler:say('You can\'t travel, you have pz!', cid)
        return true
    end

    for i, v in pairs(citiesTravel) do
        if msgcontains(msg, i) and not isPlayerPzLocked(cid) and getDistanceBetween(getThingPos(cid), citiesTravel[i].pos) > 10 then
            if citiesTravel[i].free or getPlayerGroupId(cid) > 4 or (getPlayerGuildId(cid) == getGlobalStorageValue(123123) and getGlobalStorageValue(123124) >= os.time()) then
                doTeleportThing(cid, citiesTravel[i].pos)
                doSendMagicEffect(citiesTravel[i].pos, 10)
                setPlayerStorageValue(cid, storage_InCastleHunts, -1)
                return true
            else
                npcHandler:say('Your guild has no castle domain!', cid)
                return true
            end
        end
    end

    if msgcontains(msg, "travel") or msgcontains(msg, "sail") or msgcontains(msg, "ship") then
        if getCastleCities(cid) ~= '' then
            npcHandler:say('I can take you to these places: ' .. getCastleCities(cid) .. '.', cid)
        else
            npcHandler:say('Your guild has no castle domain!', cid)
        end
        return true
    end

    return true
end

function getCastleCities(cid)
    local str = ''
    for j, k in pairsByKeys(citiesTravel) do
        if (getPlayerGroupId(cid) > 4 or (getPlayerGuildId(cid) == getGlobalStorageValue(123123) and getGlobalStorageValue(123124) >= os.time())) then
            if getDistanceBetween(getThingPos(cid), citiesTravel[j].pos) > 10 then
                if str == '' then
                    str = "{" .. j .. "}"
                else
                    str = str .. ", {" .. j .. "}"
                end
            end
        else
            if getDistanceBetween(getThingPos(cid), citiesTravel[j].pos) > 10 and citiesTravel[j].free then
                if str == '' then
                    str = "{" .. j .. "}"
                else
                    str = str .. ", {" .. j .. "}"
                end
            end
        end
    end
    return str
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
