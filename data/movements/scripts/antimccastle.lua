local eventArea = {from = {x=3164, y=249, z=7}, to = {x=3291, y=338, z=7}} -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) then return true end
	for _, pid in pairs(getPlayersOnline()) do
		if not isPlayer(cid) then return true end
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, 25, "[ANTI-MC] Não é permitido entrar com 2 chars no mesmo IP!")
			return true
		end
	end
	return true
end