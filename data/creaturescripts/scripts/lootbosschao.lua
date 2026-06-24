local function doMoveLoot(pos, corpseId)
	local corpse = getTileItemById(pos, corpseId)
	local directions = {NORTH, EAST, SOUTH, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST}
	local true_pos = {}
	for _, dir in pairs(directions) do
		local posi = getPosByDir(pos, dir)
		if isWalkable(posi) then
			table.insert(true_pos, posi)
		end
	end
	if #true_pos == 0 then
		table.insert(pos, true_pos)
	end
	local remaining_pos = true_pos
	local maxLoops = getContainerSize(corpse.uid) * 2
	repeat
		local lootItem = getContainerItem(corpse.uid, 0).uid
		maxLoops = maxLoops - 1
		if lootItem > 0 then
			local random = math.random(#remaining_pos)
			local random_pos = remaining_pos[random]
			doTeleportThing(lootItem, random_pos)
			table.remove(remaining_pos, random)
			if #remaining_pos == 0 then
				remaining_pos = true_pos
			end
		else
			break
		end
	until maxLoops <= 0
end

function isWalkable(pos)-- by Nord / editado por Omega
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then
		return false
    elseif getTileInfo(pos).protection then
		return false
	elseif HasItemProperty(getThingFromPos(pos).uid, 3) or HasItemProperty(getThingFromPos(pos).uid, 7) then
		return false
	end
    return true
end

function onDeath(monster, corpse, killers)
	if not isContainer(corpse.uid) then return true end
	addEvent(doMoveLoot, 5, getThingPos(monster), corpse.itemid)	
return true
end