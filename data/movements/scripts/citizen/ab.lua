function onStepIn(cid, item, pos)

local pharaot = {x = 2474, y = 5530, z = 7}

    if item.actionid == 61023 then
        doPlayerSetTown(cid,104) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Ab'Dendriel.")
        end
    return 1
end  