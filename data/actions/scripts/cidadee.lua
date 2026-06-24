

function onUse(cid, item, frompos, item2, topos)
if item.uid == 13002 then

playerpos = {x=32448, y=32385, z=7}


doTeleportThing(cid, playerpos)

doSendMagicEffect(playerpos,6)

end
return 1
end