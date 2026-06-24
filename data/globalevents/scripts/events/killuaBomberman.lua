local function announce(message, times)
	if times == 0 then return true end
	doBroadcastMessage(message)
	addEvent(announce,5*60000,message,times - 1)
end

function onTime()
	if getGlobalStorageValue(722641) == -1 then
		doCreateTeleport(1387, {x=1168,y=275,z=7}, bomberman.tpPos)
		setGlobalStorageValue(722641, 1)
		announce("O teleport para as arenas de Bomberman está aberto até as 17:00!", 10)
	else
		local tp = getTileItemById(bomberman.tpPos, 1387)
		if tp and tp.uid > 0 then
			doRemoveItem(tp.uid)
		end
		local players = getPlayersInArea({x=1168,y=275,z=7}, {x=1168,y=275,z=7})
		if players then
			for _, pid in next, players do
				doTeleportThing(pid, getTownTemplePosition(1))
				doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "O tempo de jogo de bomberman acabou.")
			end
		end
		doBroadcastMessage"O tempo para jogar bomberman acabou e volta amanhã!"
	end
    return true
end
