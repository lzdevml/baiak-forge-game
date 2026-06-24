

function onUse(cid, item, frompos, item2, topos)
if item.uid == 13001 then

playerpos = {x=33017, y=32418, z=7}


doTeleportThing(cid, playerpos)

doSendMagicEffect(playerpos,6)

end
return 1
end