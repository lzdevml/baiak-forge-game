function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 25000 then
		if doPlayerAddItem(cid, 7591, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 25000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Great Health Potion for 25k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 25k.")
	end
return FALSE
end
