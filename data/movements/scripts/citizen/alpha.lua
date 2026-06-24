function onStepIn(cid, item, pos)

local pharaot = {x = 2195, y = 1689, z = 7}

    if item.actionid == 61014 then
        doPlayerSetTown(cid,69) 
		doTeleportThing(cid,pharaot)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Alpha")
        end
    return 1
end  