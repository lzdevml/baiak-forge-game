--[[	

			Real Team Battle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

realTeamBattle = {

	countStorage = 722385,
	teamStorage = 722386,
	checkStorage = 722387,
	rewards = {{6527,20}, {2160,20}},

	redTeam = {name = "Red Assassins", startPos = {x = 731, y = 31741, z = 7}, storage = 1},
	blueTeam = {name = "Blue Norsemen", startPos = {x = 791, y = 31741, z = 7}, storage = 2},
	blackTeam = {name = "Black Hunters", startPos = {x = 794, y = 31782, z = 7}, storage = 3},
	greenTeam = {name = "Green Beggars", startPos = {x = 727, y = 31783, z = 7}, storage = 4},

	stonePositions = {
	{x = 786, y = 31743, z = 7},
	{x = 786, y = 31744, z = 7},
	{x = 786, y = 31745, z = 7},
	{x = 736, y = 31743, z = 7},
	{x = 736, y = 31744, z = 7},
	{x = 736, y = 31745, z = 7},
	{x = 732, y = 31750, z = 7},
	{x = 731, y = 31750, z = 7},
	{x = 730, y = 31750, z = 7},
	{x = 792, y = 31749, z = 7},
	{x = 793, y = 31750, z = 7},
	{x = 794, y = 31749, z = 7},
	{x = 790, y = 31778, z = 7},
	{x = 791, y = 31778, z = 7},
	{x = 792, y = 31778, z = 7},
	{x = 786, y = 31782, z = 7},
	{x = 786, y = 31783, z = 7},
	{x = 786, y = 31784, z = 7},
	{x = 730, y = 31778, z = 7},
	{x = 731, y = 31778, z = 7},
	{x = 732, y = 31778, z = 7},
	{x = 736, y = 31783, z = 7},
	{x = 736, y = 31784, z = 7}
	},

	teleportPosition = {x = 152, y = 48, z = 7},
	exit = {x = 160, y = 51, z = 7},
	ips = {}

}

function realTeamBattle.cleanPlayer(cid)
	doPlayerSetStorageValue(cid,realTeamBattle.teamStorage,-1)
	doRemoveCondition(cid,CONDITION_OUTFIT)
end

function realTeamBattle.announce(times)
	if times == 0 then
		realTeamBattle.removeTeleport()
		doBroadcastMessage("[Team Battle] O evento não atingiu o número de jogadores necessário para iniciar e foi cancelado.")
		for _, pid in pairs(getPlayersOnline()) do
			if getPlayerStorageValue(pid,realTeamBattle.teamStorage) > 0 then
				realTeamBattle.cleanPlayer(pid)
				doTeleportThing(pid,realTeamBattle.exit)
			end
		end
		return;
	end
	if getGlobalStorageValue(realTeamBattle.countStorage) > 0 then
		doBroadcastMessage("[Team Battle] Estamos esperando "..getGlobalStorageValue(realTeamBattle.countStorage).." jogadores para iniciar o evento, o teleporte está no templo.")
		addEvent(realTeamBattle.announce,100000,times - 1)
	else
		realTeamBattle.broadcast(MESSAGE_STATUS_WARNING,"[Team Battle] A guerra vai começar daqui 1 minuto, se preparem!")
		addEvent(realTeamBattle.start,100000)
	end
end

function realTeamBattle.open(players)
	setGlobalStorageValue(realTeamBattle.checkStorage,0)
	setGlobalStorageValue(realTeamBattle.countStorage,players)
	doBroadcastMessage("[Team Battle] Teleporte criado no templo, estamos esperando "..players.." jogadores para iniciar o evento.")
	local creature = getTopCreature(realTeamBattle.teleportPosition)
	if creature and creature.uid and creature.uid > 0 and isPlayer(creature.uid) then doTeleportThing(creature.uid,getTownTemplePosition(1)) end
	doCleanTile(realTeamBattle.teleportPosition)
	local tp = doCreateItem(1387,1,realTeamBattle.teleportPosition)
	doItemSetAttribute(tp,"aid",61485)
	realTeamBattle.announce(7)
end

function realTeamBattle.removeStones()
	for a,b in pairs(realTeamBattle.stonePositions) do
		local stone = getTileItemById(b,1304)
		if stone and stone.uid and stone.uid > 0 then
			doRemoveItem(stone.uid)
		end
	end
end

function realTeamBattle.createStones()
	for a,b in pairs(realTeamBattle.stonePositions) do
		doCreateItem(1304,1,b)
	end
end

function realTeamBattle.broadcast(type,msg)
	for _, pid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(pid,realTeamBattle.teamStorage) > 0 then
			doPlayerSendTextMessage(pid,type,msg)
		end
	end
end

function realTeamBattle.start()
	realTeamBattle.removeStones()
	realTeamBattle.broadcast(MESSAGE_STATUS_WARNING,"[Team Battle] O evento começou, boa sorte a todos!")
end

function  realTeamBattle.getPlayers()
	local players = {}
	for a,pid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(pid,realTeamBattle.teamStorage) > 0 then
			table.insert(players,pid)
		end
	end
	return players
end

function realTeamBattle.winEvent(team,ammount)
	local teams = {"Red Assassins","Blue Norsemen","Black Hunters","Green Beggars"}
	for _, pid in pairs(realTeamBattle.getPlayers()) do
		if getPlayerStorageValue(pid,realTeamBattle.teamStorage) == team then
			doPlayerAddItem(pid, 6527, 120)
			doPlayerSendTextMessage(pid,25,"[Team Battle] Parabéns por vencer o evento, você ganhou 80 Event Coins!")
		end
		realTeamBattle.cleanPlayer(pid)
		doTeleportThing(pid,realTeamBattle.exit)
	end
	setGlobalStorageValue(realTeamBattle.countStorage,0)
	setGlobalStorageValue(realTeamBattle.checkStorage,-1)
	realTeamBattle.createStones()
	doBroadcastMessage("[Team Battle] "..ammount.." jogadores do time "..teams[team].." venceram o evento e ganharam 120 Event Coins e 50kk!")
end

function realTeamBattle.empate(team1,team2)
	local teams = {"Red Assassins","Blue Norsemen","Black Hunters","Green Beggars"}
	for _, pid in pairs(realTeamBattle.getPlayers()) do
		local sto = getPlayerStorageValue(pid,realTeamBattle.teamStorage)
		if sto == team1 or sto == team2 then
			doPlayerAddItem(pid, 6527, 120)
			doPlayerSendTextMessage(pid,25,"[Team Battle] Parabéns por vencer o evento, você ganhou 120 Event Coins e 50kk!")
		end
		realTeamBattle.cleanPlayer(pid)
		doTeleportThing(pid,realTeamBattle.exit)
	end
	setGlobalStorageValue(realTeamBattle.countStorage,0)
	setGlobalStorageValue(realTeamBattle.checkStorage,-1)
	realTeamBattle.createStones()
	doBroadcastMessage("[Team Battle] O evento empatou ficando apenas um jogador do time "..teams[team1].." e um do time "..teams[team2]..". Cada um deles ganhou 120 Event Coins e 50kk!")
end

function realTeamBattle.checkTeams()
	local red, blue, black, green = 0,0,0,0
	local table_, ammount, ppteam = {}, 0, {}
	local players = realTeamBattle.getPlayers()
	if #players >= 1 then
		for _, pid in pairs(players) do
			local team = getPlayerStorageValue(pid,realTeamBattle.teamStorage)
			if team == 1 then
				red = red + 1
			elseif team == 2 then
				blue = blue + 1
			elseif team == 3 then
				black = black + 1
			elseif team == 4 then
				green = green + 1
			end
		end
		if red > 0 then
			table.insert(table_,1)
			ammount = red
			ppteam[1] = red
		end
		if blue > 0 then
			table.insert(table_,2)
			ammount = blue
			ppteam[2] = blue
		end
		if black > 0 then
			table.insert(table_,3)
			ammount = black
			ppteam[3] = black
		end
		if green > 0 then
			table.insert(table_,4)
			ammount = green
			ppteam[4] = green
		end
		if #table_ == 1 then
			addEvent(realTeamBattle.winEvent,1000,table_[1],ammount)
		elseif #table_ == 2 then
			for a,b in pairs(ppteam) do
				if b > 1 then
					return;
				end
			end
			addEvent(realTeamBattle.empate,1000,table_[1],table_[2])
		end
	end
end

function realTeamBattle.removeTeleport()
	local tp = getTileItemById(realTeamBattle.teleportPosition,1387)
	if tp and tp.uid and tp.uid > 0 then
		doRemoveItem(tp.uid)
		doSendMagicEffect(realTeamBattle.teleportPosition,CONST_ME_POFF)
	end
end
