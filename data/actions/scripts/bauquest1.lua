function onUse(cid, item, frompos, item2, topos)
if item.uid == 2021 then
queststatus = getPlayerStorageValue(cid,2021)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Mermaid Comb")
item_uid = doPlayerAddItem(cid,5945,1)
setPlayerStorageValue(cid,2021,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end