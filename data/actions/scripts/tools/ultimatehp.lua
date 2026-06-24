function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 40000 then
		if doPlayerAddItem(cid, 8473, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 40000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Ultimate Health Potion for 40k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 40k.")
	end
return FALSE
end
