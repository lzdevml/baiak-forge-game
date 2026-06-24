function onUse(cid, item, frompos, itemEx, topos)

	if(itemEx.itemid == 1945) then
		if getPlayerItemCount(cid, 12468) >= 5 and getPlayerItemCount(cid, 12422) >= 30 and doPlayerRemoveItem(cid, 6527, 25) then
					if getPlayerFreeCap(cid) > 10.00 then	
				if doPlayerRemoveItem(cid, 12468, 5) and doPlayerRemoveItem(cid, 12422, 30) and doPlayerRemoveItem(cid, 6527, 25) then
					local chance_sucess = 7
					if ((chance_sucess) > math.random(1, 100)) then
						doSendAnimatedText(getCreaturePosition(cid), "Sucess!", TEXTCOLOR_LIGHTGREEN)
						doPlayerAddItem(cid, 12838, 1)
						doBroadcastMessage("[Anubis] ".. getPlayerName(cid) .." acabou de craftar o item Anubis Club, parabéns!", MESSAGE_STATUS_CONSOLE_BLUE)
					else
						doSendAnimatedText(getCreaturePosition(cid), "Failed!", TEXTCOLOR_RED)
						doPlayerSendTextMessage(cid, 22, "Que pena. Você falhou ao craftar este item.")
					end
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "ERROR! Contact the Administrator.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '50.00 oz' para craftar este item.")
			end
		else
			doPlayerSendTextMessage(cid, 27, "Itens necessários para craftar \n\n 5 anubis flask.\n 30 chaos essence.\n 25 Event Coins.")
		end
				
		doTransformItem(itemEx.uid, 1946)
	elseif (itemEx.itemid == 1946) then
		doTransformItem(itemEx.uid, 1945)
	end
	return true
end