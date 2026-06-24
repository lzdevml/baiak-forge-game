local function warnGods(text)
	for a, pid in pairs(getPlayersOnline()) do
		if getPlayerAccess(pid) >= 4 then
			doPlayerSendTextMessage(pid,MESSAGE_STATUS_CONSOLE_ORANGE,text)
		end
	end
	print(text)
end

function onThink(cid, interval)
	local players = getPlayersOnline()
	local ip = {}
	for _, pid in pairs(players) do
		if getPlayerIp(pid) == 0 then
			table.insert(ip,pid)
		end
	end
	if ((#ip * 100) / #players) >= 15 then
		for a, n in pairs(ip) do
			if isPlayer(n) then
				warnGods("Kikando "..getPlayerName(n).." por proteção contra disconnect.")
				doRemoveCreature(n)
			end
		end
	end
	return true
end
