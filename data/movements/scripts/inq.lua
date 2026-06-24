local config = {
	bosses={---aid of portal, position where it sends, value it sets, text it shows
		[4001] = {pos={x = 1365, y = 1437, z = 7, stackpos=1}, value=1, text="Entering The Crystal Caves", questLog_value = 4},
		[4002] = {pos={x = 1505, y = 1367, z = 6, stackpos=1}, value=2, text="Entering The Blood Halls", questLog_value = 7},
		[4003] = {pos={x = 1392, y = 1460, z = 4, stackpos=1}, value=3, text="Entering The Vats", questLog_value = 10},
		[4004] = {pos={x = 1338, y = 1542, z = 4, stackpos=1}, value=4, text="Entering The Arcanum", questLog_value = 13},
		[4005] = {pos={x = 1579, y = 1559, z = 7, stackpos=1}, value=5, text="Entering The Hive", questLog_value = 17},
		[4006] = {pos={x = 1512, y = 1430, z = 4, stackpos=1}, value=6, text="Entering The Shadow Nexus", questLog_value = 19}
		},
	mainroom={---aid, position, lowest value that can use this portal, text
		[2001] = {pos={x = 1365, y = 1437, z = 7, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[2002] = {pos={x = 1505, y = 1367, z = 6, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[2003] = {pos={x = 1392, y = 1460, z = 4, stackpos=1}, value=3, text="Entering The Vats"},
		[2004] = {pos={x = 1338, y = 1542, z = 4, stackpos=1}, value=4, text="Entering The Arcanum"},
		[2005] = {pos={x = 1579, y = 1559, z = 7, stackpos=1}, value=5, text="Entering The Hive"}	},
	portals={---aid, position, text
		[3000] = {pos={x = 329,  y = 314, z =12}, text="Escaping back to the Retreat!"},
		[3001] = {pos={x = 1321, y = 1437, z = 4}, text="Entering The Ward of Ushuriel", questLog_value = 2},
		[3002] = {pos={x = 1308, y = 1385, z = 4}, text="Entering The Undersea Kingdom"},
		[3003] = {pos={x = 1416, y = 1380, z = 4}, text="Entering The Ward of Zugurosh", questLog_value = 5},
		[3004] = {pos={x = 1489, y = 1384, z = 4}, text="Entering The Foundry"},
		[3005] = {pos={x = 1455, y = 1405, z = 4}, text="Entering The Ward of Madareth", questLog_value = 8},
		[3006] = {pos={x = 1386, y = 1503, z = 4}, text="Entering The Battlefield"},
		[3007] = {pos={x = 1355, y = 1518, z = 4}, text="Entering The Ward of The Demon Twins", questLog_value = 11},
		[3008] = {pos={x = 1500, y = 1496, z = 4}, text="Entering The Soul Wells"},
		[3009] = {pos={x = 1569, y = 1556, z = 4}, text="Entering The Ward of Annihilon", questLog_value = 15},
		[3010] = {pos={x = 1563, y = 1461, z = 4}, text="Entering The Ward of Hellgorak", questLog_value = 18}	},
	storage=56123,---storage used in boss and mainroom portals
	e={}	}----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}

	storageQuestLog = 100079
function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if(config.bosses[item.actionid]) then
			local t= config.bosses[item.actionid]
			if t.value then
				if getPlayerStorageValue(cid, config.storage)< t.value then
					setPlayerStorageValue(cid, config.storage, t.value)
				end
			end

			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1, config.e)

			-- questlog:
			if (t.questLog_value) then
				if getPlayerStorageValue(cid, storageQuestLog) < t.questLog_value then
					setPlayerStorageValue(cid, storageQuestLog, t.questLog_value)
					if t.questLog_value == 19 then
						setPlayerStorageValue(cid, 100078, 24)
					end
				end
			end
		elseif(config.mainroom[item.actionid]) then
			local t= config.mainroom[item.actionid]
			if getPlayerStorageValue(cid, config.storage)>=t.value then
				doTeleportThing(cid, t.pos)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1,config.e)
			else
				doTeleportThing(cid, fromPosition)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1)
			end
		elseif(config.portals[item.actionid]) then
			local t= config.portals[item.actionid]
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1,config.e)

			-- questlog:
			if (t.questLog_value) then
				if getPlayerStorageValue(cid, storageQuestLog) < t.questLog_value then
					setPlayerStorageValue(cid, storageQuestLog, t.questLog_value)
				end
			end
		end
	end
end
