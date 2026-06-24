function onUse(cid, item, frompos, item2, topos)
doSendMagicEffect(getCreaturePosition(cid), 30)
doPlayerAddPointsp(cid, 1) 
doPlayerSendTextMessage(cid, 22,"Você recebeu 1 ponto no site")
doRemoveItem(item.uid) 
return true
end