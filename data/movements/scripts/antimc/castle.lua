local eventArea = {from = {x = 19876, y = 20092, z = 7}, to = {x = 19887, y = 20096, z = 7}} -- area do evento...
function onStepIn(cid, item, position, fromPosition)
	for _, pid in pairs(getPlayersOnline()) do
		if(cid ~= pid and getPlayerIp(cid) == getPlayerIp(pid) and isInRange(getThingPos(pid), eventArea.from, eventArea.to)) then
			doTeleportThing(cid, fromPosition, false)
			doSendMagicEffect(getPlayerPosition(cid), 34)
			doPlayerSendTextMessage(cid, 25, "[GUERRA JUSTA] Para uma Guerra justa, entre com seu melhor personagem para lutar.")
			return true
		end
	end
	return true
end