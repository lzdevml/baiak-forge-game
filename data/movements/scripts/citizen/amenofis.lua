function onStepIn(cid, item, pos)

local pharaot = {x = 2512, y = 1775, z = 7}

    if item.actionid == 61018 then
        doPlayerSetTown(cid,77) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Amenofis.")
        end
    return 1
end  