local config = {
	increasing = {[11062] = 11063},
	decreasing = {[11063] = 11062}
}

local tile_weapon = {x=749, y=2316, z=11}
local tp = {
[1] = {x= tile_weapon.x - 1,y=tile_weapon.y - 1,z=tile_weapon.z},
[2] = {x= tile_weapon.x,y=tile_weapon.y - 1,z=tile_weapon.z},
[3] = {x= tile_weapon.x - 1,y=tile_weapon.y,z=tile_weapon.z},
[4] = {x=tile_weapon.x - 1,y=tile_weapon.y + 1,z=tile_weapon.z},
[5] ={x=tile_weapon.x,y=tile_weapon.y + 1,z=tile_weapon.z},
[6] ={x=tile_weapon.x + 1,y=tile_weapon.y + 1,z=tile_weapon.z},
[7] ={x=tile_weapon.x + 1,y=tile_weapon.y,z=tile_weapon.z},
[8] ={x=tile_weapon.x + 1,y=tile_weapon.y - 1,z=tile_weapon.z}
}

local function countPlayersQuest(fromPosition, toPosition)
    local count = 0
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getCreaturePosition(pid), fromPosition, toPosition) then
            count = (count + 1)
        end
    end
    return count
end

function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return false
end

	local areaQuest = countPlayersQuest({x = 749, y = 2316, z = 11}, {x = 749, y = 2316, z = 11})
	
	if areaQuest >= 10 then
		local position = tp[math.random(1,8)]
		doTeleportThing(cid, position)
	end

	if(not config.increasing[item.itemid]) then
		return false
	else
		doTransformItem(item.uid, config.increasing[item.itemid])
	end
	return true
end


function onStepOut(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	if(not config.decreasing[item.itemid]) then
		return false
	else
		doTransformItem(item.uid, config.decreasing[item.itemid])
	end

	return true
end