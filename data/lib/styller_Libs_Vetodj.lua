-- 1º by ???
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

-- 2º by WooX
function isPlayerOnline(name)
	local queryResult = db.storeQuery("SELECT `online` FROM `players` WHERE `name` = '"..name.."'")
	local result = result.getDataInt(queryResult, "online") > 0 and true or false
	return result
end

-- 3º by WooX
function getOfflinePlayerStorage(guid, storage)
	if not isPlayerOnline(getPlayerNameByGUID(guid)) then
		local queryResult = db.storeQuery("SELECT `value` FROM `player_storage` WHERE `key` = '"..storage.."' and `player_id` = "..guid.."")
		local result = queryResult and result.getDataInt(queryResult, "value") or -1
		return result
	end
end

-- 4º by WooX
function setOfflinePlayerStorage(guid, storage, value)
	if not isPlayerOnline(getPlayerNameByGUID(guid)) then
		db.query("UPDATE `player_storage` SET `value` = '"..value.."' WHERE `key` = '"..storage.."' and `player_id` = "..guid.."")
	end
end

-- 5º by WooX
function getItemNameByCount(itemID, count)
	if tonumber(count) and count > 1 and isItemStackable(itemID) then
		return getItemInfo(itemID).plural
	end
	return getItemNameById(itemID)
end

-- 6º by Reason
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

-- 7º by WooX
function isWalkable(pos, checkCreatures, checkStairs, checkPZ, checkFields)
	if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	if checkCreatures and getTopCreature(pos).uid > 0 then return false end
	if checkPZ and getTilePzInfo(pos) then return false end
	for i = 0, 255 do
		pos.stackpos = i
		local tile = getTileThingByPos(pos)
		if tile.itemid ~= 0 and not isCreature(tile.uid) then
			if hasProperty(tile.uid, CONST_PROP_BLOCKPROJECTILE) or hasProperty(tile.uid, CONST_PROP_IMMOVABLEBLOCKSOLID) or (hasProperty(tile.uid, CONST_PROP_BLOCKPATHFIND) and not((not checkFields and getTileItemByType(pos, ITEM_TYPE_MAGICFIELD).itemid > 0) or hasProperty(tile.uid, CONST_PROP_HASHEIGHT) or hasProperty(tile.uid, CONST_PROP_FLOORCHANGEDOWN) or hasProperty(tile.uid, CONST_PROP_FLOORCHANGEUP))) then
				return false
			elseif checkStairs then
				if hasProperty(tile.uid, CONST_PROP_FLOORCHANGEDOWN) or hasProperty(tile.uid, CONST_PROP_FLOORCHANGEUP) then
					return false
				end
			end
		else
			break
		end
	end
	return true
end



function isCreatureInArea(fromPos, toPos)
	local t = {}
	for z=fromPos.z, toPos.z do
		for y=fromPos.y, toPos.y do
			for x=fromPos.x, toPos.x do
				local v = getTopCreature({x=x,y=y,z=z})
				if v.itemid == 1 and table.find({1,2,3}, v.type) then
					table.insert(t, v.uid)
				end
			end
		end
	end
	return t
end

-- [TGY]








-- lib and functions by Vitor Bertolucci (Killua)

function warnPlayersWithStorage(storage, value, class, message) -- By Killua
    if not value then value = 1 end
	if not class then class = MESSAGE_SATUS_CONSOLE_WARNING end
	if not storage or not message then return end
    if #getPlayersOnline() == 0 then
        return
    end
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerStorageValue(pid, storage) == value then
			doPlayerSendTextMessage(pid, class, message)
		end
		if getPlayerAccess(pid) >= 4 then	
			doPlayerSendTextMessage(pid, class, "Mensagem referente ao storage "..storage.." "..message) -- Gms will always receive the messages
		end
    end
end

function getPlayerStorageZero(cid, storage) -- By Killua
    local sto = getPlayerStorageValue(cid, storage)
    if tonumber(sto) then
        return tonumber(sto) > tonumber(0) and tonumber(sto) or tonumber(0)
    end
    return tonumber(0)
end

function getStorageZero(storage) -- By Killua
    local sto = getGlobalStorageValue(storage)
    return sto > 0 and sto or 0
end

