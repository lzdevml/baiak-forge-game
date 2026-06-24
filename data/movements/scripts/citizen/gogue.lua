function onStepIn(cid, item, pos)

local pharaot = {x = 427, y = 3142, z = 7}

    if item.actionid == 61021 then
        doPlayerSetTown(cid,95) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Gogue.")
        end
    return 1
end  