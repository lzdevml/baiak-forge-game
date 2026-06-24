function convertTimeString(a)
	if(type(tonumber(a)) == "number" and a > 0) then
		if (a <= 3599) then
			local minute = math.floor(a/60)
			local second = a - (60 * minute)
			if(second == 0) then
				return ((minute)..((minute > 1) and " minutes" or " minute"))
			else
				return ((minute ~= 0) and ((minute>1) and minute.." minutes and " or minute.." minute and ").. ((second>1) and second.." seconds" or second.." second") or ((second>1) and second.." seconds" or second.. " second"))
			end
		else
			local hour = math.floor(a/3600)
			local minute = math.floor((a - (hour * 3600))/60)
			local second = (a - (3600 * hour) - (minute * 60))
			if (minute == 0 and second > 0) then
				return (hour..((hour > 1) and " hours and " or " hour and "))..(second..((second > 1) and " seconds" or " second"))
			elseif (second == 0 and minute > 0) then
				return (hour..((hour > 1) and " hours and " or " hour and "))..(minute..((minute > 1) and " minutes" or " minute"))
			elseif (second == 0 and minute == 0) then
				return (hour..((hour > 1) and " hours" or " hour"))
			end

			return (hour..((hour > 1) and " hours, " or " hour, "))..(minute..((minute > 1) and " minutes and " or " minute and "))..(second..((second > 1) and " seconds" or " second"))
		end
	end
end

function getTimeString(self)
    local format = {
        {'dia', self / 60 / 60 / 24},
        {'hora', self / 60 / 60 % 24},
        {'minuto', self / 60 % 60},
        {'segundo', self % 60}
    }
    
    local out = {}
    for k, t in ipairs(format) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #format and (#out > 0 and ', ' or '') or ' e ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    local ret = table.concat(out)
    if ret:len() < 16 and ret:find('segundo') then
        local a, b = ret:find(' e ')
        ret = ret:sub(b+1)
    end
    return ret
end

function isPlayerOnline(name)
	local queryResult = db.storeQuery("SELECT `online` FROM `players` WHERE `name` = '"..name.."'")
	local result = result.getDataInt(queryResult, "online") > 0 and true or false
	return result
end

function getOfflinePlayerStorage(guid, storage)
	if not isPlayerOnline(getPlayerNameByGUID(guid)) then
		local queryResult = db.storeQuery("SELECT `value` FROM `player_storage` WHERE `key` = '"..storage.."' and `player_id` = "..guid.."")
		local result = queryResult and result.getDataInt(queryResult, "value") or -1
		return result
	end
end

function setOfflinePlayerStorage(guid, storage, value)
	if not isPlayerOnline(getPlayerNameByGUID(guid)) then
		db.query("UPDATE `player_storage` SET `value` = '"..value.."' WHERE `key` = '"..storage.."' and `player_id` = "..guid.."")
	end
end

function getItemNameByCount(itemID, count)
	if tonumber(count) and count > 1 and isItemStackable(itemID) then
		return getItemInfo(itemID).plural
	end
	return getItemNameById(itemID)
end

function printTable(_table)
	local function getTable(_table, expand, tabs)
		
		local aux = ""
		if not type(_table) == "table" then
			return _table
		else
			for key,value in pairs(_table) do
				if type(value) == "table" then
				
					for i = 1, tabs -1 do
						aux = aux.."\t"
					end
					
					if type(key)  == "string" then
						aux = aux.. '["'..key..'"] =\t{ \n'..getTable(value, true, tabs +1)
					else
						aux = aux.. "["..key.."] =\t{ \n"..getTable(value, true, tabs +1)
					end
					
					for i = 1, tabs do
						aux = aux.. "\t"
					end
					
					aux = aux.."},\n"				
				else
					if expand then
						for i = 1, tabs -1 do
							aux = aux.. "\t"
						end
					end
					if type(key)  == "string" then
						aux = aux.. '["'..key..'"] = '..(type(value) == "string" and '"'..value..'"' or tostring(value))..",\n"
					else
						aux = aux.. '['..key..'] = '..(type(value) == "string" and '"'..value..'"' or tostring(value))..",\n"
					end
				end
			end
		end

		return aux
	end
    if type(_table) == "table" then
        print(getTable(_table, false, 1))
        return true
    else
        error("Parameter is not a table!")
        return false
    end
end

function getCreaturesFromArea(fromPos, toPos, onlyPlayers)
    local creatureInArea = {}
    for posx = fromPos.x, toPos.x do
        for posy = fromPos.y, toPos.y do
            for posz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=posx,y=posy,z=posz}).uid
                if(tmp > 0) then
					for s = 0, 255 do
						search_pos = {x = posx, y = posy, z = posz, stackpos = s}
						tmpCreature = getThingfromPos(search_pos).uid
						if tmpCreature > 0 and isCreature(tmpCreature) then
							if (onlyPlayers and isPlayer(tmpCreature) and not isSummon(tmpCreature)) or (not onlyPlayers and not isSummon(tmpCreature)) then
								if not isInArray(creatureInArea, tmpCreature) then
									table.insert(creatureInArea, tmpCreature)
								end
							end
						end
					end
                end
            end
        end
    end
    return creatureInArea
end

function getMonstersFromArea(fromPos, toPos)
    local monsterInArea = {}
    for posx = fromPos.x, toPos.x do
        for posy = fromPos.y, toPos.y do
            for posz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=posx,y=posy,z=posz}).uid
                if(tmp > 0) then
					for s = 0, 255 do
						_search_pos = {x = posx, y = posy, z = posz, stackpos = s}
						tmpMonster = getThingfromPos(_search_pos).uid
						if tmpMonster > 0 and isMonster(tmpMonster) and not isSummon(tmpMonster) and not isInArray(monsterInArea, tmpMonster) then
							table.insert(monsterInArea, tmpMonster)
						end
					end
                end
            end
        end
    end
    return monsterInArea
end