function onUse(cid, item, frompos, itemEx, topos)

	if(itemEx.itemid == 1945) then
		if getPlayerItemCount(cid, 11197) >= 200 and getPlayerItemCount(cid, 11198) >= 80 and getPlayerMoney(cid) >= 1000000 then
					if getPlayerFreeCap(cid) > 10.00 then	
				if doPlayerRemoveItem(cid, 11197, 200) and doPlayerRemoveItem(cid, 11198, 80) and doPlayerRemoveMoney(cid, 1000000) then
					local chance_sucess = 35
					if ((chance_sucess) > math.random(1, 100)) then
						doSendAnimatedText(getCreaturePosition(cid), "Sucess!", TEXTCOLOR_LIGHTGREEN)
						doPlayerAddItem(cid, 12807, 1)
						doBroadcastMessage("[HORUS] ".. getPlayerName(cid) .." acabou de craftar o item horus helmet, parabéns!", MESSAGE_STATUS_CONSOLE_BLUE)
					else
						doSendAnimatedText(getCreaturePosition(cid), "Failed!", TEXTCOLOR_RED)
						doPlayerSendTextMessage(cid, 22, "Que pena. Você falhou ao craftar este item.")
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "ERROR! Contact the Administrator.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '50.00 oz' para comprar este item.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "Itens necessários para craftar \n\n 200 Ritual Points.\n 80 Boss Points.\n 1 Diamond Coin.")
		end
				
		doTransformItem(itemEx.uid, 1946)
	elseif (itemEx.itemid == 1946) then
		doTransformItem(itemEx.uid, 1945)
	end
	return true
end