function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 62500 then
		if doPlayerAddItem(cid, 13215, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 62500)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Supreme Health Potions for 62,5k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 62,5k.")
	end
return FALSE
end
