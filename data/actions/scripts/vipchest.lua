-- by ChukiNowhis --
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==13541 then
queststatus = getPlayerStorageValue(cid,13401)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"Voçê já pegou sua recompensa.")
 
else
doPlayerSendTextMessage(cid,22,"Voçê agora é vip.")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,2160,100)
coins_uid = doPlayerAddItem(cid,2322,1)
setPlayerStorageValue(cid,13401,1)
end
return 0
end
return 1
end
