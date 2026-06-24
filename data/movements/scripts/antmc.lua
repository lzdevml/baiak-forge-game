local eventArea = {from = {x=156, y=54, z=7}, to = {x=156, y=54, z=7}}

function onStepIn(cid, item, position, fromPosition)
	if getPlayerGuildId(cid) == 0 then
		doTeleportThing(cid, fromPosition, false)
		doPlayerSendTextMessage(cid, 25, "Você precisa fazer parte de alguma guild para passar aqui.")
	end

	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, 25, "Não é permitido entrar com 2 personagens no mesmo IP!")
			return true
		end
	end
	return true
end