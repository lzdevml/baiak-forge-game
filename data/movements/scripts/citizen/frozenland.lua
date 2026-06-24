function onStepIn(cid, item, pos)

local pharaot = {x = 2176, y = 809, z = 7}

    if item.actionid == 61005 then
        doPlayerSetTown(cid,58) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of frozenland")
        end
    return 1
end  