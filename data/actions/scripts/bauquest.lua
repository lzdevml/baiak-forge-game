function onUse(cid, item, frompos, item2, topos)
if item.uid == 2020 then
queststatus = getPlayerStorageValue(cid,2020)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Blessed Wooden Stake")
item_uid = doPlayerAddItem(cid,5942,1)
setPlayerStorageValue(cid,2020,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end