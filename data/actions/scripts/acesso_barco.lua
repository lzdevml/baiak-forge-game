function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (getPlayerStorageValue(cid, 487840) < 1) then
		if doRemoveItem(item.uid, 1) then
			doPlayerSendTextMessage(cid, 22, "Você agora possui acesso a Nashor e Secret Mystic.")
			setPlayerStorageValue(cid, 487840, 1)
		else
			doPlayerSendTextMessage(cid, 25, "ERROR! Please contact the administrator.")
			return true
		end
	else
		doPlayerSendTextMessage(cid, 22, "Você já possui acesso a Nashor e Secret Mystic.")
		return true
	end
	return true
end