function onStepIn(cid, item, pos)

local pharaot = {x = 1139, y = 2032, z = 7}

    if item.actionid == 61009 then
        doPlayerSetTown(cid,62) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Braga")
        end
    return 1
end  