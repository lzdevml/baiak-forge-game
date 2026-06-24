function onTime ()
	doItemSetAttribute(doCreateItem(1387, 1, {x=165, y=53, z=7, stackpos = 1}), "aid", 2137)
	countDownTeleport({x=165, y=53, z=7}, 300)
	doBroadcastMessage("Desert WAR começará em 5 minutos! O teletransporte será fechado quando o evento começar.", MESSAGE_STATUS_WARNING)
	setGlobalStorageValue(4, 0)
	setGlobalStorageValue(5, 0)
	addEvent(startDesert, 5 * 60 * 1000)
	return true
end

function startDesert()
	doRemoveItem(getTileItemById({x=165, y=53, z=7}, 1387).uid, 1)
	if getGlobalStorageValue(4) > 0 and getGlobalStorageValue(5) > 0 then
		doBroadcastMessage("Boa sorte aos participantes do Desert War! O teletransporte fechou.", MESSAGE_STATUS_WARNING)		
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doCreatureSetNoMove(cid, false)
			end
		end
	else
		doBroadcastMessage("Desert War não começou porque não havia jogadores suficientes. Conclua os eventos para obter points.")
		for _, cid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(cid, 51) > 0 or getPlayerStorageValue(cid, 52) > 0 then
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end