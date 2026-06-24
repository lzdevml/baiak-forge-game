function onUse(cid, item, fromPosition, itemEx, toPosition)

-- APENAS SORC E DRUID
if (getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6) then
	if getPlayerFreeCap(cid) > 6218.00 and getPlayerMoney(cid) >= 192000 then
		if doPlayerRemoveMoney(cid, 192000) then
			local purple_bp = doPlayerAddItem(cid, 21128, 1)
			for i = 1, tonumber(getItemInfo(21128).maxItems) do
				doAddContainerItem(purple_bp, 7590, 100 or 1)
			end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 1 BP de great mana potions por 192k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPINK)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 192k em sua BP para fazer esta compra.")
		end
	elseif getPlayerFreeCap(cid) > 310.00 and getPlayerMoney(cid) >= 12000 then
		if doPlayerRemoveMoney(cid, 12000) then
			doPlayerAddItem(cid, 7590, 100)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você comprou 100 de great mana potions por 12k.")
			doSendAnimatedText(getPlayerPosition(cid), "$$$$", COLOR_DARKPINK)
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter 12k em sua BP para fazer esta compra.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '6218.00 oz' e '192k' para comprar BP ou '310.00 oz' e '12k' para comprar 100.")
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Sua vocação não utiliza este item.")
end
return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end