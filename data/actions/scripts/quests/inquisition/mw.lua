function onUse(cid, item, fromPosition, itemEx, toPosition)
    local destination = {x = 162, y = 41, z = 9} -- Defina a posição de destino para a qual você deseja que o jogador seja teleportado
    local requiredStorage = 100079 -- Valor de storage necessário para teleportar
    
    if getPlayerStorageValue(cid, requiredStorage) < 1 then
        -- Se o jogador não tiver o valor de storage necessário, exiba uma mensagem e saia
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não tem permissão para usar este item.")
        return true
    end

    doTeleportThing(cid, destination)
    return true
end