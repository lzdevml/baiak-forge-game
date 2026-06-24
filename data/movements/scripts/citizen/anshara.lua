function onStepIn(cid, item, pos)

local pharaot = {x = 1696, y = 651, z = 7}

    if item.actionid == 61007 then
        doPlayerSetTown(cid,60) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Anshara")
        end
    return 1
end  