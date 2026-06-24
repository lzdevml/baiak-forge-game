function onSay(cid, words, param, channel)
	if getPlayerClientVersion(cid) == 861 then
		sendMountWindow(cid)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Baixe o nosso cliente para utilizar as montarias!")
	end
	
	return true
end