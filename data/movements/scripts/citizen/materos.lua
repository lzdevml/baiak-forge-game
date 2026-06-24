function onStepIn(cid, item, pos)

local materos = {x = 1771, y = 1332, z = 7}

    if item.actionid == 61006 then
        doPlayerSetTown(cid,59) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of materos")
        end
    return 1
end  