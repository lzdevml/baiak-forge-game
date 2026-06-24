function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid,722381) >= os.time() then
		doPlayerSendCancel(cid,"Você já está com o BOOST ativado!")
		return true
	end
    if doRemoveItem(item.uid) then
    	doPlayerSetStorageValue(cid,722381,os.time() + 3600 *7)
    	doSendMagicEffect(getThingPos(cid),49)
    	doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,"Você ativou o Auto Loot BOOST por mais 7 horas. Durante esse tempo os itens coletados serão vendidos automaticamente e o dinheiro será depositado no seu banco.")
    end
    return true
end
