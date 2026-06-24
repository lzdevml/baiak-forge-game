local config = {
	increasing = {[11062] = 11063},
	decreasing = {[11063] = 11062}
}

local tile_woe = {x=3775, y=2591, z=7}
local tp = {
[1] = {x= tile_woe.x - 1,y=tile_woe.y + 1,z=tile_woe.z},
[2] = {x= tile_woe.x,y=tile_woe.y + 1,z=tile_woe.z},
[3] = {x=tile_woe.x + 1,y=tile_woe.y + 1,z=tile_woe.z},
}

local function countPlayers(fromPosition, toPosition)
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

	local area = countPlayers({x = 3775, y = 2591, z = 7}, {x = 3775, y = 2591, z = 7})
	
	if area >= 10 then
		local position = tp[math.random(1,3)]
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