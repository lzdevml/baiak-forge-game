local posInicio = {x = 281, y = 596, z = 5}
local posFim = {x = 304, y = 618, z = 5}
local posExitTime = {x = 248, y = 612, z = 5}

local function verificaPlayers()
	for x = posInicio.x, posFim.x do
		for y = posInicio.y, posFim.y do
   			if isPlayer(getThingFromPos({x = x, y = y, z = posInicio.z, stackpos = 253}).uid) then
				return 1
			end
		end
	end
end

local function verificaBoss()
	for x = posInicio.x, posFim.x  do
		for y = posInicio.y, posFim.y do
			if isMonster(getThingFromPos({x = x, y = y, z = posInicio.z, stackpos = 253}).uid) then
				doRemoveCreature(getThingFromPos({x = x, y = y, z = posInicio.z, stackpos = 253}).uid)
			end
		end
	end
end

local function zeraStorages()
	for i = 97990, 97999 do
		setGlobalStorageValue(i, 0)
	end

end

local function removePlayersTime()
	for x = posInicio.x, posFim.x  do
		for y = posInicio.y, posFim.y do
			local remove, clean = true, true
			local pos = {x = x, y = y, z = posInicio.z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isPlayer(m) then
				doTeleportThing(m, posExitTime)
			end
		end
	end
	doSendMagicEffect(posExitTime, 10)
	zeraStorages()
	return true
end

local function transformCrystals()
	local crystals = {
		[1] = {crystalPosition = {x = 291, y = 603, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal1},
		[2] = {crystalPosition = {x = 295, y = 603, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal2},
		[3] = {crystalPosition = {x = 288, y = 606, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal3},
		[4] = {crystalPosition = {x = 298, y = 606, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal4},
		[5] = {crystalPosition = {x = 295, y = 613, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal5},
		[6] = {crystalPosition = {x = 288, y = 610, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal6},
		[7] = {crystalPosition = {x = 298, y = 610, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal7},
		[8] = {crystalPosition = {x = 291, y = 613, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal8}
	}
	for i = 1, #crystals do
		local item = crystals[i].crystalPosition
		if not item then
			return true
		end
		doTransformItem(getThingfromPos(item).uid, 9789)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	setPlayerStorageValue(cid,320987,os.time()+5)
	transformCrystals()
	zeraStorages()

	if item.aid == 35511 then
		local playerChecked = false
		local teleportToRoom = false
		if verificaPlayers() then
			doPlayerSendCancel(cid, "There are other players inside the room at the moment.")
			doSendMagicEffect(getCreaturePosition(cid),2)
			return true
		end

		local config = {
			[1] = {pos = {x = 251, y = 605, z = 5}},
			[2] = {pos = {x = 252, y = 605, z = 5}},
			[3] = {pos = {x = 253, y = 605, z = 5}},
			[4] = {pos = {x = 251, y = 606, z = 5}},
			[5] = {pos = {x = 252, y = 606, z = 5}},
			[6] = {pos = {x = 253, y = 606, z = 5}},
			[7] = {pos = {x = 251, y = 607, z = 5}},
			[8] = {pos = {x = 252, y = 607, z = 5}},
			[9] = {pos = {x = 253, y = 607, z = 5}},
			[10] = {pos = {x = 251, y = 608, z = 5}},
			[11] = {pos = {x = 252, y = 608, z = 5}},
			[12] = {pos = {x = 253, y = 608, z = 5}},
			[13] = {pos = {x = 251, y = 609, z = 5}},
			[14] = {pos = {x = 252, y = 609, z = 5}},
			[15] = {pos = {x = 253, y = 609, z = 5}},
		}

		local storageTime = Storage.FerumbrasAscension.storageTimeAlavancaFinal

		for i, v in pairs(config) do
			if isPlayer(getTopCreature(config[i].pos).uid) then
				player = getTopCreature(config[i].pos).uid
				if getPlayerStorageValue(player, storageTime) > os.time() then
					time = (getPlayerStorageValue(player, storageTime) - os.time()) / 60
					str = "minutes"
					if time > 60 then
						time = time / 60
						str = "hours"
					end
					if player == cid then name = "You" else name = getCreatureName(player) end
					doPlayerSendCancel(cid, name .. " need to wait more " .. math.floor(time + 0.5) .. " " .. str .. " to do again.")
					doSendMagicEffect(getCreaturePosition(player),2)
					return true
				end
				if player == cid then
					playerChecked = true
				end
			end
		end

		if playerChecked then
			for i, v in pairs(config) do
				if isPlayer(getTopCreature(config[i].pos).uid) then
					player = getTopCreature(config[i].pos).uid
					doSendMagicEffect(getCreaturePosition(player), 2)
					doTeleportThing(player, {x = 290, y = 619, z = 5})
					setPlayerStorageValue(player, storageTime, os.time() + 1209600) --(14 dias)
					teleportToRoom = true
				end
			end

			if teleportToRoom then
				stopEvent(ResetArea)
				verificaBoss()
				doSendMagicEffect({x = 293, y = 608, z = 5}, 10)
				doCreateMonster("Ascending Ferumbras", {x = 293, y = 608, z = 5})
				for b = 1,8 do
					local xrand = math.random(- 10, 10)
					local yrand = math.random(- 10, 10)
					local posRand = {x = 293 + xrand, y = 608 + yrand, z = 5}
					doCreateMonster("Rift Invader", posRand)
				end 
				ResetArea = addEvent(function()
					removePlayersTime()
				end, 20 * 60 * 1000)
				return false
			end
		else
			doPlayerSendCancel(cid, "Wouldn't you like to go too?")
			doSendMagicEffect(getCreaturePosition(cid),2)
		end

		return true
	end

end