function onStepIn(cid, item, position, fromPosition)
	if getPlayerGuildId(cid) == 0 then
		doTeleportThing(cid, fromPosition, false)
		doPlayerSendTextMessage(cid, 25, "Você precisa fazer parte de alguma guild para passar aqui.")
	end
	return true
end