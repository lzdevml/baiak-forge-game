function onUse(cid, item, fromPosition, itemEx, toPosition)

-- APENAS SORC E DRUID
if (getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6) then
	if getPlayerFreeCap(cid) > 2.50 and getPlayerMoney(cid) >= 40000 then
		if doPlayerRemoveMoney(cid, 40000) then
			doPlayerAddItem(cid, 13454, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 recargas de exercise rod por 40k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPINK)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 40k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '2.50 oz' e '40k' para comprar 100 exercise rod.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return 
end