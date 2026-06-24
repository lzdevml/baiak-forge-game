function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (getPlayerStorageValue(cid, 38209) < 1) then
		if doRemoveItem(item.uid, 1) then
			doPlayerSendTextMessage(cid, 22, "Você agora reflete dano aos seus inimigos.")
			setPlayerStorageValue(cid, 38209, 1)

if getPlayerStorageValue(cid, 38209) < 1 then
   setPlayerStorageValue(cid, 38209, 1)
end
		else
			doPlayerSendTextMessage(cid, 25, "ERROR! Please contact the administrator.")
			return true
		end
	else
		doPlayerSendTextMessage(cid, 22, "Você já está refletindo dano.")
		return true
	end
	return true
end