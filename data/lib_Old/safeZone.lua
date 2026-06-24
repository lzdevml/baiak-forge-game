SAFEZONE_RED_OUTFIT = {}
SAFEZONE_ORANGE_OUTFIT = {}
SAFEZONE_YELLOW_OUTFIT = {}
SAFEZONE_GREEN_OUTFIT = {}

SafeZone = {
	teleportPosition = {x=151, y=43, z=7},
	waitingRoom = {x=2020, y=171, z=7},
	enterPosition = {x=2000, y=171, z=7},
	fromPos = {x=1993, y=165, z=7},
	toPos = {x=2007, y=177, z=7},
	waitingTime = 5, -- Em Minutos
	safeTileId = 12825,
	minPlayers = 3, -- Nao pode ser menor q 3
	maxPlayers = 25,
	minLevel = 80,
	rewardId = 6527, 
	rewards = {[1] = 75, [2] = 50, [3] = 25},
	zonePositions = {}
}

SafeZone.storages = {inGame = 722690, lives = 722691, open = 722692}

function SafeZone.getPlayers()
	local players = {}
	for _, pid in next, getPlayersOnline() do
		if SafeZone.isInEvent(pid) then
			table.insert(players, pid)
		end
	end
	return players
end

function SafeZone.isOpen()
	return getGlobalStorageValue(SafeZone.storages.open) ~= -1
end

function SafeZone.checkDuplicatedPosition(positions, position)
	for _, savedPosition in next, positions do
		if savedPosition.x == position.x and savedPosition.y == position.y then
			return false
		end
	end
	return true
end

function SafeZone.isInEvent(cid)
	return getCreatureStorage(cid, SafeZone.storages.inGame) ~= -1
end

function SafeZone.win(cid, place)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[SafeZone Event] Você venceu o evento em "..place.."º lugar e recebeu ".. SafeZone.rewards[place] .." event tokens!")
	doBroadcastMessage("[SafeZone Event] O jogador "..getCreatureName(cid).." venceu o evento em "..place.."º lugar e recebeu ".. SafeZone.rewards[place] .." event coins!")
	doPlayerAddItem(cid, SafeZone.rewardId, SafeZone.rewards[place])
	doRemoveCondition(cid, CONDITION_OUTFIT)
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	doCreatureSetStorage(cid, SafeZone.storages.inGame, -1)
	doCreatureSetStorage(cid, SafeZone.storages.lives, -1)
	unregisterCreatureEvent(cid, "safeZoneThrow")
	if place == 2 then
		SafeZone.win(SafeZone.getPlayers()[1], 1)
	end
end

