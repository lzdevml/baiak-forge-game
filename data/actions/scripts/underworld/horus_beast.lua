function onUse(cid, item, frompos, itemEx, topos)

	if(itemEx.itemid == 1945) then
		if getPlayerItemCount(cid, 6527) >= 100 and getPlayerItemCount(cid, 12468) >= 5 and getPlayerMoney(cid) >= 1000000 then
					if getPlayerFreeCap(cid) > 200.00 then	
				if doPlayerRemoveItem(cid, 6527, 100) and doPlayerRemoveItem(cid, 12468, 5) and doPlayerRemoveMoney(cid, 1000000) then
					local chance_sucess = 10
					if ((chance_sucess) > math.random(1, 100)) then
						doSendAnimatedText(getCreaturePosition(cid), "Sucess!", TEXTCOLOR_LIGHTGREEN)
						doPlayerAddItem(cid, 12835, 1)
						doBroadcastMessage("[anubis] ".. getPlayerName(cid) .." acabou de forjar o item anubis beast, parabéns!", MESSAGE_STATUS_CONSOLE_BLUE)
					else
						doSendAnimatedText(getCreaturePosition(cid), "Failed!", TEXTCOLOR_RED)
						doPlayerSendTextMessage(cid, 22, "Que pena. Você falhou ao forjar este item.")
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "ERROR! Contact the Administrator.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '200.00 oz' para comprar este item.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "Itens necessários para forjar \n\n 100 Event Coins.\n 5 Anubis Flask.\n 1 Diamond Coin.")
		end
				
		doTransformItem(itemEx.uid, 1946)
	elseif (itemEx.itemid == 1946) then
		doTransformItem(itemEx.uid, 1945)
	end
	return true
end