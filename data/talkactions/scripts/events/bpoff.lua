local pos = {x = 24, y = 150, z = 6, stackpos = 1} --local que o foi criado
function onSay(cid, words, param, channel)
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal FECHOU!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal FECHOU!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal FECHOU!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal FECHOU!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal FECHOU!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal FECHOU!')
	doRemoveItem(getThingfromPos(pos).uid,1)
	return true
end
