function onUse(cid, item, frompos, item2, topos)
	if getPlayerMoney(cid) >= 44000 then
		if doPlayerAddItem(cid, 13214, 100, false) then
			doSendMagicEffect(topos, 14)
			doPlayerRemoveMoney(cid, 44000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Bought 100x Ultimate Spirit Potions for 44k.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have capacity enough.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont have enough money 44k.")
	end
return FALSE
end
