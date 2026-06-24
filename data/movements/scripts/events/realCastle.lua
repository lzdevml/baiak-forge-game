--[[

                Real Castle Event
    Desenvolvido por V�tor Bertolucci (Killua)

]]

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if item.actionid == 61465 then
        if realCastle.isOpen() then
            if getPlayerGuildId(cid) > 0 then
                if getPlayerLevel(cid) >= 120 then
                    doSendMagicEffect(getThingPos(cid),CONST_ME_MAGIC_BLUE)
                else
                    doPlayerSendCancel(cid,"Somente jogadores level 120+ podem tentar dominar o castelo.")
                    doTeleportThing(cid,fromPosition)
                    doSendMagicEffect(fromPosition,CONST_ME_POFF)
                end
            else
                doPlayerSendCancel(cid,"Somente jogadores com guild podem tentar dominar o castelo.")
                doTeleportThing(cid,fromPosition)
                doSendMagicEffect(fromPosition,CONST_ME_POFF)
            end
        else
            doPlayerSendCancel(cid,"O castelo n�o est� aberto para invas�es.")
            doTeleportThing(cid,fromPosition)
            doSendMagicEffect(fromPosition,CONST_ME_POFF)
        end
    elseif item.actionid == 61466 then
        if not realCastle.isOpen() then
            if realCastle.isDominating(cid) then
                doSendMagicEffect(getThingPos(cid),CONST_ME_MAGIC_BLUE)
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Bem vindo ao Real Castle!")
            else
                doPlayerSendCancel(cid,"Somente membros da guild dominante podem entrar.")
                doTeleportThing(cid,{x = toPosition.x, y = toPosition.y + 2, z = toPosition.z})
                doSendMagicEffect({x = toPosition.x, y = toPosition.y + 2, z = toPosition.z},6)
            end
        else
            doPlayerSendCancel(cid,"N�o � permitido entrar no castelo enquanto as guild est�o batalhando pelo seu dom�nio.")
            doTeleportThing(cid,{x = toPosition.x, y = toPosition.y + 2, z = toPosition.z})
            doSendMagicEffect({x = toPosition.x, y = toPosition.y + 2, z = toPosition.z},6)
        end
    end
    return true
end
