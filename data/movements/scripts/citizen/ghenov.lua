function onStepIn(cid, item, pos)

local pharaot = {x = 7073, y = 7192, z = 5}

    if item.actionid == 61012 then
        doPlayerSetTown(cid,66) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Ghenov")
        end
    return 1
end  