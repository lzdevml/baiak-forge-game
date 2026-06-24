function onStepIn(cid, item, pos)

local pharaot = {x = 154, y = 737, z = 6}

    if item.actionid == 61001 then
        doPlayerSetTown(cid,53) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Nargor.")
        end
    return 1
end  