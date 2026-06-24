local BombermanDays = {1, 2, 3, 4, 5, 6, 7} -- dias de semana que vai abrir

local function announce(message, times)
	if times == 0 then return true end
	doBroadcastMessage(message)
	addEvent(announce,5*60000,message,times - 1)
end

local function endBombermanEvent()
	local tp, players = getTileItemById(bomberman.tpPos, 1387), getCreaturesFromArea({x=2153,y=93,z=7}, {x=2163,y=102,z=7}, true)
	if tp and tp.uid > 0 then
		doRemoveItem(tp.uid)
	end
	if (#players > 0) then
		for i=1, #players do
			pid = players[i]
			doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
		end
	end

	setGlobalStorageValue(722641, -1)
	doBroadcastMessage("[Bomberman Event] O teleport para as arenas de bomberman está fechado. O Evento foi encerrado.")
end

function onTime()
	local time = os.date("*t")
	if ((getGlobalStorageValue(722641) == -1) and (isInArray(BombermanDays, time.wday))) then
		setGlobalStorageValue(722641, 1)
		doCreateTeleport(1387, {x=2153,y=99,z=7}, bomberman.tpPos)
		announce("[Bomberman Event] O teleport para as arenas de Bomberman está aberto até as 17:00. Divirtam-se!", 10)
		addEvent(endBombermanEvent, 60*1000*60) -- 60 minutos para fechar o evento
	end
    return true
end