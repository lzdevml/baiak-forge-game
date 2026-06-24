function onStepIn(cid, item, pos)

local pharaot = {x = 160, y = 51, z = 7}

    if item.actionid == 61016 then
        doPlayerSetTown(cid,1) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Styller Citys")
        end
    return 1
end  