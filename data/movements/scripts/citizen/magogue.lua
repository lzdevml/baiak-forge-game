function onStepIn(cid, item, pos)

local pharaot = {x = 253, y = 2979, z = 7}

    if item.actionid == 61022 then
        doPlayerSetTown(cid,96) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Magogue.")
        end
    return 1
end  