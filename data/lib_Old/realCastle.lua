realCastle = {
	
	open_storage = 722374,
	guild_storage = 722375,
	date_storages = {722376,722377,722378},
	open_days = {"Sunday", "Tuesday", "Thursday", "Saturday"},
	frompos = {x = 2162, y = 520, z = 6},
	topos = {x = 2308, y = 610, z = 6}

}

realCastle.removePlayers = function()
	local first_cave = getPlayersInArea({x = 1501, y = 1214, z = 6},{x = 1586, y = 1293, z = 6})
	local second_cave = getPlayersInArea({x = 1592, y = 1212, z = 6},{x = 1679, y = 1291, z = 6})
	local third_cave = getPlayersInArea({x = 1616, y = 1293, z = 6},{x = 1699, y = 1369, z = 6})
	local fourth_cave = getPlayersInArea({x = 1382, y = 1059, z = 7},{x = 1447, y = 1123, z = 4})
	local fifith_cave = getPlayersInArea({x = 1305, y = 1033, z = 7},{x = 1372, y = 1103, z = 4})
	local sixth_cave = getPlayersInArea({x = 1272, y = 963, z = 7},{x = 1345, y = 1028, z = 4})
	local area7 = getPlayersInArea({x = 1350, y = 980, z = 7}, {x = 1419, y = 1043, z = 4})
	local area8 = getPlayersInArea({x = 1289, y = 1142, z = 7}, {x = 1462, y = 1290, z = 7})
	local area9 = getPlayersInArea({x = 1328, y = 479, z = 7}, {x = 1668, y = 709, z = 7})
	local area10 = getPlayersInArea({x = 1501, y = 1216, z = 6}, {x = 1707, y = 1374, z = 6})
	
	local area11 = getPlayersInArea({x = 2277, y = 613, z = 7}, {x = 2462, y = 716, z = 7})
	local area12 = getPlayersInArea({x = 2277, y = 613, z = 6}, {x = 2462, y = 716, z = 6})
	local area13 = getPlayersInArea({x = 2277, y = 613, z = 5}, {x = 2462, y = 716, z = 5})
	local area14 = getPlayersInArea({x = 2277, y = 613, z = 4}, {x = 2462, y = 716, z = 4})
	local area15 = getPlayersInArea({x = 2242, y = 723, z = 6}, {x = 2442, y = 894, z = 6})
	local area16 = getPlayersInArea({x = 2255, y = 804, z = 7}, {x = 2282, y = 832, z = 7})
	local area17 = getPlayersInArea({x = 2103, y = 638, z = 6}, {x = 2262, y = 740, z = 6})
	local area18 = getPlayersInArea({x = 2103, y = 638, z = 7}, {x = 2262, y = 740, z = 7})
	local castle_area = getPlayersInArea(realCastle.frompos,realCastle.topos)
	if first_cave then
		for _, pid in pairs(first_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if second_cave then
		for _, pid in pairs(second_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if third_cave then
		for _, pid in pairs(third_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if fourth_cave then
		for _, pid in pairs(fourth_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	for _, tid in pairs(getPlayersOnline()) do
		local pos = getThingPos(tid)
		if pos.x >= 2288 and pos.x <= 2364 and pos.y >= 433 and pos.y <= 509 then
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(tid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	for _, tid in pairs(getPlayersOnline()) do
		local pos = getThingPos(tid)
		if pos.x >= 2148 and pos.x <= 2189 and pos.y >= 641 and pos.y <= 679 then
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(tid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	for _, tid in pairs(getPlayersOnline()) do
		local pos = getThingPos(tid)
		if pos.x >= 2229 and pos.x <= 622 and pos.y >= 2320 and pos.y <= 704 then
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(tid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if fifith_cave then
		for _, pid in pairs(fifith_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if sixth_cave then
		for _, pid in pairs(sixth_cave) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area10 then
		for _, pid in pairs(area10) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area11 then
		for _, pid in pairs(area11) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area12 then
		for _, pid in pairs(area12) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area13 then
		for _, pid in pairs(area13) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area14 then
		for _, pid in pairs(area14) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area15 then
		for _, pid in pairs(area15) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area16 then
		for _, pid in pairs(area16) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area17 then
		for _, pid in pairs(area17) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
	if area18 then
		for _, pid in pairs(area18) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end

	if castle_area then
		for _, pid in pairs(castle_area) do
			doTeleportThing(pid,getTownTemplePosition(1))
			doPlayerPopupFYI(pid,"O domínio de sua guild sob o castelo acabou e uma nova batalha está se iniciando.")
		end
	end
end

realCastle.open = function()
	setGlobalStorageValue(realCastle.open_storage, 1)
	setGlobalStorageValue(realCastle.guild_storage, -1)
	realCastle.removePlayers()
end

realCastle.release = function()
	setGlobalStorageValue(realCastle.guild_storage,-1)
	realCastle.removePlayers()
end

realCastle.close = function()
	setGlobalStorageValue(realCastle.open_storage, -1)
	local tomorrow = getTomorrowsDate(getTomorrowsDate()[1])
	for i = 1,3 do
		setGlobalStorageValue(realCastle.date_storages[i],tomorrow[i])
	end
	local players = getPlayersInArea(realCastle.frompos, realCastle.topos)
	if players then
		for _, pid in pairs(players) do
			doTeleportThing(pid,getTownTemplePosition(1))
		end
	end
	if getGlobalStorageValue(realCastle.guild_storage) == -1 then
		doBroadcastMessage("[Real Castle] A batalha terminou e nenhuma guild conseguiu dominar o castelo! Amanhã às 19:00 vocês podem tentar novamente!")
	else
		doBroadcastMessage("[Real Castle] A batalha terminou e a guild vencedora foi "..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).."! Todos os jogadores dessa guild agora podem aproveitar o castelo até amanhâ às 19:00!")
	end
	doSaveServer()
end

realCastle.broadcast = function(message)
	local players = getPlayersInArea(realCastle.frompos, realCastle.topos)
	if players then
		for _, pid in pairs(players) do
			doPlayerSendTextMessage(pid,MESSAGE_STATUS_WARNING,message)
		end
	end
end

realCastle.domain = function(cid)
	local guild_id = getPlayerGuildId(cid)
	setGlobalStorageValue(realCastle.guild_storage,guild_id)
	realCastle.broadcast("[Real Castle] O jogador "..getPlayerName(cid).." da guild "..getPlayerGuildName(cid).." dominou o castelo! As outras guilds têm até às 20:00 para conseguir tirar o domínio deles, não desistam!")
end

realCastle.isDominating = function(cid)
	local guild_id = getPlayerGuildId(cid)
	return guild_id == getGlobalStorageValue(realCastle.guild_storage)
end

realCastle.isOpen = function()
	return getGlobalStorageValue(realCastle.open_storage) == 1
end