function countTable(table) -- By Killua
    local y = 0
    if type(table) == "table" then
        for _ in pairs(table) do
            y = y + 1
        end
        return y
    end
    return false
end

function getPlayersInArea(frompos, topos) -- By Killua
    local players_ = {}
    local count = 1
    for _, pid in pairs(getPlayersOnline()) do
        if isInArea(getCreaturePosition(pid), frompos, topos) then
            players_[count] = pid
            count = count + 1
        end
    end
    return countTable(players_) > 0 and players_ or false
end


if not getContainerItemsInfo then
function getContainerItemsInfo(containerUid) -- By Killua
    local table = {}
    if containerUid and containerUid > 0 then
        local a = 0   
        for i = 0, getContainerSize(containerUid) - 1 do
            local item = getContainerItem(containerUid,i)
            a = a + 1
            table[a] = {uid = item.uid, itemid = item.itemid, quant = item.type}
        end
        return table
    end
    return false
end
end

function getTableEqualValues(table) -- By Killua
    local ck = {}
    local eq = {}
    if type(table) == "table" then
      	if countTable(table) and countTable(table) > 0 then
           	for i = 1, countTable(table) do
             	if not isInArray(ck, table[i]) then
                    ck[i] = table[i]
                else
                    eq[i] = table[i]
                end
            end
            return countTable(eq) > 0 and eq or 0
        end
    end
    return false
end

function killuaGetItemLevel(uid) -- By Killua
	local name = getItemName(uid)
	local pos = 0
	for i = 1, #name do
		if string.byte(name:sub(i,i)) == string.byte('+') then
			pos = i + 1
            if name:sub(pos+1,pos+1) == "0" then
                return tonumber(10)
            end
            return tonumber(name:sub(pos,pos))
		end
    end
	return false
end

k_table_storage_lib = {
	filtrateString = function(str) -- By Killua
		local tb, x, old, last = {}, 0, 0, 0
		local first, second, final = 0, 0, 0
		if type(str) ~= "string" then
			return tb
		end
		for i = 2, #str-1 do
			if string.byte(str:sub(i,i)) == string.byte(':') then
				x, second, last = x+1, i-1, i+2
				for t = last,#str-1 do
					if string.byte(str:sub(t,t)) == string.byte(',') then
						first = x == 1 and 2 or old
						old, final = t+2, t-1
						local index, var = str:sub(first,second), str:sub(last,final)
						tb[tonumber(index) or tostring(index)] = tonumber(var) or tostring(var)
						break
					end
				end
			end
		end
		return tb
	end,

	translateIntoString = function(tb) -- By Killua
		local str = ""
		if type(tb) ~= "table" then
			return str
		end
		for i, t in pairs(tb) do
			str = str..i..": "..t..", "
		end
		str = "a"..str.."a"
		return tostring(str)
	end
}

function setPlayerTableStorage(cid, key, value) -- By Killua
	return doPlayerSetStorageValue(cid, key, k_table_storage_lib.translateIntoString(value))
end

function getPlayerTableStorage(cid, key) -- By Killua
	return k_table_storage_lib.filtrateString(getPlayerStorageValue(cid, key))
end

function setGlobalTableStorage(key, value) -- By Killua
	return setGlobalStorageValue(key, k_table_storage_lib.translateIntoString(value))
end

function getGlobalTableStorage(key) -- By Killua
	return k_table_storage_lib.filtrateString(getGlobalStorageValue(key))
end

function printTable(table, includeIndices,prnt) -- By Killua
    if includeIndices == nil then includeIndices = true end
    if prnt == nil then prnt = true end
    if type(table) ~= "table" then
        error("Argument must be a table")
        return
    end
    local str, c = "{", ""
    for v, b in pairs(table) do
        if type(b) == "table" then
            str = includeIndices and str..c.."["..v.."]".." = "..printTable(b,true,false) or str..c..printTable(b,false,false)
        else
            str = includeIndices and str..c.."["..v.."]".." = "..b or str..c..b
        end
        c = ", "
    end
    str = str.."}"
    if prnt then print(str) end
    return str
 end
 
function checkString(str) -- By Killua
	local check = true
	for i = 1, #str do
		local letra = string.byte(str:sub(i,i))
		if letra >= string.byte('a') and letra <= string.byte('z') or letra >= string.byte('A') and letra <= string.byte('Z') or letra >= string.byte('0') and letra <= string.byte('9') then
			check = true
		else
			check = false
			break
		end
	end
	return check
