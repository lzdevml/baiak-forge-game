local castleConfig = {
	days = {2, 5},
	time_1 = 10*60*1000, -- time from start event to fight
	time_2 = 30*60*1000, -- time from fight to end event
	guildOwnStorage = 17000,
	attackersStorage = 17002,
	enabledStorage = 17006,
	endedStorage = 17007,
	leaderLevel = 1500,
	membersNeeded = 1,
	monster = "Tiberia King",
	monsterSpawn = {x = 2470, y = 2477, z = 3},
	startAttackers = {
		[1] = {x = 2444, y = 2491, z = 6},
		[2] = {x = 2494, y = 2503, z = 6},
		[3] = {x = 2488, y = 2464, z = 6}
	},
	gates = {
		[1] = {pos = {x = 2456, y = 2487, z = 6}, itemid = 9533},
		[2] = {pos = {x = 2456, y = 2488, z = 6}, itemid = 9533},
		
		[3] = {pos = {x = 2486, y = 2498, z = 6}, itemid = 9485},
		[4] = {pos = {x = 2487, y = 2498, z = 6}, itemid = 9485},
		
		[5] = {pos = {x = 2490, y = 2471, z = 6}, itemid = 9486},
		[6] = {pos = {x = 2491, y = 2471, z = 6}, itemid = 9486},
		[7] = {pos = {x = 2492, y = 2471, z = 6}, itemid = 9486},
		
		-- new 
		[8] = {pos = {x = 2452, y = 2480, z = 6}, itemid = 9533},
		[9] = {pos = {x = 2452, y = 2481, z = 6}, itemid = 9533},
		[10] = {pos = {x = 2452, y = 2482, z = 6}, itemid = 9533},
		
		[11] = {pos = {x = 2485, y = 2498, z = 6}, itemid = 9485},	
		
		[12] = {pos = {x = 2498, y = 2502, z = 6}, itemid = 9533},
		[13] = {pos = {x = 2498, y = 2503, z = 6}, itemid = 9533},
		
		[14] = {pos = {x = 2485, y = 2468, z = 6}, itemid = 9486},
		[15] = {pos = {x = 2486, y = 2468, z = 6}, itemid = 9486},
		[16] = {pos = {x = 2487, y = 2468, z = 6}, itemid = 9486},
	

		
	},
}
CASTLE_DAYS = {3,6}

function getCastleConfig(value)
	if (value ~= nil) then
		return castleConfig[value] or false 
	else
		return false
	end
end

function removeNotKilledKing(cid)
	if isMonster(cid) and getCreatureName(cid) == castleConfig.monster then
		doRemoveCreature(cid)
	end
	return true
end


