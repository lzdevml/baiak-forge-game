function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 35000 then
		if doPlayerAddItem(cid, 8472, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 35000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Great Spirit Potion for 35k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 35k.")
	end
return FALSE
end
