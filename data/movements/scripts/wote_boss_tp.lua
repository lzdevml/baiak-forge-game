local config = {
    pos = {x = 189, y = 579, z = 0}, -- para onde o tp vai levar
    tpItemId = 9739, -- ID do item do teleporter
}

local function removeTeleporter(cid, position)
    local teleporter = getTileItemById(position, config.tpItemId)
    if isItem(teleporter) then
        doRemoveItem(teleporter.uid, 1)
    end
end

function onStepIn(cid, item, position, fromPosition)
    if (not isPlayer(cid)) then
        return false
    end

    if item.itemid == config.tpItemId then
        if getPlayerStorageValue(cid, 45262) <= 0 then
            setPlayerStorageValue(cid, 45262, 1)
            doPlayerAddOutfit(cid, 366, 3) -- WAYFARER ADDON FEMALE
            doPlayerAddOutfit(cid, 367, 3) -- WAYFARER ADDON MALE
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a missão e recebeu a Roupa Wayfarer.")
            
            -- Agendar a remoção do teleporter após 1 minuto
            addEvent(removeTeleporter, 60 * 1000, cid, position)
        end

        doTeleportThing(cid, config.pos)
        doSendMagicEffect(getCreaturePosition(cid), 10)
    end
    return true
end
