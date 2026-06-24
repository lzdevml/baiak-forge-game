local pos = {x = 101, y = 55, z = 12}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE then
             doTeleportThing(cid, pos, TRUE)
             doSendMagicEffect(pos, 10)
    return TRUE
end  
end
