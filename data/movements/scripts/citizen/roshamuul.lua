function onStepIn(cid, item, pos)

local pharaot = {x = 24823, y = 143, z = 12}

    if item.actionid == 61015 then
        doPlayerSetTown(cid,74) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Roshamuul")
        end
    return 1
end  