end

--[[function hasPokemon_two(cid, poke, ammount) -- By Killua
    local ammount, balls = ammount or 1, 0
    local items = getContainerItemsInfo(getPlayerSlotItem(cid, 10).uid)
    local slot = getPlayerSlotItem(cid,8).uid
    local slot_name = slot > 0 and getItemAttribute(slot, "name") or "nao tem"
    if string.find(string.lower(slot_name), string.lower(poke)) then
        balls = balls + 1
    end
    for _, item in pairs(items) do
        if isInArray({2557, 2653, 2532, 2652, 2654, 2195, 2531, 2557, 2524, 2525, 2523, 11751, 11752, 2533, 2534}, item.itemid) then
            local name = getItemAttribute(item.uid, "name")
            if string.find(string.lower(name),string.lower(poke)) then
                balls = balls + 1
            end
        end
    end
    if balls >= ammount then
        return true
    end
    return false
end ]]--

function agreeNPC(msg) -- By Killua
    return isInArray({"sim","yes","si"},msg)
end

function disagreeNPC(msg) -- By Killua
    return isInArray({"não","nao","no"},msg)
end

agreeNpc = agreeNPC
disagreeNpc = disagreeNPC

function isArmor(itemid) -- By Killua
	return getItemInfo(itemid).armor > 0
end

function isWeapon(uid) -- By Killua
	return getItemWeaponType(uid) ~= 0
end

function isShield(uid) -- By Killua
	return getItemWeaponType(uid) == 5
end

function isSword(uid) -- By Killua
	return getItemWeaponType(uid) == 1
end

function isClub(uid) -- By Killua
	return getItemWeaponType(uid) == 2
end

function isAxe(uid) -- By Killua
	return getItemWeaponType(uid) == 3
end

function isBow(uid) -- By Killua
	return getItemWeaponType(uid) == 4
end

function isWand(uid) -- By Killua
	return getItemWeaponType(uid) == 7
end

function isInBike(cid) -- By Killua
    local bike = getPlayerSlotItem(cid, 9)
    if bike and bike.itemid > 0 then
        if isInArray({2565, 12628, 12629, 12630, 12631}, bike.itemid) then return true end
    end
    return false
end

function executeSpell(cid, combat, var, nome, time, storage) -- By Killua

	local value = getPlayerStorageValue(cid,storage)
	if value >= os.time() then
		return false --doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, nome.." está em cooldown por ".. value - os.time().." segundos")
	else
		doPlayerSetStorageValue(cid, storage, time + os.time())
		--[[addEvent(function()
			if isPlayer(cid) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, nome.." está pronta para ser usada")
			end
		end,time * 1000)]]
		return doCombat(cid,combat,var)
	end
end

function existMonsterByName(name) -- By Vodkart
	if type(name) ~= "string" then error("argument must be a string!") end
	   local monsters = io.open("data/monster/monsters.xml","r")
	   local str = monsters:read("*all")
	   monsters:close();
	   if string.find(str:lower(),name:lower()) then return true end
	return false
end

function getTomorrowsDate(today) -- By Killua
    today = today or tonumber(os.date("%d"))
    months = {[1] = 31,[2] = 29,[3] = 31,[4] = 30,[5] = 31,[6] = 30,[7] = 31,[8] = 31,[9] = 30,[10] = 31,[11] = 30,[12] = 31}
    
    local month = tonumber(os.date("%m"))
    local max = months[month]
    local tomorrow = today + 1
    if tomorrow > max then
        tomorrow = 1
        month = month + 1
    end
    if month > 12 then month = 1 end
    local year = tonumber(os.date("%Y"))
    return {tomorrow,month,year}
end

function getAccountStorageValue(accid, key)
    local value = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = " .. accid .. " and `key` = " .. key .. " LIMIT 1;")
    if(value:getID() ~= -1) then
        return tonumber(value:getDataInt("value"))
    end
    return tonumber(-1)
end