-- it sux but don`t have idea how to make it better, attackers Index
function Castle_getGuildPos(guildId)
	local attackers = Castle_getAttackers()
	for i,value in ipairs(attackers) do
		if (tonumber(guildId) == tonumber(value)) then
			ret = i
		end
	end
	return ret
end

function Castle_enableSaving()
	doBroadcastMessage("[ Castle Event Enabled! ]\n\nIf you're a guild leader and you have at least ".. castleConfig.membersNeeded .." members you can sign in your guild by saying !castle in default channel.", MESSAGE_INFO_DESCR)
	setGlobalStorageValue(castleConfig.enabledStorage, 1)
	--setGlobalStorageValue(castleConfig.endedStorage, 0)
	Castle_cleanUp()
	addEvent(Castle_startEvent, castleConfig.time_1)
	return true
end

function Castle_getAttackers()
	local ret = {}
	local query = string.explode(getGlobalStorageValue(castleConfig.attackersStorage), ",")
	for _,value in ipairs(query) do
		if isNumber(value) then
			table.insert(ret, value)
		end
	end
	return ret
end

function Castle_startEvent()
	setGlobalStorageValue(castleConfig.enabledStorage, 0)
	setGlobalStorageValue(castleConfig.endedStorage, 0)
	if(#Castle_getAttackers() == 0) then
		doBroadcastMessage("[ Castle Event Failed! ]\n\nWe have not attackers!", MESSAGE_INFO_DESCR)
		setGlobalStorageValue(castleConfig.endedStorage, 1)
		return true
	end
	doBroadcastMessage("[ Castle Event Fight! ]\n\nEvent has been started. Kill Tiberia King !!!", MESSAGE_INFO_DESCR)
	-- clean tile first //new fix
	doCleanTile(castleConfig.monsterSpawn)
	local monster = doSummonCreature(castleConfig.monster, castleConfig.monsterSpawn)
	for _, gate in pairs(castleConfig.gates) do
		doRemoveItem(getTileItemById(gate.pos, gate.itemid).uid)
	end
	addEvent(Castle_endEvent, castleConfig.time_2, false)
	addEvent(removeNotKilledKing, castleConfig.time_2, monster)
	return true
end

function Castle_endEvent(killed, damages)
	local playersOnline = getPlayersOnline()
	local dmgCount = 0
	local message = ""
	local winner = 0
	
	if (getGlobalStorageValue(castleConfig.endedStorage) ~= 1) then
		if (killed) then
			for _,value in ipairs(Castle_getAttackers()) do
				message = message.."\n"..getGuildName(value)..":"..damages[Castle_getGuildPos(value)].." dmg"
				if damages[Castle_getGuildPos(value)] > dmgCount then
					winner = value
					dmgCount = damages[Castle_getGuildPos(value)]
				end
			end
			doBroadcastMessage("[ Castle Event End! ]\n\n> Statistics " .. message .."\nWINNER:"..getGuildName(winner), MESSAGE_INFO_DESCR)
			
			local attackers = Castle_getAttackers()
			table.insert(attackers, getGlobalStorageValue(castleConfig.guildOwnStorage))
			for _, pid in ipairs(playersOnline) do
				if ((isInArray(attackers, getPlayerGuildId(pid)) or getGlobalStorageValue(castleConfig.guildOwnStorage) == getPlayerGuildId(pid)) and not(tonumber(getPlayerGuildId(pid)) == tonumber(winner))) then
					doRemoveCondition(pid, CONDITION_INFIGHT)
					doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				end
			end
			setGlobalStorageValue(castleConfig.guildOwnStorage, winner)
		else
			doBroadcastMessage("[ Castle Event End! ]\n\n> Castle has been saved by owner.", MESSAGE_INFO_DESCR)
		end
		setGlobalStorageValue(castleConfig.endedStorage, 1)
	end
	Castle_cleanUp()
	return true
end

function Castle_cleanUp()
	setGlobalStorageValue(castleConfig.attackersStorage, ",")
	return true
end

function Castle_getGuildMembers(guildId)
	local playersOnline = getPlayersOnline()
	local members = {}
	for _, pid in ipairs(playersOnline) do
		if (getPlayerGuildId(pid) == guildId) then
			table.insert(members, pid)
		end
	end
	return members
end


function Castle_trySave(cid)
	if not(getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER) then
		doPlayerSendCancel(cid, "Sorry, but you have to be a leader of guild.")
		return true
	end

	if (getGlobalStorageValue(castleConfig.enabledStorage) ~= 1) then
		doPlayerSendCancel(cid, "Sorry, but it's not time yet.")
		return true
	end

	if (getPlayerLevel(cid) < castleConfig.leaderLevel) then
		doPlayerSendCancel(cid, "Sorry, but your level is too low.")
		return true
	end

	local players = Castle_getGuildMembers(getPlayerGuildId(cid))
	if (#players == 1) then
		doPlayerSendCancel(cid, "Sorry, but you haven't any online members in guild.")
		return true
	end

	if (#players < castleConfig.membersNeeded) then
		doPlayerSendCancel(cid, "Sorry, but you need at least ".. castleConfig.membersNeeded .." guild members online.")
		return true
	end
	if (tonumber(getGlobalStorageValue(castleConfig.guildOwnStorage)) == tonumber(getPlayerGuildId(cid))) then
		doPlayerSendCancel(cid, "Your guild should protect Castle, not attack.")
		return true
	end

	if (#Castle_getAttackers() == 3) then
		doPlayerSendCancel(cid, "Sorry, we have already 3 attacking guilds.")
		return true
	end
	if (isInArray(Castle_getAttackers(), getPlayerGuildId(cid))) then
		doPlayerSendCancel(cid, "Be patient, war will start in a few minutes.")
		return true
	end

	setGlobalStorageValue(castleConfig.attackersStorage, getGlobalStorageValue(castleConfig.attackersStorage)..getPlayerGuildId(cid)..",")
	doBroadcastMessage("[ Castle Event Info ]\n\nGuild ".. getPlayerGuildName(cid) .." will fight for Castle.\nAttackers: ".. #Castle_getAttackers() .." / 3", MESSAGE_INFO_DESCR)

	for i, pid in ipairs(getPlayersOnline()) do
		if (isInArray(getPlayerGuildId(cid), getPlayerGuildId(pid))) then
			doTeleportThing(pid, castleConfig.startAttackers[#Castle_getAttackers()])
		end
	end
	return true
end