function onStepIn(cid, item, pos)

local pharaot = {x = 33217, y = 31814, z = 8}

    if item.actionid == 61024 then
        doPlayerSetTown(cid,99) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Edron.")
        end
    return 1
end  