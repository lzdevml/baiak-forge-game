local eventArea = {from = {x = 323, y = 152, z = 7}, to = {x = 343, y = 168, z = 7}} -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doSendMagicEffect(getPlayerPosition(cid), 34)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Nao e permitido entrar com 2 chars no mesmo IP!")
			return true
		end
	end
	return true
end