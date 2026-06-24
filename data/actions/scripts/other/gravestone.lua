function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x = 101, y = 56, z = 12}
        if(item.itemid == 1409 and item.actionid == 60456) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
				doCreatureSay(cid, "Grrrrrrrr.", TALKTYPE_ORANGE_1)
        end
        return TRUE
end