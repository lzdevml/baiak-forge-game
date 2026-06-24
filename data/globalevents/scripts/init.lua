local config = {
	creationTime = 7 * 86400,
	checkTime = 7 * 86400,
	memberCount = 4
}

function onStartup()
	local data, time, result = {}, os.time(), db.getResult("SELECT `id`, `ownerid`, `creationdata`, `checkdata` FROM `guilds` WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	if(result:getID() ~= -1) then
		repeat
			data[result:getDataInt("id")] = {result:getDataInt("ownerid"), result:getDataInt("creationdata"), result:getDataInt("checkdata")}
		until not(result:next())
		result:free()
	end

	for id, v in ipairs(data) do
		local owner, created, check = v[1], v[2], v[3]
		if(created < (time - config.creationTime)) then
			result = db.getResult("SELECT `id`, `level` FROM `guild_ranks` WHERE `guild_id` = " .. id .. ";")
			if(result:getID() ~= -1) then
				local rank, ranks = 0, {}
				repeat
					ranks[result:getDataInt("id")] = result:getDataInt("level")
					if(result:getDataInt("level") == 1) then
						rank = result:getDataInt("id")
					end
				until not(result:next())
				result:free()

				local members = {0, 0, 0, 0}
				for k, v in ipairs(ranks) do
					result = db.getResult("SELECT COUNT(`id`) AS `count` FROM `players` WHERE `rank_id` = " .. k .. ";")
					if(result:getID() ~= -1) then
						members[v] = members[v] + result:getDataInt("count")
						result:free()
					end

					if(v == 2) then
						result = db.getResult("SELECT `p`.`id` FROM `players` p LEFT JOIN `accounts` a ON `p`.`account_id` = `a`.`id` WHERE `p`.`rank_id` = " .. k .. " AND (`a`.`premdays` = 0 OR (`a`.`lastday` + (`a`.`premdays` * 86400) <= 0));")
						if(result:getID() ~= -1) then
							local demote = ""
							repeat
								demote = demote .. result:getDataInt("id") .. ","
								members[2] = members[2] - 1
								members[1] = members[1] + 1
							until not(result:next())
							result:free()

							if(demote ~= "" and rank ~= 0) then
								db.executeQuery("UPDATE `players` SET `rank_id` = " .. rank .. " WHERE `id` IN (" .. demote:sub(1, -2) .. ");")
							end
						end
					end
				end

				for i = 1, 3 do
					members[4] = members[4] + members[i]
				end

				if(members[4] < config.memberCount) then
					if(check == 0) then
						db.executeQuery("UPDATE `guilds` SET `checkdata` = " .. (time + config.checkTime) .. " WHERE `id` = " .. id .. ";")
					elseif(check < time) then
						local tmp = ""
						for rank, _ in ipairs(ranks) do
							tmp = tmp .. rank .. ","
						end

						db.executeQuery("UPDATE `players` SET `rank_id` = 0, `guildnick` = '' WHERE `rank_id` IN (" .. tmp:sub(1, -2) .. ");")
						db.executeQuery("DELETE FROM `guilds` WHERE `id` = " .. id .. ";")
					end
				end
			end
		end
	end

	db.executeQuery("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. " AND `online` > 0;")
	db.executeQuery("UPDATE `bans` SET `active` = 0 WHERE `expires` <= " .. time .. " AND `expires` >= 0 AND `active` = 1")
	db.executeQuery("DELETE FROM `guild_wars` WHERE `status` = 0 AND `begin` < " .. (time - 2 * 86400) .. ";")
	db.executeQuery("UPDATE `players` SET `broadcasting` = 0, `viewers` = 0")

	if(getConfigValue("sqlType") ~= "sqlite") then
		db.executeQuery("TRUNCATE TABLE `player_statements`;")
	else
		db.executeQuery("DELETE FROM `player_statements`;")
	end

	-- DEBUG: Bomberman Event
	setGlobalStorageValue(722641, -1)

	-- CS Battle Event
	if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == -1 then
		setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
		setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
		setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
	end

	-- TheRain Event
	ZerarStorFire()

	-- CTF Event
	for k, v in pairs(ctfConfig.bases) do
		setGlobalStorageValue(v.controled, 0)
		setGlobalStorageValue(v.points, 0)
	end

	setGlobalStorageValue(ctfConfig.red.scores, 0)
	setGlobalStorageValue(ctfConfig.blue.scores, 0)
	setGlobalStorageValue(ctfConfig.eventStorage, -1)
	setGlobalStorageValue(ctfConfig.joinEventStorage, -1)
	setGlobalStorageValue(ctfConfig.deathCountStorage, 0)
	
	resetAllCityWarStats()

	if getGlobalStorageValue("castle02") > 0 then
		setGlobalStorageValue("castle02", -1)
	end

	-- COLOCAR QUANDO LANCAR O OT SEU PNC
	 ---doSetGameState(GAMESTATE_CLOSED)
	


	return true
end

function onGlobalSave()
	if(getGameState() ~= GAMESTATE_CLOSING) then
		return onStartup()
	end
return true
end
