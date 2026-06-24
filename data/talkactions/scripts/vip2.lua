function onSay(cid, words, param)
    local vipPrice = 30000000 -- 30KK
    local vipStorage = 13540  -- storage da VIP

    if getPlayerMoney(cid) < vipPrice then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não tem dinheiro suficiente para comprar a VIP II.")
        doCreatureSay(cid, "Não tenho dinheiro suficiente!", TALKTYPE_ORANGE_1)
        return false
    end

    -- Remove o dinheiro
    doPlayerRemoveMoney(cid, vipPrice)

    -- Define a storage como 1 (VIP ativa infinita)
    setPlayerStorageValue(cid, vipStorage, 1)

    -- Mensagem de sucesso
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns! Você comprou VIP II.")
    return true
end