function setAccountStorageValue(accid, key, value)
    local getvalue = db.getResult("SELECT `value` FROM `account_storage` WHERE `account_id` = " .. accid .. " and `key` = " .. key .. " LIMIT 1;")
    if(getvalue:getID() ~= -1) then
        db.executeQuery("UPDATE `account_storage` SET `value` = '" .. value .. "' WHERE `key`= '" .. key .. "' AND `account_id` = '" .. accid .. "'")
        return true
    else
        db.executeQuery("INSERT INTO `account_storage` (`account_id`, `key`, `value`) VALUES ('" .. accid .. "', '" .. key .. "', '"..value.."');")
        return true
    end
end

function getPlayerBuggedSkills(cid)
	return getPlayerStorageValue(cid,722601) > -1
	--[[local bug, skill = false, 0
	if getPlayerMagLevel(cid) >= 400 then
		skill = 7
		bug = true
	end
	for i = 0,5 do
		if getPlayerSkillLevel(cid,i) >= 400 then
			skill = i
			bug = true
			break;
		end
	end
	if bug then
		local arquivo = io.open("bug.txt",'a+')
		arquivo:write("Player "..getCreatureName(cid).." bugou o skill de número "..skill..". A vocação dele no momento era "..getPlayerVocation(cid).."\n")
		arquivo:flush()
		arquivo:close()
	end
	return bug]]

end

function startAura(cid) -- By Killua
	if not isPlayer(cid) then return end
	local strings = {", ` ´",". ´ ` ,",", ´ `","´ ` ,",", `"}
	doSendAnimatedText(getThingPos(cid),strings[math.random(1,#strings)],19)
	addEvent(startAura,1250,cid)
end

function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks) -- By Omega
    if not rank then
        rank = 3
        selectLowerRanks = true
    end
    local list = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerGuildId(pid) == guildId then
            local playerRank = getPlayerGuildLevel(pid)
            if playerRank == rank or (selectLowerRanks and playerRank <= rank) then
                table.insert(list, pid)
            end
        end
    end
    return list
end

function timeString(timeDiff,english)
    local dateFormat = {}

    if english then

        dateFormat = {
            {"day", timeDiff / 60 / 60 / 24},
            {"hour", timeDiff / 60 / 60 % 24},
            {"minute", timeDiff / 60 % 60},
            {"second", timeDiff % 60}
        }

    else

        dateFormat = {
            {"dia", timeDiff / 60 / 60 / 24},
            {"hora", timeDiff / 60 / 60 % 24},
            {"minuto", timeDiff / 60 % 60},
            {"segundo", timeDiff % 60}
        }
        
    end

    local out = {}
    for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' e ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
    
    return table.concat(out)
end

function isInEvent(cid) -- By Killua
    return getPlayerStorageValue(cid,rushEvent.teamStorage) > -1 or getPlayerStorageValue(cid,realTeamBattle.teamStorage) > 0 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) == 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) == 1 or getPlayerStorageValue(cid, CTF.storages.greenTeam) == 1 or getPlayerStorageValue(cid, CTF.storages.redTeam) == 1 or getPlayerStorageValue(cid,dtt.storage.team_blue) > 0 or getPlayerStorageValue(cid,dtt.storage.team_red) > 0 or getPlayerStorageValue(cid,9122234) > 0 or getPlayerStorageValue(cid,822066) > 0 or getCreatureStorage(cid,722601) > 0;
end

function startSpiritualAura(cid) -- By Killua
    if not isPlayer(cid) then return end
    local pos = getThingPos(cid)
    doSendMagicEffect(pos, 60)
    doSendMagicEffect(pos, 59)
    addEvent(startSpiritualAura,1250,cid)
end




function hourToNumber(str) -- By Killua
    local hour = (tonumber(str:sub(1,2))*3600) + (tonumber(str:sub(4,5)) * 60)
    if #str > 5 then
        hour = hour + tonumber(str:sub(7,8))
    end
    return hour
end

function getContainerFreeSlots(container)
    local size = getContainerSize(container)
    local slots = getContainerCap(container) - size
    for i = 0, size - 1 do
        local item = getContainerItem(container, i)
        if isContainer(item.uid) then
            slots = slots + getContainerFreeSlots(item.uid)
        end
    end
    return slots
end

