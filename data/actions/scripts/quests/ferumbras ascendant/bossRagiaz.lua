local posInicio = {x = 33473, y = 32323, z = 13}
local posFim = {x = 33491, y = 32345, z = 13}
local posExitTime = {x = 33322, y = 32317, z = 13}

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

	if item.aid == 47039 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageTimeRagiaz2) <= os.time() and getPlayerStorageValue(cid, 320987) <= os.time() then
		setPlayerStorageValue(cid,320987,os.time()+5)
		local playerChecked = false
		local teleportToRoom = false
		if verificaPlayers() then
			doPlayerSendCancel(cid, "There are other players inside the room at the moment.")
			doSendMagicEffect(toPosition,2)
			return true
		end

		local config = {
			[1] = {pos = {x = 33456, y = 32356, z = 13}},
			[2] = {pos = {x = 33457, y = 32356, z = 13}},
			[3] = {pos = {x = 33458, y = 32356, z = 13}},
			[4] = {pos = {x = 33459, y = 32356, z = 13}},
			[5] = {pos = {x = 33460, y = 32356, z = 13}}
		}

		local storageTime = Storage.FerumbrasAscension.storageTimeRagiaz

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
					doTeleportThing(player, {x = 33480, y = 32341, z = 13})
					doSendMagicEffect(getCreaturePosition(player), 10)
					if getPlayerStorageValue(player, 1098019) == 5 then
						setPlayerStorageValue(player, 1098019, 6)
					end
					setPlayerStorageValue(player, storageTime, os.time() + 86400) --(2 dias)
					teleportToRoom = true
				end
			end

			if teleportToRoom then
				stopEvent(ResetArea)
				verificaBoss()
				doSendMagicEffect({x = 33481, y = 32332, z = 13}, 10)
				doCreateMonster("Ragiaz", {x = 33481, y = 32332, z = 13})
				ResetArea = addEvent(function()
					removePlayersTime()
				end, 20 * 60 * 1000)
				return false
			end
		else
			doPlayerSendCancel(cid, "Wouldn't you like to go too?")
			doSendMagicEffect(toPosition,2)
			setPlayerStorageValue(cid, Storage.FerumbrasAscension.storageTimeRagiaz2 + os.time() + 15)
		end

		return true
	end
	return true
end