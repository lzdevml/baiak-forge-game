local eventArea = {from = {x = 870, y = 31924, z = 8}, to = {x = 947, y = 31963, z = 8}} -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doSendMagicEffect(getPlayerPosition(cid), 34)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Não e permitido entrar com 2 chars no mesmo IP!")
			return true
		end
	end
	return true
end