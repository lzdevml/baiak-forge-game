dofile('data/globalevents/scripts/dailyMonstersGlobal.lua')
function onLogin(cid)
	local monsterBonusSpawn = getGlobalStorageValue(monsterDaily.storageMonsterSpawn)
	local monsterSpawnPercent = 1+((100 - ((tonumber(getGlobalStorageValue(monsterDaily.storagePercentSpawn))*100)/1000))/50)

	local monsterBonusExp = getGlobalStorageValue(monsterDaily.storageMonsterExp)
	local queryExp = db.getResult('SELECT `value` FROM `global_storage` WHERE `key` = \''.. monsterDaily.storagePercentExp ..'\'')
	local bonusExpRate = queryExp:getDataString("value")

	local monsterBonusLoot = getGlobalStorageValue(monsterDaily.storageMonsterLoot)
	local queryLoot = db.getResult('SELECT `value` FROM `global_storage` WHERE `key` = \''.. monsterDaily.storagePercentLoot ..'\'')
	local bonusLootRate = queryLoot:getDataString("value")



	local storage = getPlayerStorageValue(cid, 1000)
	 
	if storage == -1 then
		doPlayerSendOutfitWindow(cid)
		--doPlayerSendTextMessage(cid, 22, "Monsters of the day: \n" .. monsterBonusSpawn.. ":" .. monsterSpawnPercent .. "% faster spawn.")
		-- Storages Iniciais:


		-- VIP Indication:
		local indicationCode = {'Glooth7', 'Asura20', 'Oramond1', 'Umbral12', 'Warzone3', 'Ferumbras', 'Prey20', 'Croasonho', 'Prismatic7', 'Falcon7', 'GlacialRod', 'FalconRod', 'Macabra10', 'Executter', 'UmbralCreation'}
		local queryIndication = db.getResult('SELECT `indication`, `vip_indication` FROM `accounts` WHERE `id` = '..getPlayerAccountId(cid)..';')

		local indication = queryIndication:getDataString("indication")
		local vipIndication = queryIndication:getDataInt("vip_indication")
		local premiumDays = 3


		for i,v in pairs(indicationCode) do
			if v == indication then
				if vipIndication == 0 then
					db.query("UPDATE `accounts` SET `vip_indication` = 1 WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
					doPlayerAddPremiumDays(cid, premiumDays)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You received 3 premium days by using indication code.")
					break
				end
			end
		end

	else
		playerpos = getPlayerPosition(cid)
	 	--doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_BLUE)--
	 	--doSendAnimatedText(playerpos, "Welcome!", TEXTCOLOR_LIGHTBLUE)--
	 	doPlayerSendTextMessage(cid, 22, 
	 		"Monsters of the day:" .. 
	 		"\nIncreased spawn: " .. monsterBonusSpawn .. " (" .. string.format("%.1f", monsterSpawnPercent) .. "x)" ..
	 		"\nBonus Experience: " .. monsterBonusExp .. " (" .. bonusExpRate .. "x)" ..
	 		"\nBonus Loot: " .. monsterBonusLoot .. " (" .. bonusLootRate .. "x)"
	 		)
	end
return TRUE
end