function canPlayerReceiveItem(cid, itemId, ammount)
    local weight = getItemWeightById(itemId, ammount, true)
    if isItemStackable(itemId) then
        ammount = math.ceil(ammount / 100)
    end
    local freeCap = getPlayerFreeCap(cid)
    local freeSlots = 0
    if weight <= freeCap then
        local backpack = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
        if backpack.uid > 0 and isContainer(backpack.uid) then
            return getContainerFreeSlots(backpack.uid) >= ammount
        end
    end
    return false
end









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



function countDownTeleport(position, duration)
	if duration == 0 or getTileItemById(position, 1387).uid == 0 then
		return
	end
	local minute = duration >= 60
	local dateParameter = minute and "%M:%S" or "%S"
	local color = minute and COLOR_WHITE or COLOR_RED
	doSendAnimatedText(position, os.date(dateParameter, duration), color)
	doSendMagicEffect(position, minute and CONST_ME_MAGIC_BLUE or CONST_ME_MAGIC_RED)
	if not minute then
		if duration % 10 == 0 then
			doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
		end
	end
	addEvent(countDownTeleport, 1000, position, duration - 1)
end



-- Prevent spamm commands --
function checkExhausted(cid, storage, seconds)
	local v = exhaustion.get(cid, storage)
	if(not v) then
		exhaustion.set(cid, storage, seconds)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Waiting " .. v .. " second".. (v > 1 and "s" or "") .." for use command again.")
		return false
	end
	return true
end





-- *****************************************************************************************************************************
-- © Copyright All rights deserved - Scriptzone 2019, Brazil
-- Website: www.scriptzone.com.br
-- *****************************************************************************************************************************
-- Esta biblioteca é propriedade dos clientes da Scriptzone
-- É proibida a venda ou distribuição em qualquer situação
-- A violação e identificaçao do violador implica punição legal
-- Para bom funcionamento dos scripts relacionados a essa biblioteca de funções não devem existir funções repetidas no arquivo
-- Caso já possua outra biblioteca de funções da Scriptzone, una-as em um só arquivo
-- *****************************************************************************************************************************
-- This library is Scriptzone's clients property
-- It is prohibited sale or distribution in any situation
-- Violation and identification of the violator implies legal punishment
-- For proper scripts operation related to this library of functions shouldn't have repeated function in the file
-- In case of there is another Scriptzone library of functions, join them in a single file
-- *****************************************************************************************************************************

-- All functions by Scriptzone


function getStrTime(table)
local unit = {["sec"] = "second",["min"] = "minute",["hour"] = "hour",["day"] = "day"}
return tostring(table[1].." "..unit[table[2]]..(table[1] > 1 and "s" or ""))
end

