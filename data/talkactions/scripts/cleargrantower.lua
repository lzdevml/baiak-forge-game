function onSay(cid, words, param, channel) 
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end		
	local t = string.explode(param, " ")
	
	if (tonumber(t[1]) == 1) then
		doPrepareGranTower()
		doSendMagicEffect(getCreaturePosition(cid), 14)
	elseif (tonumber(t[1]) == 0) then
		doCloseGranTower()
		doSendMagicEffect(getCreaturePosition(cid), 14)
	elseif (tonumber(t[1]) == 2) then
		print(getGlobalStorageValue(GRANTOWER.SAVELASTWINNER))
		doSendMagicEffect(getCreaturePosition(cid), 14)
	elseif (tonumber(t[1]) == 3) then
		print(getGlobalStorageValue(GRANTOWER.GRANTOWER.SAVEWINNERGUILDID))
		doSendMagicEffect(getCreaturePosition(cid), 14)
	end	
return true
end