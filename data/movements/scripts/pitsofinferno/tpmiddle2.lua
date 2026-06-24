--function by Armageddom--
function onStepIn(cid, item, frompos, item2, topos) 

playerpos = getPlayerPosition(cid) 
novapos = {x = 234, y = 456, z = 11}

if item.uid == 10252 then

getThingfromPos(playerpos) 
doSendMagicEffect(playerpos,4) 
doTeleportThing(cid,novapos) 
end 
end