function getStringTime(time, low_precision)
    local checkTime = time
    local unit = {{86400,"day"},{3600,"hour"},{60,"min"},{1,"sec"}}
    local strs, str, n = {}, "", 1
    if time == 1 then
        return string.format("1 %s", unit[4][2])
    elseif time <= 0 then
        return 0 
    end
    while time > 1 do
        local k = unit[n]
        if time > k[1] then
            local t, s = math.floor(time/k[1]), k[2]
            table.insert(strs, t.." "..(t > 1 and s.."s" or s))
            time = time % k[1]
        end
        n = n + 1
    end
    if not low_precision then
        for i = 1, #strs do
            str = str..strs[i]..(i == #strs-1 and " and " or i == #strs and "" or ", ")
        end
    else
        if #strs > 1 then
            if checkTime > 60 then
                str = "about "..strs[1]
            end
        else
            str = strs[1]
        end
    end
    return str
end

function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function doPlayerAddItemTab(cid, itemTable)
    if (not isItemStackable(itemTable[1]) and itemTable[2] > 1) then
        for k = 1, itemTable[2] do
            doPlayerAddItem(cid, itemTable[1], 1)
        end
    else
        doPlayerAddItem(cid, itemTable[1], itemTable[2])
    end
    return true
end

function addPlural(counter, windup, word)
    if counter <= 1 then return "" end
    return not word and windup or (word:sub(-1,-1) ~= windup and windup or "")
end

function count(T) local count = 0 for _ in pairs(T) do count = count + 1 end return count end

function setStorageTable(storage, tab, cid)
    local tabstr = "&"
    for i,x in pairs(tab) do
        tabstr = tabstr .. i .. "," .. x .. ";"
    end
    if not cid then
        return setGlobalStorageValue(storage, tabstr:sub(1, #tabstr-1))
    end
    return setPlayerStorageValue(cid, storage, tabstr:sub(1, #tabstr-1))
end

function getStorageTable(storage, cid)
local tabstr = getGlobalStorageValue(storage)
if cid then
    tabstr = getPlayerStorageValue(cid, storage)
end
local tab = {}
if type(tabstr) ~= "string" then
return {}
end
if tabstr:sub(1,1) ~= "&" then
return {}
end
local tabstr = tabstr:sub(2, #tabstr)
local a = string.explode(tabstr, ";")
for i,x in pairs(a) do
local b = string.explode(x, ",")
tab[tonumber(b[1]) or b[1]] = tonumber(b[2]) or b[2]
end
return tab
end

function addValueInTable(storage, value, cid)
    local x = {}
    for i = 1,#getStorageTable(storage, cid) do
        table.insert(x,getStorageTable(storage, cid)[i])
    end
    if x ~= 0 then
        table.insert(x,tonumber(value))
        setStorageTable(storage, x, cid)
    else
        setStorageTable(storage, {value}, cid)
    end
end

function getStorageTableValue(storage, index, cid)
    local tab = getStorageTable(storage, cid)
    return tab[index]
end

function setStorageTableValue(storage, index, value, cid)
    local x = {}
    local tab = getStorageTable(storage, cid)
    for i = 1, #tab do
        table.insert(x, tab[i])
    end
    if x[index] then
        x[index] = value
    end
    setStorageTable(storage, x, cid)
end

function setPlayerStorageTable(cid, storage, tab)
    local tabstr = "&"
    for i,x in pairs(tab) do
        tabstr = tabstr .. i .. "," .. x .. ";"
    end
    setPlayerStorageValue(cid, storage, tabstr:sub(1, #tabstr-1))
end
function getPlayerStorageTable(cid, storage)
    local tabstr = getPlayerStorageValue(cid, storage)
    local tab = {}
    if type(tabstr) ~= "string" then
        return {}
    end
    if tabstr:sub(1,1) ~= "&" then
        return {}
    end
    local tabstr = tabstr:sub(2, #tabstr)
    local a = string.explode(tabstr, ";")
    for i,x in pairs(a) do
        local b = string.explode(x, ",")
        tab[tonumber(b[1]) or b[1]] = tonumber(b[2]) or b[2]
    end
    return tab
end

function getGuildName(guildId)
local query = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. guildId .. ";")
if query:getID() == -1 then
    return nil
end
local guildName = query:getDataString("name")
query:free()
return tostring(guildName)
end

-- *****************************************************************************************************************************
-- © Copyright All rights deserved - Scriptzone 2019, Brazil
-- Website: www.scriptzone.com.br
-- *****************************************************************************************************************************
-- Esta biblioteca é propriedade dos clientes da Scriptzone
-- É proibida a venda ou distribuição em qualquer situação
-- A violação e identificaçao do violador implica punição legal
-- Para bom funcionamento dos scripts relacionados a essa biblioteca de funções não devem existir funções repetidas no arquivo
-- Caso já possua outra biblioteca de funções da Scriptzone, una-as em um só arquivo
-- *****************************************************************************************************************************
-- This library is Scriptzone's clients property
-- It is prohibited sale or distribution in any situation
-- Violation and identification of the violator implies legal punishment
-- For proper scripts operation related to this library of functions shouldn't have repeated function in the file
-- In case of there is another Scriptzone library of functions, join them in a single file
-- *****************************************************************************************************************************

function round(num, n)
    local m = 10^(n or 0)
    return math.floor(num*m + 0.5)/m
end

function checkContainerItems(container)
    local bp, t = getContainerItems(container), {}
    for index, item in pairs(bp) do
        if (#t >= 1 and not isInArray(t, item.itemid)) then
            return false
        end
        table.insert(t, item.itemid)
    end
    return true   
end

function getContainerSlotsFree(container)
return getContainerCap(container)-getContainerSize(container)
end

function getContainerItems(containeruid)
local items = {}
local containers = {}
if type(getContainerSize(containeruid)) ~= "number" then
return false
end
for slot = 0, getContainerSize(containeruid)-1 do
local item = getContainerItem(containeruid, slot)
if item.itemid == 0 then
break
end
if isContainer(item.uid) then
table.insert(containers, item.uid)
end
table.insert(items, item)
end
if #containers > 0 then
for i,x in ipairs(getContainerItems(containers[1])) do
table.insert(items, x)
end
table.remove(containers, 1)
end
return items
end
 
function getAllContainerFree(container)
local containers,soma = {},0
for i = 0, getContainerSize(container)-1 do
local item = getContainerItem(container, i)
if isContainer(item.uid) then
table.insert(containers, item.uid)
end
end
for _, check in pairs(containers) do
soma = soma + getContainerSlotsFree(check)
end
return (soma + getContainerSlotsFree(container))
end

function getMoneyInfo(moneycount)
    if moneycount < 1000 then
        return {id = 2148, price = moneycount}
    elseif moneycount >= 1000 and moneycount < 10000 then
        return {id = 2152, price = math.floor(moneycount / 100)*100}
    else
        return {id = 2160, price = math.floor(moneycount / 1000) * 1000}
    end
end

function capitalizeAll(str)
    return str:lower():gsub("%w+", 
        function(w) 
          return w:sub(1,1):upper() .. w:sub(2)
    end)
end

function ExistItemByName(name) 
local items = io.open("data/items/items.xml", "r"):read("*all")
local get = items:match('name="' .. name ..'"')
if get == nil or get == "" then
return false
end
return true
end 


function ExistSpellByName(name) 
local items = io.open("data/spells/spells.xml", "r"):read("*all")
local get = items:match('words="' .. name ..'"')
if get == nil or get == "" then
return false
end
return true
end 

function doRegisterInFile(cid, diretory, fileName, extension, msg, delFile)
    -- diretory: "data/lib/" // delFile, Ex: "data/lib/ind.xml" // 
    OfflineMessagesConfig = {
        messageSavingDirectory = ''..diretory..'', -- dir with saved messages (folder must exist!)
        messages = {
            messageType = MESSAGE_STATUS_CONSOLE_BLUE,
            ['cantSendMessage'] = "Error: Can't save message. Try it later.",
            ['messageSent'] = 'Ok, yours message has been sent to player %s.'
        },
        messageFormatString = '%s',
    }
    if delFile == "" then
        local file = io.open(diretory .. fileName .. '.'..extension..'', 'a+')
        if(not file) then
            -- print('[cantSendMessage]')
            return true
        end
        file:write(OfflineMessagesConfig.messageFormatString:format(msg) .. '\n')
        file:close()
        -- print('[messageSent]:format(destiny)')
    else
        os.remove(delFile)
    end
    return true
end



-- Ferumbas Asc.
GlobalStorage = { --GlobalStorage.FerumbrasAscension.alavancasTheShatterer
	FerumbrasAscension = {
		vortex = 97990,
		crystal1 = 97991,
		crystal2 = 97992,
		crystal3 = 97993,
		crystal4 = 97994,
		crystal5 = 97995,
		crystal6 = 97996,
		crystal7 = 97997,
		crystal8 = 97998,
		allCrystals = 97999,
		storageEstatua = 98035,
	},

	Versperoth = {
		Battle = 3147,
		Health = 3148
	},

	BossesPoi = {
		Massacre = 98000,
		Dracola = 98001,
		TheImperor = 98002,
		MrPunish = 98003,
		CountessSorrow = 98004,
		ThePlasmother = 98005,
		TheHandmaiden = 98006,
		Mawhawk = 98007,
		Gazharagoth = 98008

	}

}

Storage = { --Storage.FerumbrasAscension.storageDoorTwo
	FerumbrasAscension = {
		storageHabitatFrazzlemaw = 35001,
		storageHabitatDeer = 35002,
		storageHabitatRotworm = 35003,
		storageHabitatScorpion = 35004,
		storageHabitatSnake = 35005,
		storageHabitatPolarBear = 35006,
		storageHabitatSouleater = 35007,
		storageHabitatYielothax = 35008,
		storageThethTile = 97133,
		storageFluteWall = 98000,
		storageFlute = 98001,
		storageFireBug = 98002,
		storageDoor = 98003,
		storageTarbazNotes = 98004,
		storageColorLever = 98005,
		storageDoorTwo = 98006,
		storageLiberaAtalho1 = 98009,
		storageLiberaAcessoHabitats = 98011,
		storageAcessoFinalFerumbras = 98012,
		storageAccessBasir = 98022,
		acessoInfernatil = 98031,
		storageTile = 98034,
		storageFonte = 98036,
		storageBoss1 = 98037,
		storageBoss2 = 98038,
		storageBoss3 = 98039,
		storageBoss4 = 98040,
		storageBoss5 = 98041,
		storageBoss6 = 98042,
		storageBoss8 = 98044,
		storageBoss7 = 98045,
		storageFerumbrasFinal = 98046,
		storageTimeAlavancaFinal = 430500,
		storageTimeMazoran = 430501,
		storageTimePlagirath = 430502,
		storageTimeRagiaz = 430503,
		storageTimeRazzagorn = 430504,
		storageTimeShulgrax = 430505,
		storageTimeTarbaz = 430506,
		storageTimeZamulosh = 430507,
		storageTimeMazoran2 = 430508,
		storageTimePlagirath2 = 430509,
		storageTimeRagiaz2 = 430510,
		storageTimeRazzagorn2 = 430511,
		storageTimeShulgrax2 = 430512,
		storageTimeTarbaz2 = 430513,
		storageTimeZamulosh2 = 430514,
		storageTimeTheShaterrer = 430515,
		storageTimeTheLordOfTheLice = 430516,
		storageReward = 430517,
	},

	BigfootBurden = {
		QuestLine = 900,
		Test = 901,
		Shooting = 902,
		QuestLineComplete = 903,
		MelodyTone1 = 904,
		MelodyTone2 = 905,
		MelodyTone3 = 906,
		MelodyTone4 = 907,
		MelodyTone5 = 908,
		MelodyTone6 = 909,
		MelodyTone7 = 910,

		MelodyStatus = 911,

		Rank = 921,

		MissionCrystalKeeper = 930,
		CrystalKeeperTimout = 931,
		RepairedCrystalCount = 932,

		MissionRaidersOfTheLostSpark = 933,
		ExtractedCount = 934,
		RaidersOfTheLostSparkTimeout = 935,

		MissionExterminators = 936,
		ExterminatedCount = 937,
		ExterminatorsTimeout = 938,

		MissionMushroomDigger = 939,
		MushroomCount = 940,
		MushroomDiggerTimeout = 941,

		MissionMatchmaker = 942,
		MatchmakerStatus = 943,
		MatchmakerIdNeeded = 963,
		MatchmakerTimeout = 944,

		MissionTinkersBell = 945,
		GolemCount = 946,
		TinkerBellTimeout = 947,

		MissionSporeGathering = 948,
		SporeCount = 949,
		SporeGatheringTimeout = 950,

		MissionGrindstoneHunt = 951,
		GrindstoneStatus = 952,
		GrindstoneTimeout = 953,

		WarzoneStatus = 954,
		Warzone1Access = 955,
		Warzone2Access = 956,
		Warzone3Access = 957,

		Warzone1Reward = 958,
		Warzone2Reward = 959,
		Warzone3Reward = 960,
		bossKills = 961,
		openGoldenFruits = 962,

		BossWarzone1 = 963,
		BossWarzone2 = 964,
		BossWarzone3 = 965
	},

}


GlobalStorage = { --GlobalStorage.FerumbrasAscension.alavancasTheShatterer
	FerumbrasAscension = {
		vortex = 97990,
		crystal1 = 97991,
		crystal2 = 97992,
		crystal3 = 97993,
		crystal4 = 97994,
		crystal5 = 97995,
		crystal6 = 97996,
		crystal7 = 97997,
		crystal8 = 97998,
		allCrystals = 97999,
		storageEstatua = 98035,
	},

	Versperoth = {
		Battle = 3147,
		Health = 3148
	},

	BossesPoi = {
		Massacre = 98000,
		Dracola = 98001,
		TheImperor = 98002,
		MrPunish = 98003,
		CountessSorrow = 98004,
		ThePlasmother = 98005,
		TheHandmaiden = 98006,
		Mawhawk = 98007,
		Gazharagoth = 98008

	}

}


-- Fim bosses 