local bosses = {
    ["lethal lissy"] = {
        storage = 45699,
        extraStorage = 50000,
        tempo = 2 * 60, -- 2 minutos
        templePos = {x = 266, y = 28, z = 15}
    },
    ["brutus bloodbeard"] = {
        storage = 45700,
        extraStorage = 50001,
        tempo = 10 * 60, -- 10 minutos
        templePos = {x = 266, y = 28, z = 15}
    }
}

function onKill(cid, target, lastHit)
    if not isPlayer(cid) or not isMonster(target) then
        return true
    end

    local name = string.lower(getCreatureName(target))
    local config = bosses[name]
    if not config then
        return true
    end

    -- Define cooldown e marca recompensa
    setPlayerStorageValue(cid, config.storage, os.time() + config.tempo)
    setPlayerStorageValue(cid, config.extraStorage, 1)

    -- Teleporta para o templo
    doTeleportThing(cid, config.templePos)
    doSendMagicEffect(config.templePos, CONST_ME_TELEPORT)

    -- Mensagem para o jogador
    local minutos = math.floor(config.tempo / 60)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,
        "Voçê derrotou " .. name .. "! Vá buscar sua recompensa no Bau. Voçê só poderá enfrenta-lo novamente em " .. minutos .. " minutos."
    )

    return true
end
