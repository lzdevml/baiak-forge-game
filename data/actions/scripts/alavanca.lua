function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=31437, y=31874, z=7, stackpos=1}
local tempo = 1*60*1000 -- tempo para parede voltar
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 3331 and item.itemid == 1945 and getpiece1.itemid == 1304 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
doPlayerSendTextMessage(cid,22,"Voce e seu time tem 60 segundo para passar, ou terao que voltar aqui.")
addEvent(doCreateItem, tempo, 1304, piece1pos)
addEvent(doTransformItem, tempo, item.uid,1945)
elseif item.uid == 3331 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
addEvent(doCreateItem, 2*60*1000, item.itemid, piece1pos)
else
doPlayerSendTextMessage(cid,22,"Voce ja abriu a passagem, corra antes que o tempo acabe.")
end
return 1
end