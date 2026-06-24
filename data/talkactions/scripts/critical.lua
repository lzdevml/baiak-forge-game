function onSay(cid, words, param)
if(not checkExhausted(cid, 666, 2)) then
	return true
end

	if param == "" then
		doPlayerPopupFYI(cid,"HIT LETAL: [".. getPlayerStorageValue(cid, 35033) .."/100].")
		return true
	end
	return true
end