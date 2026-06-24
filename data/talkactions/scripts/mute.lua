local dvArea = {from = {x=118, y=40, z=7}, to = {x=180, y=68, z=7}}
local dvAreaUm = {from = {x=118, y=40, z=6}, to = {x=180, y=68, z=6}}
local dvAreaDois = {from = {x=118, y=40, z=5}, to = {x=180, y=68, z=5}}
function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local t = string.explode(param, ",")
	local pid = getPlayerByNameWildcard(t[1])
	if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[1] .. " is not currently online.")
		return true
	end

	local time = tonumber(t[2])
	if(not time or time <= 0) then
		time = -1
	end

	if getPlayerLevel(cid) > 250 then
		if getPlayerLevel(pid) < 100 then
			if isInRange(getThingPos(pid), dvArea.from, dvArea.to) or isInRange(getThingPos(pid), dvAreaUm.from, dvAreaUm.to) or isInRange(getThingPos(pid), dvAreaDois.from, dvAreaDois.to) then
				setPlayerStorageValue(pid, 179990, 1)
				doMutePlayer(pid, time)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador foi mutado, obrigado por ajudar a acabar com a divulgação no servidor.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador fora de area propicia a divulgação.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode mutar este jogador pois já é level alto.")
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa ter level superior a 200 para mutar jogadores.")
	end
	return true
end