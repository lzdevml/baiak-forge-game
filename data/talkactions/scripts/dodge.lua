function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

	if param == "" then
		doPlayerPopupFYI(cid,"LEVEL PROTECT: [".. getPlayerStorageValue(cid, 35034) .."/100].")
		return true
	end
	return true
end