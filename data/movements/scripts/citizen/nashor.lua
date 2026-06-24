function onStepIn(cid, item, pos)

local pharaot = {x = 15210, y = 1302, z = 7}

    if item.actionid == 61002 then
        doPlayerSetTown(cid,51) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Nashor.")
        end
    return 1
end  