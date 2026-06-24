function onUse (cid,item,frompos,item2,topos)
pos = {x=153, y=52, z=7}
pos2 = getPlayerPosition(cid)
 
if getPlayerLevel(cid) >= 8 then
if item.uid == 9696 then
queststatus = getPlayerStorageValue(cid,72785)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Parabens você pegou seus pontos.")
doPlayerAddItem(cid,6523,1)
setPlayerStorageValue(cid,72785,1)
doSendMagicEffect(getThingPos(cid), 29)
else
doPlayerSendTextMessage(cid,22,"Você ja recebeu seus pontos free.")
end
end
else
doPlayerSendCancel(cid,'Somente Levels 8+ conseguem abrir este bau.')
end
return 1
end