function onStepIn(cid, item, pos)

local pharaot = {x = 3513, y = 2890, z = 7}

    if item.actionid == 61019 then
        doPlayerSetTown(cid,54) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),97)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Thais.")
        end
    return 1
end  