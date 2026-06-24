function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 10000 then
		if doPlayerAddItem(cid, 7588, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 22000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Strong Health Potion for 10k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 10k.")
	end
return FALSE
end
