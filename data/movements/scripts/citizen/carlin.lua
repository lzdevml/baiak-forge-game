function onStepIn(cid, item, pos)

local pharaot = {x = 2102, y = 5678, z = 7}

    if item.actionid == 61020 then
        doPlayerSetTown(cid,98) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Carlin.")
        end
    return 1
end  