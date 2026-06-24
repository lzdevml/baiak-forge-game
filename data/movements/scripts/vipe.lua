-- Script Vip System 1.0 --
function onStepIn(cid, item, position, fromPosition)

    local config = {
        msgDenied = "Você não é VIP II, para adquirir fale !buyvip que custa 30KK",
        msgWelcome = "Seja Bem Vindo à Área VIP II."
    }

    -- VIP infinita: verifica se storage > 0
    if getPlayerStorageValue(cid, 13540) <= 0 then
        doTeleportThing(cid, fromPosition, true)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
        doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
        return true
    end

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
    return true
end
