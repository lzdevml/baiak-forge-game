local bosses = {
    [13002] = { -- ActionID para Lethal Lissy
        storage = 45699,
        bossName = "Lethal Lissy",
        bossPos = {x = 176, y = 919, z = 10},
        playerPos = {x = 170, y = 926, z = 10},
        cooldown = 24 * 60 * 60 -- 24h em segundos
    },
    [13003] = { -- Outro boss (exemplo)
        storage = 45700,
        bossName = "Brutus Bloodbeard",
        bossPos = {x = 220, y = 931, z = 10},
        playerPos = {x = 214, y = 937, z = 10},
        cooldown = 12 * 60 * 60 -- 12h
    }
    -- Adicione quantos quiser aqui
}

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end

    local config = bosses[item.actionid]
    if not config then
        print("[BossTeleport] Nenhuma configuração encontrada para ActionID: " .. item.actionid)
        return true
    end

    local time = getPlayerStorageValue(cid, config.storage)
    local now = os.time()

    if time > now then
        local restante = math.ceil((time - now) / 3600)
        doPlayerSendCancel(cid, "Você só poderá enfrentar este boss novamente daqui " .. restante .. " hora(s).")
        doTeleportThing(cid, fromPosition, true)
        return true
    end

    doTeleportThing(cid, config.playerPos)
    doSendMagicEffect(config.playerPos, CONST_ME_TELEPORT)
    doCreateMonster(config.bossName, config.bossPos)
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O boss " .. config.bossName .. " apareceu! Boa sorte.")

    -- Salva cooldown
    setPlayerStorageValue(cid, config.storage, now + config.cooldown)

    return true
end
