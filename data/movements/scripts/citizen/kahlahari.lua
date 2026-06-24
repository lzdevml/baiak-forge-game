function onStepIn(cid, item, pos)

local pharaot = {x = 1277, y = 1689, z = 6}

    if item.actionid == 61008 then
        doPlayerSetTown(cid,61) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Kahlahari")
        end
    return 1
end  