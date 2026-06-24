local position = {x=1078, y=2296, z=7} -- local do monstro que ser?umonado

local kick = {x=160, y=51, z=7}
local from = {x=1076, y=2293, z=8}
local to = {x=1079, y=2288, z=7}

local ran = {
    [1] = "Barbaria",
    [2] = "Brutus Bloodbeard",
	[3] = "Deadeye Devious",
	[4] = "Thul",
	[5] = "Earth Overlord",
	[6] = "Energy Overlord",
	[7] = "Esmeralda",
	[9] = "Fire Overlord",
	[10] = "Foreman Kneebiter",
	[11] = "Hairman The Huge",
	[12] = "Hide",
	[13] = "Leviathan",
	[14] = "Lord of the Elements",
	[15] = "Massacre",
	[16] = "Ghazbaran",
	[17] = "Morgaroth",
	[18] = "Mr. Punish",
	[19] = "Munster",
	[20] = "Necropharus",
	[21] = "Orshabaal",
	[22] = "Ron The Ripper",
	[23] = "Rotworm Queen",
	[24] = "Rottie the Rotworm",
	[25] = "Shardhead",
	[26] = "Sir Valorcrest",
	[27] = "The Abomination",
	[28] = "The Bloodtusk",
	[29] = "The Bloodweb",
	[30] = "The Count",
	[31] = "The Evil Eye",
	[32] = "The Handmaiden",
	[33] = "The Horned Fox",
	[34] = "The Imperor",
	[35] = "The Many",
	[36] = "The Noxious Spawn",
	[37] = "The Old Widow",
	[38] = "The Plasmother",
	[39] = "The Snapper",
	[40] = "Tiquandas Revenge",
	[41] = "Zulazza the Corruptor",
	[42] = "Lethal Lissy",
	[43] = "Stonecracker",
	[44] = "Demodras"
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
		
function onThink(interval)
	local t = getPlayers(from, to)
	if #t > 0 then -- returns the amount of players
		for i = 1, #t do -- looping all the players in area
			doTeleportThing(t[i], kick) -- teleport them to a place
			doPlayerSendTextMessage(t[i], MESSAGE_STATUS_CONSOLE_ORANGE, "Voc??pode ficar na sala do BOSS quando ele nasce.")
		end
	end

	local inva = ran[math.random(44)]
	doCleanTile(position)
	doRemoveMonstersInArea(from, to)
	doSummonCreature(inva, position, true, true)
	doBroadcastMessage("[Invocation. O Boss ".. inva .." surgiu.")
	return true
end
