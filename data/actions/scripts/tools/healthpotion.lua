function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 8000 then
		if doPlayerAddItem(cid, 7618, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 8000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Health Potion for 8k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 8k.")
	end
return FALSE
end
