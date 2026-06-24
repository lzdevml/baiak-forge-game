local config = {
oldItem = 8981, -- ID do item antigo que ira ser transformado
oldCount = 100, -- Quantidade necessaria para transformar o antigo item
newItem = 13212, -- ID do novo item ao ser transformado 100 unidades
newCount = 1, -- quantidade que ira ser adicionado do novo item
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.itemid == config.oldItem and item.type == config.oldCount then
	doPlayerAddItem(cid,config.newItem,config.newCount)
	doRemoveItem(item.uid,item.type)
	doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Voce transformou "..item.type.." "..getItemNameById(item.itemid).." em "..config.newCount.." "..getItemNameById(config.newItem)..".")
	doSendMagicEffect(getPlayerPosition(cid),25)
else
return false
end
return true
end
