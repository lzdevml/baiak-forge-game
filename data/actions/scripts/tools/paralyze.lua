function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 7000 then
		if doPlayerAddItem(cid, 2278, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 7000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce adquiriu 100 Paralyzes por 7k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nao tem capacidade suficiente.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao possui 7k.")
	end
return FALSE
end
