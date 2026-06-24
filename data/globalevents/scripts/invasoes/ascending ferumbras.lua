local position = {x=167, y=172, z=8} -- local do monstro que será sumonado
local name = "Ascending Ferumbras" -- monstro que será sumonado

local kick = {x = 151, y = 167, z = 8}
local from = {x = 177, y = 197, z = 8}
local to = {x=167, y=172, z=8}

worldBoss_day = {
	["Monday"] = {"21:15"}
}

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

local function getPlayers(from, to)
    local t = {}
    for x = from.x, to.x do
        for y = from.y, to.y do
            local pos = {x = x, y = y, z = from.z}
            local creatures = getTileInfo(pos).creatures
            if creatures ~= 0 then
                pos.stackpos = 1
                local c = getThingfromPos(pos)
                while c.uid ~= 0 do
                    if c.itemid == 1 and c.type == 1 then
                        table.insert(t, c.uid)
                        if #t == creatures then
                            break
                        end
                    end
                    pos.stackpos = pos.stackpos + 1
                    c = getThingfromPos(pos)
                end
            end
        end
    end
    return t
end
		
function onThink(interval, lastExecution)
	if worldBoss_day[os.date("%A")] then
		local hrs = tostring(os.date("%X")):sub(1, 5)
		if isInArray(worldBoss_day[os.date("%A")], hrs) and getGlobalStorageValue(30075) <= 0 then
			local t = getPlayers(from, to)
			if #t > 0 then -- returns the amount of players
				for i = 1, #t do -- looping all the players in area
					doTeleportThing(t[i], kick) -- teleport them to a place
					doPlayerSendTextMessage(t[i], MESSAGE_STATUS_CONSOLE_ORANGE, "Você não pode ficar na sala do BOSS quando ele nasce.")
				end
			end
		
			doCleanTile(position)
			doRemoveMonstersInArea(from, to)
			doSummonCreature(name, position, true, true)
			doBroadcastMessage("[World Boss] Ascending Ferumbras vai destruir seus sonhos em uma enxurrada de pesadelos!")
			setGlobalStorageValue(30075, 1)
		end
	end
	return true
end
