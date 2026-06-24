function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 46937) < 1 then
		setPlayerStorageValue(cid, 46937, 1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Estes sao os melhores SETs FREE do server ! Voce ainda poderá obter os melhores shields,armas e outros equipamentos em quests. No Baiakinho-ot !")
	end
   return true
end