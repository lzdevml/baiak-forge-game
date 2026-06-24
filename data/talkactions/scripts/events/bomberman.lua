local function placeBonus(position)
	local bonusId = bomberman.bonuses[math.random(#bomberman.bonuses)]
	doCreateItem(bonusId, 1, position)
	addEvent(function()
		local item = getTileItemById(position, bonusId)
		if item and item.uid and item.uid > 0 then
			doRemoveItem(item.uid)
		end
	end, 30000)
end

local function removeBonuses(position)
	for _, id in next, bomberman.bonuses do
		local bonus = getTileItemById(position, id)
		if bonus and bonus.uid and bonus.uid > 0 then
			doRemoveItem(bonus.uid)
		end
	end
end

local function cleanArena(arenaNumber)
	for xx = bomberman.arenas[arenaNumber].fromPos.x, bomberman.arenas[arenaNumber].toPos.x do
		for yy = bomberman.arenas[arenaNumber].fromPos.y, bomberman.arenas[arenaNumber].toPos.y do
			local position = {x = xx, y = yy, z = bomberman.arenas[arenaNumber].fromPos.z}
			local stone = getTileItemById(position, bomberman.stoneId)
			if stone and stone.uid and stone.uid > 0 then
				doRemoveItem(stone.uid)
			end
		end
	end
end

local function decreaseStorage(cid, limit)
	if limit == 0 then
		return;
	end
	if getCreatureStorage(cid, bomberman.inGameStorage) == -1 then
		return;
	end
	doCreatureSetStorage(cid, bomberman.bombStorage, getCreatureStorage(cid, bomberman.bombStorage) - 1)
	addEvent(decreaseStorage, 1000, cid, limit - 1)
end

local function checkForWinner(arenaNumber)
	local players = getCreaturesFromArea(bomberman.arenas[arenaNumber].fromPos, bomberman.arenas[arenaNumber].toPos, true)
	if players and #players == 1 then
		for i=1, #players do
			pid = players[i]
			doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Parabéns, você foi o vencedor desta rodada do Bomberman!")
			doPlayerAddItem(pid, 8981, 3)
			doPlayerAddItem(pid, 6527, 30)
			doPlayerAddExperience(pid, 250000)
			setGlobalStorageValue(bomberman.arenas[arenaNumber].storage, -1)
			doChangeSpeed(pid, getCreatureStorage(pid, bomberman.oldSpeedStorage) - getCreatureSpeed(pid))
			doCreatureSetStorage(pid, bomberman.oldSpeedStorage, -1)
			doTeleportThing(pid, bomberman.arenas[arenaNumber].exit)
			doCreatureSetStorage(pid, bomberman.inGameStorage, -1)
			unregisterCreatureEvent(pid, "Bomberman_AntiPush")
			if getCreatureConditionInfo(pid, CONDITION_EXHAUST, 2) then
				doRemoveCondition(pid, CONDITION_EXHAUST, 2)
			end
			if getCreatureConditionInfo(pid, CONDITION_EXHAUST, 4) then
				doRemoveCondition(pid, CONDITION_EXHAUST, 4)
			end

			cleanArena(arenaNumber)
		end
	end
end

local function die(cid)
	if getCreatureStorage(cid, bomberman.imuneStorage) >= os.time() then
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		doSendAnimatedText(getThingPos(cid), "IMUNE", 16)
		return
	end

	local arenaNumber = getCreatureStorage(cid, bomberman.inGameStorage)
	local checkP = getCreaturesFromArea(bomberman.arenas[arenaNumber].fromPos, bomberman.arenas[arenaNumber].toPos, true)
	if (#checkP > 1) then
		for v=1, #checkP do
			pid_ = checkP[v]
			if getCreatureStorage(pid_, bomberman.inGameStorage) == arenaNumber then
				doPlayerSendTextMessage(pid_, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).." foi explodido!")
			end
		end
	end

	doChangeSpeed(cid, getCreatureStorage(cid, bomberman.oldSpeedStorage) - getCreatureSpeed(cid))
	doCreatureSetStorage(cid, bomberman.oldSpeedStorage, -1)
	doSendAnimatedText(getThingPos(cid), "BOOOM", 150)
	doTeleportThing(cid, bomberman.arenas[arenaNumber].exit)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você foi explodido!")
	doCreatureSetStorage(cid, bomberman.inGameStorage, -1)
	unregisterCreatureEvent(cid, "Bomberman_AntiPush")
	if getCreatureConditionInfo(cid, CONDITION_EXHAUST, 2) then
		doRemoveCondition(cid, CONDITION_EXHAUST, 2)
	end
	if getCreatureConditionInfo(cid, CONDITION_EXHAUST, 4) then
		doRemoveCondition(cid, CONDITION_EXHAUST, 4)
	end

	checkForWinner(arenaNumber)
end

local function burn(pos, radius, direction)
	local position
	for o = 0, radius do
		if direction == 0 then
			position = {x = pos.x, y = pos.y, z = pos.z}
		elseif direction == 1 then
			position = {x = pos.x, y = pos.y + o, z = pos.z}
		elseif direction == 2 then
			position = {x = pos.x + o, y = pos.y, z = pos.z}
		elseif direction == 3 then
			position = {x = pos.x, y = pos.y - o, z = pos.z}
		elseif direction == 4 then
			position = {x = pos.x - o, y = pos.y, z = pos.z}
		end

		local stone = getTileItemById(position, bomberman.stoneId)
		if stone and stone.uid and stone.uid > 0 then
			doRemoveItem(stone.uid)
			if math.random(100) <= 20 then
				addEvent(placeBonus,1000,position)
			end
			doSendMagicEffect(position, CONST_ME_FIREAREA)
			return
		end
		local player = getTopCreature(position)
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
			die(player.uid)
		end
		local bomb = getTileItemById(position, bomberman.bombId)
		if bomb and bomb.uid and bomb.uid > 0 then
			local recursive_radius = tonumber(getItemAttribute(bomb.uid, "radius"))
			doRemoveItem(bomb.uid)
			for i = 1,4 do
				burn(position, recursive_radius, i)
			end
		end
		local thing = getThingFromPos({x = position.x, y = position.y, z = position.z, stackpos = 1})
		if thing.uid > 0 and thing.itemid > 1 and not isMoveable(thing.uid) and not isInArray(bomberman.bonuses, thing.itemid) then
			return;
		end
		doSendMagicEffect(position, CONST_ME_FIREAREA)
		removeBonuses(position)
	end
end

local function explode(pos, radius)
	local bomb = getTileItemById(pos, bomberman.bombId)
	if bomb and bomb.uid and bomb.uid > 0 then
		doRemoveItem(bomb.uid)
		doSendMagicEffect(pos, CONST_ME_FIREAREA)
		for i = 1,4 do
			burn(pos, radius, i)
		end
	end
end

local function sendCountDown(position, time)
	doSendAnimatedText(position, time, 150)
	if time > 0 then
		addEvent(sendCountDown,1000,position,time - 1)
	end
end

function onSay(cid, words, param, channel)
	if (getCreatureStorage(cid, bomberman.inGameStorage) ~= -1) then
		local bombs = getCreatureStorage(cid, bomberman.bombStorage)
		local bombLimit = getCreatureStorage(cid, bomberman.bombLimitStorage)
		if bombs <= ((bombLimit * 3) + 997) then
			local pos = getThingPos(cid)
			local radius = getCreatureStorage(cid, bomberman.radiusStorage)
			local bomb_item = doCreateItem(bomberman.bombId, 1, pos)
			doItemSetAttribute(bomb_item, "radius", radius)
			sendCountDown(pos,3)
			addEvent(decreaseStorage, 1100, cid, 3)
			addEvent(explode, 3000, pos, radius)
			doCreatureSetStorage(cid, bomberman.bombStorage, bombs + 3)
		else
			doPlayerSendCancel(cid, "Aguarde um pouco antes de colocar uma bomba.")
		end
	end
	return true
end
