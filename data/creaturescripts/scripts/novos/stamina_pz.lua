local config = {
    staminaToAdd = 3, -- Tempo para receber a stamina
    maxStamina = 42 * 60,
    toAdd = {
        [{0, 14}] = 2 * 60, -- Stamina Vermelha quanto o player vai ganhar
        [{15, 39}] = 2 * 60, -- Stamina Amarela quanto o player vai ganhar
        [{40, 42}] = 2 * 60 -- Stamina Verde quanto o player vai ganhar
    }
}

local sString = config.staminaToAdd > 1 and "s" or ""
local timeStorage = 57940
local pzMessageStorage = 57941 

function onThink(cid, interval)
    if not isPlayer(cid) then
        return true
    elseif getPlayerStamina(cid) >= config.maxStamina then
        return true
    end

    local playerPos = getThingPos(cid)

    if getTilePzInfo(playerPos) and getPlayerStorageValue(cid, pzMessageStorage) == 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Stamina System] Você começará a receber stamina por estar em Protection Zone.")
        setPlayerStorageValue(cid, pzMessageStorage, 1) 
    end

    for k, v in pairs(config.toAdd) do
        if getPlayerStamina(cid) >= (k[1] * 60) and getPlayerStamina(cid) <= (k[2] * 60) then
            if getPlayerStorageValue(cid, timeStorage) >= v then
                setPlayerStorageValue(cid, timeStorage, 0)
                doPlayerAddStamina(cid, config.staminaToAdd)
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Stamina System] Você regenerou " .. config.staminaToAdd .. " minuto" .. sString .. " de stamina por estar em Protection Zone.")
                return true
            end
        end
    end

    if getTilePzInfo(playerPos) then
        setPlayerStorageValue(cid, timeStorage, getPlayerStorageValue(cid, timeStorage) + 1)
    else
        setPlayerStorageValue(cid, pzMessageStorage, 0)
    end

    return true
end