function SafeZone.die(cid)
	local lives = getCreatureStorage(cid, SafeZone.storages.lives)
	doRemoveCondition(cid, CONDITION_OUTFIT)
	if lives == 1 then
		local players = SafeZone.getPlayers()
		if #players <= 3 then
			SafeZone.win(cid, #players)
		else
			doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			doSendMagicEffect(getThingPos(cid), CONST_ME_YALAHARIGHOST)
			doCreatureSetStorage(cid, SafeZone.storages.inGame, -1)
			doCreatureSetStorage(cid, SafeZone.storages.lives, -1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[SafeZone Event] Você morreu e foi retirado do evento.")
			unregisterCreatureEvent(cid, "safeZoneThrow")
		end
	else
		if getPlayerSex(cid) == 0 then
			SAFEZONE_RED_OUTFIT = {lookType = 136, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
			SAFEZONE_ORANGE_OUTFIT = {lookType = 136, lookHead = 77, lookBody = 77, lookLegs = 77, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
			SAFEZONE_YELLOW_OUTFIT = {lookType = 136, lookHead = 79, lookBody = 79, lookLegs = 79, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
		else
			SAFEZONE_RED_OUTFIT = {lookType = 128, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
			SAFEZONE_ORANGE_OUTFIT = {lookType = 128, lookHead = 77, lookBody = 77, lookLegs = 77, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
			SAFEZONE_YELLOW_OUTFIT = {lookType = 128, lookHead = 79, lookBody = 79, lookLegs = 79, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
		end

		local secondCheck = lives == 3 and SAFEZONE_YELLOW_OUTFIT or SAFEZONE_RED_OUTFIT
		doSetCreatureOutfit(cid, lives == 4 and SAFEZONE_ORANGE_OUTFIT or secondCheck, -1)
		doCreatureSetStorage(cid, SafeZone.storages.lives, lives - 1)
	end
end

function SafeZone.createZones()
	SafeZone.zonePositions = {}
	local ammount = math.random(100) <= 50 and math.floor(#SafeZone.getPlayers() - 1) or #SafeZone.getPlayers()
	local position = {}
	for i = 1, ammount do
		position = {x = math.random(SafeZone.fromPos.x, SafeZone.toPos.x), y = math.random(SafeZone.fromPos.y, SafeZone.toPos.y), z = SafeZone.fromPos.z}
		if not SafeZone.checkDuplicatedPosition(SafeZone.zonePositions, position) then
			while not SafeZone.checkDuplicatedPosition(SafeZone.zonePositions, position) do
				position = {x = math.random(SafeZone.fromPos.x, SafeZone.toPos.x), y = math.random(SafeZone.fromPos.y, SafeZone.toPos.y), z = SafeZone.fromPos.z}
			end
		end

		local tile = getThingFromPos({x = position.x, y = position.y, z = position.z, stackpos = 0}).itemid
		SafeZone.zonePositions[tile] = position
	end
	
	for _, pos in next, SafeZone.zonePositions do
		doSendDistanceShoot(SafeZone.enterPosition, pos, CONST_ANI_EARTH)
		doCreateItem(SafeZone.safeTileId, 1, pos)
		doSendAnimatedText(pos, "SAFE ZONE!", COLOR_GREEN)
		doSendMagicEffect(pos, CONST_ME_MAGIC_GREEN)
	end

	addEvent(SafeZone.sendWave, (math.random(10, 13) * 1000), SafeZone)
end

function SafeZone.putTilesBack()
	for itemid, position in next, SafeZone.zonePositions do
		doCreateItem(itemid, 1, position)
	end
end

function SafeZone.explode(position)
	for i = 1, 5 do
		position.stackpos = i
		local creature = getThingFromPos(position)
		if creature.uid > 0 and isPlayer(creature.uid) then
			doSendAnimatedText(position, "DAMAGED!", COLOR_RED)
			SafeZone.die(creature.uid)
		end
	end
end

function SafeZone.sendWave()
	for X = SafeZone.fromPos.x, SafeZone.toPos.x do
		for Y = SafeZone.fromPos.y, SafeZone.toPos.y do
			local position = {x = X, y = Y, z = SafeZone.fromPos.z}
			local safe = getTileItemById(position, SafeZone.safeTileId)
			local protectTile = getTileItemById(position, 1548)
			local player = getTopCreature(position)
			if safe.uid == 0 then
				SafeZone.explode({x = position.x, y = position.y, z = position.z})
				doSendMagicEffect(position, CONST_ME_SMALLPLANTS)
			else
				SafeZone.putTilesBack()
				doRemoveItem(safe.uid)
				if protectTile.uid > 0 then
					doRemoveItem(protectTile.uid)
				end
				if player.uid > 0 then
					doSendAnimatedText(position, "PROTECTED!", COLOR_WHITE)
				end
			end
		end
	end

	if #SafeZone.getPlayers() > 1 then
		addEvent(SafeZone.createZones, (math.random(5, 8) * 1000), SafeZone)
	end
end

function SafeZone.start()
	if SafeZone.isOpen() then
		setGlobalStorageValue(SafeZone.storages.open, -1)
		doRemoveItem(getTileItemById(SafeZone.teleportPosition, 1387).uid)
		local players = SafeZone.getPlayers()
		if #players >= SafeZone.minPlayers then
			for _, pid in next, players do
				doTeleportThing(pid, SafeZone.enterPosition)
				local delay = 0
				for i = 10, 1, -1 do
					addEvent(doPlayerSendTextMessage, delay, pid, MESSAGE_INFO_DESCR, "O evento vai começar em "..i.." ".. (i > 1 and 'segundos' or 'segundo') ..". Fique nos tiles verdes para sobreviver!")
					delay = delay + 1000
				end

				if getPlayerSex(pid) == 0 then
					SAFEZONE_GREEN_OUTFIT = {lookType = 136, lookHead = 100, lookBody = 100, lookLegs = 100, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
				else
					SAFEZONE_GREEN_OUTFIT = {lookType = 128, lookHead = 100, lookBody = 100, lookLegs = 100, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}
				end

				doSetCreatureOutfit(pid, SAFEZONE_GREEN_OUTFIT, -1)
				doCreatureSetStorage(pid, SafeZone.storages.lives, 4)
			end

			addEvent(doSendAnimatedText, 11000, SafeZone.enterPosition, "START!", COLOR_WHITE)
			doBroadcastMessage("[SafeZone Event] O evento começou, boa sorte aos participantes!")
			addEvent(SafeZone.createZones, 11000, SafeZone)
		else
			for _, pid in next, players do
				doCreatureSetStorage(pid, SafeZone.storages.inGame, -1)
				doBroadcastMessage("[SafeZone Event] O evento não atingiu o número mínimo de jogadores e foi cancelado.")
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
			end
		end
	end
end

function SafeZone.announce(times)
	if times > 1 then
		doBroadcastMessage("[SafeZone Event] O teleport para o evento vai fechar em "..times.." ".. (times > 1 and 'minutos' or 'minuto') .." e o evento vai começar!")
		addEvent(SafeZone.announce, 60000, times - 1)
	elseif times == 1 then
		doBroadcastMessage("[SafeZone Event] O teleport para o evento vai fechar daqui a 1 minuto e o evento vai começar!")
	end
end

function SafeZone.checkLogin(cid)
	if SafeZone.isInEvent(cid) then
		doCreatureSetStorage(cid, SafeZone.storages.inGame, -1)
	end
	return true
end

function SafeZone.checkThrow(cid, target)
	if SafeZone.isInEvent(cid) then
		if not isPlayer(target) then
			doPlayerSendCancel(cid, "Você não pode jogar itens aqui.")
			return false
		end
	end
	return true
end