local timetokick = {5, "min"} -- tempo para ser kikado da sala do boss

local teleports = {
    -- Tile UID = {storage of task, amount of monsters, monsters to spawn}
	[14005] = {monsters = {"The Snapper"}, telePos = {x = 1814, y = 104, z = 8}, spawnPos = {x = 1818, y = 112, z = 8}, from = {x = 1808, y = 103, z = 8}, to = {x = 1823, y = 115, z = 8}, kickpos = {x = 223, y = 276, z = 10}},
	[14006] = {monsters = {"Hide"}, telePos = {x = 1861, y = 105, z = 8}, spawnPos = {x = 1858, y = 111, z = 8}, from = {x = 1855, y = 102, z = 8}, to = {x = 1869, y = 114, z = 8}, kickpos = {x = 221, y = 276, z = 10}},
	[14009] = {monsters = {"The Bloodtusk"}, telePos = {x = 1927, y = 106, z = 8}, spawnPos = {x = 1925, y = 113, z = 8}, from = {x = 1917, y = 103, z = 8}, to = {x = 1932, y = 116, z = 8}, kickpos = {x = 219, y = 276, z = 10}},
    [14010] = {monsters = {"Shardhead"}, telePos = {x = 1963, y = 112, z = 8}, spawnPos = {x = 1967, y = 106, z = 8}, from = {x = 1957, y = 101, z = 8}, to = {x = 1972, y = 119, z = 8}, kickpos = {x = 217, y = 276, z = 10}},
	[14012] = {monsters = {"Thul"}, telePos = {x = 1813, y = 144, z = 8}, spawnPos = {x = 1821, y = 143, z = 8}, from = {x = 1809, y = 138, z = 8}, to = {x = 1823, y = 152, z = 8}, kickpos = {x = 215, y = 276, z = 10}},
	[14017] = {monsters = {"Esmeralda"}, telePos = {x = 1863, y = 143, z = 8}, spawnPos = {x = 1868, y = 149, z = 8}, from = {x = 1860, y = 142, z = 8}, to = {x = 1870, y = 151, z = 8}, kickpos = {x = 213, y = 276, z = 10}},
	[14018] = {monsters = {"The Old Widow"}, telePos = {x = 1911, y = 144, z = 8}, spawnPos = {x = 1904, y = 140, z = 8}, from = {x = 1901, y = 137, z = 8}, to = {x = 1914, y = 152, z = 8}, kickpos = {x = 211, y = 276, z = 10}},
	[14019] = {monsters = {"The Many"}, telePos = {x = 1866, y = 177, z = 8}, spawnPos = {x = 1866, y = 185, z = 8}, from = {x = 1860, y = 174, z = 8}, to = {x = 1872, y = 187, z = 8}, kickpos = {x = 219, y = 279, z = 10}},
	[14020] = {monsters = {"Leviathan"}, telePos = {x = 2007, y = 111, z = 8}, spawnPos = {x = 1993, y = 107, z = 8}, from = {x = 1991, y = 102, z = 8}, to = {x = 2008, y = 118, z = 8}, kickpos = {x = 217, y = 279, z = 10}},
    [14021] = {monsters = {"Stonecracker"}, telePos = {x = 2017, y = 145, z = 8}, spawnPos = {x = 2013, y = 157, z = 8}, from = {x = 2008, y = 144, z = 8}, to = {x = 2022, y = 161, z = 8}, kickpos = {x = 215, y = 279, z = 10}},
    [14022] = {monsters = {"The Noxious Spawn"}, telePos = {x = 1865, y = 204, z = 8}, spawnPos = {x = 1865, y = 210, z = 8}, from = {x = 1859, y = 201, z = 8}, to = {x = 1872, y = 213, z = 8}, kickpos = {x = 213, y = 279, z = 10}},
  
    [14027] = {monsters = {"Necropharus"}, telePos = {x = 1905, y = 180, z = 8}, spawnPos = {x = 1907, y = 169, z = 8}, from = {x = 1899, y = 167, z = 8}, to = {x = 1914, y = 182, z = 8}, kickpos = {x = 211, y = 279, z = 10}},
    [14026] = {monsters = {"The Horned Fox"}, telePos = {x = 1815, y = 182, z = 8}, spawnPos = {x = 1816, y = 193, z = 8}, from = {x = 1811, y = 178, z = 8}, to = {x = 1823, y = 197, z = 8}, kickpos = {x = 209, y = 279, z = 10}},
    [14025] = {monsters = {"Lethal Lissy", "Ron The Ripper", "Deadeye Devious", "Brutus Bloodbeard"}, telePos = {x = 1850, y = 440, z = 7}, spawnPos = {x = 1859, y = 438, z = 7}, from = {x = 1848, y = 432, z = 7}, to = {x = 1864, y = 446, z = 7}, kickpos = {x = 207, y = 279, z = 10}},
    
	[14505] = {monsters = {"Tiquandas Revenge"}, telePos = {x = 1817, y = 438, z = 4}, spawnPos = {x = 1812, y = 443, z = 4}, from = {x = 1809, y = 435, z = 4}, to = {x = 1822, y = 447, z = 4}, kickpos = {x = 221, y = 279, z = 10}},
	[14506] = {monsters = {"Demodras"}, telePos = {x = 1968, y = 147, z = 8}, spawnPos = {x = 1964, y = 158, z = 8}, from = {x = 1961, y = 146, z = 8}, to = {x = 1979, y = 161, z = 8}, kickpos = {x = 211, y = 276, z = 10}}
    }

local function kickPlayerFromArea(cid, p)
	if isPlayer(cid) and isInRange(getPlayerPosition(cid), p[1], p[2]) then
		doTeleportThing(cid, p[3])
		doSendMagicEffect(p[3], CONST_ME_TELEPORT)
		doCreatureSay(cid, 'You were kicked out of the room.', TALKTYPE_ORANGE_1)
	end
end

local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function doRemoveMonstersInArea(from, to)
	for x = from.x, to.x do
		for y = from.y, to.y do
			local pos = {x=x, y=y, z = from.z}
			local m = getTopCreature(pos).uid
			if m > 0 and isMonster(m) then
				doRemoveCreature(m)
			end
		end
	end
end

local function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
	for i, v in pairs(unit) do
		if v == table[2] then
			return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
		end
	end
	
	return error("Bad declaration in mathtime function.")
end
	

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local now = teleports[item.uid]
    if now then
        local players = getPlayersInArea(now.from, now.to)
        if #players > 0 then      
			doCreatureSay(cid, 'Someone else is in the room.', TALKTYPE_ORANGE_1)
            doTeleportThing(cid, fromPosition, true)
            return true
        end
        
        if getPlayerStorageValue(cid, item.uid + (item.uid < 14500 and 100 or 0)) == 1 then
            doRemoveMonstersInArea(now.from, now.to)
         -- setPlayerStorageValue(cid, item.uid + (item.uid < 14500 and 100 or 0), 2)
            doTeleportThing(cid, now.telePos)
            doSendMagicEffect(now.telePos, CONST_ME_TELEPORT)
            doSummonCreature(now.monsters[math.random(#now.monsters)], now.spawnPos)
            doSendMagicEffect(now.spawnPos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You will be kicked from boss room in " .. timetokick[1] .. " "..timetokick[2]..".")
            addEvent(kickPlayerFromArea, mathtime(timetokick) * 1000, cid, {now.from, now.to, now.kickpos})
            return true
        end
		
		doCreatureSay(cid, 'You do not have permission.', TALKTYPE_ORANGE_1)
		doTeleportThing(cid, fromPosition, true)
    end
    return true
end