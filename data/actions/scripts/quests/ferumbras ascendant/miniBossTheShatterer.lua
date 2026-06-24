local posInicio = {x = 33385, y = 32386, z = 14}
local posFim = {x = 33439, y = 32449, z = 14}
local posExitTime = {x = 33308, y = 32378, z = 12}

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
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.aid == 47026 and getPlayerStorageValue(cid, 320987) <= os.time() then
		setPlayerStorageValue(cid,320987,os.time()+5)
		local playerChecked = false
		local teleportToRoom = false
		if verificaPlayers() then
			doPlayerSendCancel(cid, "There are other players inside the room at the moment.")
			doSendMagicEffect(toPosition,2)
			return true
		end

		local config = {
			[1] = {pos = {x = 33405, y = 32467, z = 13}},
			[2] = {pos = {x = 33406, y = 32467, z = 13}},
			[3] = {pos = {x = 33407, y = 32467, z = 13}},
			[4] = {pos = {x = 33408, y = 32467, z = 13}},
			[5] = {pos = {x = 33409, y = 32467, z = 13}}
		}

		local storageTime = Storage.FerumbrasAscension.storageTimeTheShaterrer

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
					doSendMagicEffect(toPosition,2)
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
					doTeleportThing(player, {x = 33397, y = 32438, z = 14})
					if getPlayerStorageValue(player, 1098018) == 2 then
						setPlayerStorageValue(player, 1098018, 3)
					end
					doSendMagicEffect(getCreaturePosition(player), 10)
					teleportToRoom = true
				end
			end

			if teleportToRoom then
				stopEvent(ResetArea)
				verificaBoss()
				doSendMagicEffect({x = 33408, y = 32420, z = 14}, 10)
				doCreateMonster("The Shatterer", {x = 33408, y = 32420, z = 14})
				ResetArea = addEvent(function()
					removePlayersTime()
				end, 20 * 60 * 1000)
				return false
			end
		else
			doPlayerSendCancel(cid, "Wouldn't you like to go too?")
			doSendMagicEffect(toPosition,2)
		end

		return true
	end
return true
end