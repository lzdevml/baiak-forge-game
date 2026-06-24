function onStepIn(cid, item, position, fromPosition, toPosition)
	if (not isPlayer(cid)) then
		return true
	end

	if getGlobalStorageValue("castle02") < 1 then
		doTeleportThing(cid, fromPosition, true)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O castelo ainda nao começou!")
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Pise no Trono.")
	end
    return true
end