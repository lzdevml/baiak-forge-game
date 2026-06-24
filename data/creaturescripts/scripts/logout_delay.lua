function onLogout(cid, forceLogout)
	if tonumber(getPlayerStorageValue(cid, 13184)) > os.time() then
		doPlayerSendCancel(cid, "Wait a while.")
		return false
	end
	return true
end