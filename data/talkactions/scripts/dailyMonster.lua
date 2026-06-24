dofile('data/globalevents/scripts/dailyMonstersGlobal.lua')
function onSay(cid, words, param, channel)
	if(not checkExhausted(cid, 666, 5)) then
		return true
	end

	local monsterBonusSpawn = getGlobalStorageValue(monsterDaily.storageMonsterSpawn)
	local monsterSpawnPercent = 1+((100 - ((tonumber(getGlobalStorageValue(monsterDaily.storagePercentSpawn))*100)/1000))/50)

	local monsterBonusExp = getGlobalStorageValue(monsterDaily.storageMonsterExp)
	local queryExp = db.getResult('SELECT `value` FROM `global_storage` WHERE `key` = \''.. monsterDaily.storagePercentExp ..'\'')
	local bonusExpRate = queryExp:getDataString("value")

	local monsterBonusLoot = getGlobalStorageValue(monsterDaily.storageMonsterLoot)
	local queryLoot = db.getResult('SELECT `value` FROM `global_storage` WHERE `key` = \''.. monsterDaily.storagePercentLoot ..'\'')
	local bonusLootRate = queryLoot:getDataString("value")

	doPlayerSendTextMessage(cid, 22, 
	 		"Monsters of the day:" .. 
	 		"\nIncreased spawn: " .. monsterBonusSpawn .. " (" .. string.format("%.1f", monsterSpawnPercent) .. "x)" ..
	 		"\nBonus Experience: " .. monsterBonusExp .. " (" .. bonusExpRate .. "x)" ..
	 		"\nBonus Loot: " .. monsterBonusLoot .. " (" .. bonusLootRate .. "x)"
	 		)
	return true
end
