function onStepIn(cid, item, pos)

local pharaot = {x = 1344, y = 2081, z = 7}

    if item.actionid == 61010 then
        doPlayerSetTown(cid,63) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Quefren")
        end
    return 1
end  