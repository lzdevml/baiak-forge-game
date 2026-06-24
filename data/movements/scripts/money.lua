function onEquip(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, "ICE_RAPIER") <= 0 then
		doPlayerSendCancel(cid, "Voce nao pode equipar esse item no slot.")
		return true
	end
end