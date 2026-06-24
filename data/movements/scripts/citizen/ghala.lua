function onStepIn(cid, item, pos)

local pharaot = {x = 6114, y = 6008, z = 7}

    if item.actionid == 61013 then
        doPlayerSetTown(cid,67) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Ghala.")
        end
    return 1
end  