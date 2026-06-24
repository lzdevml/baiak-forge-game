function onStepIn(cid, item, pos)

local pharaot = {x = 5116, y = 5007, z = 7}

    if item.actionid == 61011 then
        doPlayerSetTown(cid,65) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Vikia")
        end
    return 1
end  