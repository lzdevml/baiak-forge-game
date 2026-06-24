local AccPorIp = 4

function onLogin(cid)

	local mc = 0
	for _, verificar in ipairs(getPlayersOnline()) do
		if getPlayerIp(cid) == getPlayerIp(verificar) then
			mc = mc + 1
			if mc > AccPorIp then return false end
		end
	end
	
	return true
end