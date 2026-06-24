function onStepIn(cid, item, pos)

local pharaot = {x = 588, y = 644, z = 7}

    if item.actionid == 61004 then
        doPlayerSetTown(cid,54) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Svargrond.")
        end
    return 1
end  