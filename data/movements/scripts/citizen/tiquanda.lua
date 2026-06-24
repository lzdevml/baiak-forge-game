function onStepIn(cid, item, pos)

local pharaot = {x = 132, y = 173, z = 7}

    if item.actionid == 61003 then
        doPlayerSetTown(cid,57) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Tiquanda")
        end
    return 1
end  