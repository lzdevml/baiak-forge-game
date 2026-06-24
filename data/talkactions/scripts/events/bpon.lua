
local pos = {x = 24, y = 150, z = 6} ---onde tp vai ser criado
local topos = {x = 326, y = 152, z = 7}

function onSay(cid, words, param, channel)
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal Foi aberto, Boa Sorte a Todos!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal Foi aberto, Boa Sorte a Todos!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal Foi aberto, Boa Sorte a Todos!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal Foi aberto, Boa Sorte a Todos!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal Foi aberto, Boa Sorte a Todos!')
	doPlayerBroadcastMessage(cid, '[EVENTO DICE] Portal Foi aberto, Boa Sorte a Todos!')
	doCreateTeleport(1387, topos , pos)
	return true
end
