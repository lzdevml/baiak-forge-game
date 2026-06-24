--[[function getResets(cid)
    local Info = db.getResult("SELECT `Rebirths` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
        if Info:getID() ~= LUA_ERROR then
        local rebs= Info:getDataInt("Rebirths")
        Info:free()
        return rebs
    end
     return LUA_ERROR
end

function getPlayerRebirth(cid)
    local Info = db.getResult("SELECT `Rebirths` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
        if Info:getID() ~= LUA_ERROR then
        local rebs= Info:getDataInt("Rebirths")
        Info:free()
        return rebs
    end
     return LUA_ERROR
end

function doRemoveThing(uid)
	if(isCreature(uid)) then
		return doRemoveCreature(uid)
	end

	return doRemoveItem(uid)
end

 
function doAddRebirth(cid, rebs)
    db.executeQuery("UPDATE `players` SET `Rebirths` = `Rebirths` + " .. rebs .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
end
 
function doRemoveRebirth(cid, rebs)
    db.executeQuery("UPDATE `players` SET `Rebirths` = `Rebirths` - " .. rebs .. " WHERE `id` = " .. getPlayerGUID(cid) .. ";")
end

local event = nil
 
local function Restore(id, pos, npos, uid)
    if getTileItemById(pos, id).uid ~= 1 then
        return doCreateItem(id, pos), doRelocate(pos, npos), doTransformItem(uid, 1945)
    end
end
 ]]--

function countDown(number, pos, effect, msgonend, effectonend)
  local n = number
       for i = 1, number do
           addEvent(doSendAnimatedText,i* 1000, pos, n > 1 and n.."" or msgonend .."", n < 6 and TEXTCOLOR_RED or TEXTCOLOR_GREEN)
		   addEvent(doSendMagicEffect,i* 1000, pos, n > 1 and effect or effectonend )
              n = n -1
	   end
      n = number
return true
end
vip = {
   name = "Vip system";
   author = "Mock";
   version = "1.0.0.0";
   query="ALTER TABLE `accounts` ADD `vip_time` INTEGER";
   query2="ALTER TABLE `accounts` ADD `vip_time` INT(15) NOT NULL"
}

extraVipStorage = 77001
extraLootStorage = 22881
extraDamageStorage = 22001

function doPlayerSetSkills(cid, value)
    for i = 0, 7 do
        doPlayerSetRate(cid, i, value)
    end
end

--[[function timeString(timeDiff)
  local dateFormat = {
    {"day", timeDiff / 60 / 60 / 24},
    {"hour", timeDiff / 60 / 60 % 24},
    {"minut", timeDiff / 60 % 60},
    {"second", timeDiff % 60}
  }

  local out = {}
    for k, t in ipairs(dateFormat) do
      local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' y ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end
  local ret = table.concat(out)
    if ret:len() < 16 and ret:find("second") then
      local a, b = ret:find(" y ")
      ret = ret:sub(b+1)
    end
  return ret
end]]--

function vip.setTable()
   dofile('config.lua')
   if sqlType == "sqlite" then
   db.executeQuery(vip.query)
   else
        db.executeQuery(vip.query2)
   end
end


function vip.getVip(cid)
         assert(tonumber(cid),'Parameter must be a number') 
         if isPlayer(cid) == FALSE then error('Player don\'t find') end; 
         ae =  db.getResult("SELECT `vip_time` FROM `accounts` WHERE `name` = '"..getPlayerAccount(cid).."';")
         if ae:getID() == -1 then
            return 0
         end

local retee = ae:getDataInt("vip_time") or 0
ae:free()
         return retee
end

function vip.getVipByAcc(acc)
         assert(acc,'Account is nil')
         local a = db.getResult("SELECT `vip_time` FROM `accounts` WHERE `name` = '"..acc.."';")
         if a:getID() ~= -1 then
             return a:getDataInt("vip_time") or 0, a:free()
         else
             error('Account don\'t find.')
         end
end

function vip.setVip(cid,time)
         dofile("config.lua")
         assert(tonumber(cid),'Parameter must be a number')
         assert(tonumber(time),'Parameter must be a number')
         if isPlayer(cid) == FALSE then error('Player don\'t find') end; 
         db.executeQuery("UPDATE `"..sqlDatabase.."`.`accounts` SET `vip_time` = '"..(os.time()+time).."' WHERE `accounts`.`name` ='".. getPlayerAccount(cid).."';")
end

function vip.getVipByAccount(acc)
         assert(acc,'Account is nil')
         return db.getResult("SELECT `vip_time` FROM `accounts` WHERE `name` = '"..acc.."';"):getDataInt("vip_time") or 0
end                                      

function vip.hasVip(cid)
         assert(tonumber(cid),'Parameter must be a number')
         if isPlayer(cid) == FALSE then return end;
         local t = vip.getVip(cid) or 0
         if os.time(day) < t then
            return TRUE
         else
            return FALSE
         end
end

function vip.hasVips(cid)
         assert(tonumber(cid),'Parameter must be a number')
         if isPlayer(cid) == FALSE then return end;
         local t = vip.getVip(cid)
         if os.time(day) < t then
            return TRUE
         else
            return FALSE
         end
end

function vip.accountHasVip(acc)
         assert(acc,'Account is nil')
         if os.time() < vip.getVipByAccount(acc) then
            return TRUE
         else
            return FALSE
         end
end
function vip.getDays(days)
   return (3600 * 24 * days)
end

function vip.addVipByAccount(acc,time)
   assert(acc,'Account is nil')
   assert(tonumber(time),'Parameter must be a number')
   local a = vip.getVipByAcc(acc)
   a = os.difftime(a,os.time())
   if a < 0 then a = 0 end;
   a = a+time
   return vip.setVipByAccount(acc,a)
end

function vip.setVipByAccount(acc,time)
         dofile("config.lua")
         assert(acc,'Account is nil')
         assert(tonumber(time),'Parameter must be a number')
         db.executeQuery("UPDATE `accounts` SET `vip_time` = '"..(os.time()+time).."' WHERE `accounts`.`name` ='"..acc.."';")
         return TRUE
end

function vip.returnVipString(cid)
   assert(tonumber(cid),'Parameter must be a number')
   if isPlayer(cid) == TRUE then
      return os.date("%d %B %Y %X ", vip.getVip(cid))
   end
end
------end-----

function getGuildNameByID(gid) -- By Killua
    local query = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = '"..gid.."'")
    if query:getID() == -1 then
        return false
    end
    local name = query:getDataString("name")
    query:free()
    return name
end

--[[function isWalkable(pos, creature, proj, pz)
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end]]--

function isInArray(array, value, caseSensitive)
	if(caseSensitive == nil or caseSensitive == false) and type(value) == "string" then
		local lowerValue = value:lower()
		for _, _value in ipairs(array) do
			if type(_value) == "string" and lowerValue == _value:lower() then
				return true
			end
		end
	else
		for _, _value in ipairs(array) do
			if (value == _value) then return true end
		end
	end

	return false
end

ARMY = {
	[1] = {1, 15, "Soldado Raso", 150000, 15000}, -- [NAºmero] = {Pontos Kill, Points para UP, "Nome",PLATINIUM COINS POR KILL, 0},
	[2] = {1, 20, "Soldado de Primeira Classe", 200000, 20000},
	[3] = {1, 25, "Cabo", 250000, 25000},
	[4] = {1, 30, "Sargento", 300000, 30000},
	[5] = {1, 35, "Sargento-Ajudante 1", 350000, 35000},
	[6] = {1, 40, "Sargento-Ajudante 2", 400000, 40000},
	[7] = {1, 45, "Sargento-Chefe", 450000, 45000},
	[8] = {1, 50, "Sargento-Mestre 1", 500000, 50000},
	[9] = {1, 55, "Sargento-Mestre 2", 550000, 55000},
	[10] = {1, 60, "Sargento-Mestre 3", 600000, 60000},
	[11] = {1, 65, "Sargento-Mestre 4", 650000, 65000},
	[12] = {1, 70, "Sargento-Mor do Comando", 700000, 70000},
	[13] = {1, 75, "Segundo-Tenente 1", 750000, 75000},
	[14] = {1, 80, "Segundo-Tenente 2", 800000, 80000},
	[15] = {1, 85, "Segundo-Tenente 3", 850000, 85000},
	[16] = {1, 90, "Segundo-Tenente 4", 900000, 90000},
	[17] = {1, 95, "Primeiro-Tenente 1", 950000, 95000},
	[18] = {1, 100, "Primeiro-Tenente 2", 1000000, 100000},
	[19] = {1, 105, "Primeiro-Tenente 3", 1100000, 100000},
	[20] = {1, 110, "Primeiro-Tenente 4", 1200000, 100000},
	[21] = {1, 115, "Primeiro-Tenente 5", 1300000, 100000},
	[22] = {1, 120, "Capitao 1", 1400000, 500000},
	[23] = {1, 125, "Capitao 2", 1500000, 500000},
	[24] = {1, 130, "Capitao 3", 1600000, 500000},
	[25] = {1, 135, "Capitao 4", 1700000, 500000},
	[26] = {1, 140, "Capitao 5", 1800000, 500000},
	[27] = {1, 145, "Major 1", 1900000, 1000000},
	[28] = {1, 150, "Major 2", 2000000, 1000000},
	[29] = {1, 155, "Major 3", 2100000, 1000000},
	[30] = {1, 160, "Major 4", 2200000, 1000000},
	[31] = {1, 165, "Major 5", 2300000, 1000000},
	[32] = {1, 170, "Tenente-Coronel 1", 2400000, 1500000},
	[33] = {1, 175, "Tenente-Coronel 2", 2500000, 1500000},
	[34] = {1, 180, "Tenente-Coronel 3", 2600000, 1500000},
	[35] = {1, 185, "Tenente-Coronel 4", 2700000, 1500000},
	[36] = {1, 190, "Tenente-Coronel 5", 2800000, 1500000},
	[37] = {1, 195, "Coronel 1", 3000000, 2000000},
	[38] = {1, 200, "Coronel 2", 3000000, 2500000},
	[39] = {1, 300, "Coronel 3", 3000000, 3000000},
	[40] = {1, 400, "Coronel 4", 3000000, 3500000},
	[41] = {1, 500, "Coronel 5", 3000000, 4000000},
	[42] = {1, 9999999, "General", 5000000, 5000000},
	
	
}  
ARMY_LEVEL = 2014159
ARMY_EXPERIENCE = 2014160

function doAddPoints(cid, points)
db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
end

function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end


function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if(not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function doPlayerAddStamina(cid, minutes)
	return doPlayerSetStamina(cid, getPlayerStamina(cid) + minutes)
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigValue('freePremium'))))
end

function getMonthDayEnding(day)
	if(day == "01" or day == "21" or day == "31") then
		return "st"
	elseif(day == "02" or day == "22") then
		return "nd"
	elseif(day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function doNumberFormat(i)
	local str, found = string.gsub(i, "(%d)(%d%d%d)$", "%1,%2", 1), 0
	repeat
		str, found = string.gsub(str, "(%d)(%d%d%d),", "%1,%2,", 1)
	until found == 0
	return str
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function getTibiaTime(num)
	local minutes, hours = getWorldTime(), 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	if(num) then
		return {hours = hours, minutes = minutes}
	end

	return {hours =  hours < 10 and '0' .. hours or '' .. hours, minutes = minutes < 10 and '0' .. minutes or '' .. minutes}
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if(not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time)
	local condition = createConditionObject(CONDITION_MUTED, (time == -1 and time or time * 1000))
	return doAddCondition(cid, condition, false)

end

function doSummonCreature(name, pos)
	local cid = doCreateMonster(name, pos, false, false)
	if(not cid) then
		cid = doCreateNpc(name, pos)
	end

	return cid
end

function getPlayersOnlineEx()
	local players = {}
	for i, cid in ipairs(getPlayersOnline()) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	return isPlayer(cid) and (getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE, CONDITIONID_DEFAULT) or getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN))
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	-- Npc IDs are over int32_t range (which is default for lua_pushnumber),
	-- therefore number is always a negative value.
	return isCreature(cid) and (cid < 0 or cid >= AUTOID_NPCS)
end

function isUnderWater(cid)
	return isInArray(underWater, getTileInfo(getCreaturePosition(cid)).itemid)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level, amount = 0, getPlayerLevel(cid), amount or 1
	if(amount > 0) then
		experience = getExperienceForLevel(level + amount) - (round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	local amount = amount or 1
	for i = 1, amount do
		doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid), false)
	end

	return true
end

function doPlayerAddSkill(cid, skill, amount, round)
	local amount = amount or 1
	if(skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif(skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	for i = 1, amount do
		doPlayerAddSkillTry(cid, skill, getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill), false)
	end

	return true
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if(type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if(type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function doCopyItem(item, attributes)
	local attributes = ((type(attributes) == 'table') and attributes or { "aid" })

	local ret = doCreateItemEx(item.itemid, item.type)
	for _, key in ipairs(attributes) do
		local value = getItemAttribute(item.uid, key)
		if(value ~= nil) then
			doItemSetAttribute(ret, key, value)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if(writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if(date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if(not item) then
		return false
	end

	if(count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	return precission and weight or math.round(weight, 2)
end

function choose(...)
	local arg, ret = {...}

	if type(arg[1]) == 'table' then
		ret = arg[1][math.random(#arg[1])]
	else
		ret = arg[math.random(#arg)]
	end

	return ret
end

function doPlayerAddExpEx(cid, amount)
	if(not doPlayerAddExp(cid, amount)) then
		return false
	end

	local position = getThingPosition(cid)
	doPlayerSendTextMessage(cid, MESSAGE_EXPERIENCE, "You gained " .. amount .. " experience.", amount, COLOR_WHITE, position)

	local spectators, name = getSpectators(position, 7, 7), getCreatureName(cid)
	for _, pid in ipairs(spectators) do
		if(isPlayer(pid) and cid ~= pid) then
			doPlayerSendTextMessage(pid, MESSAGE_EXPERIENCE_OTHERS, name .. " gained " .. amount .. " experience.", amount, COLOR_WHITE, position)
		end
	end

	return true
end

function getItemTopParent(uid)
	local parent = getItemParent(uid)
	if(not parent or parent.uid == 0) then
		return nil
	end

	while(true) do
		local tmp = getItemParent(parent.uid)
		if(tmp and tmp.uid ~= 0) then
			parent = tmp
		else
			break
		end
	end

	return parent
end

function getItemHolder(uid)
	local parent = getItemParent(uid)
	if(not parent or parent.uid == 0) then
		return nil
	end

	local holder = nil
	while(true) do
		local tmp = getItemParent(parent.uid)
		if(tmp and tmp.uid ~= 0) then
			if(tmp.itemid == 1) then -- a creature
				holder = tmp
				break
			end

			parent = tmp
		else
			break
		end
	end

	return holder
end

function valid(f)
	return function(p, ...)
		if(isCreature(p)) then
			return f(p, ...)
		end
	end
end

function addContainerItems(container,items)
	local items_mod = {}
	for _, it in ipairs(items) do
		if( isItemStackable(it.id) and it.count > 100) then
			local c = it.count
			while( c > 100 ) do
				table.insert(items_mod,{id = it.id,count = 100})
				c = c - 100
			end
			if(c > 0) then
				table.insert(items_mod,{id = it.id,count = c})
			end
		else
			table.insert(items_mod,{id = it.id,count = 1})
		end
	end

	local free = getContainerCap(container.uid) - (getContainerSize(container.uid) )
	local count = math.ceil(#items_mod/ free)
	local main_bp = container.uid
	local insert_bp = main_bp
	local counter = 1
	for c,it in ipairs(items_mod) do
		local _c = isItemStackable(it.id) and (it.count > 100 and 100 or it.count) or 1
		if count > 1 then
			if (counter < free) then
				doAddContainerItem(insert_bp, it.id, _c)
			else
				insert_bp = doAddContainerItem(insert_bp, container.itemid, 1)
				count = (#items_mod)-(free-1)
				free = getContainerCap(insert_bp) 
				count = math.ceil(count/ free)
				doAddContainerItem(insert_bp, it.id, _c)
				counter = 1
			end
			counter = counter + 1
		else
			doAddContainerItem(insert_bp, it.id, _c)
		end
	end

	return main_bp
end
function doCreateItemInArea(firstpos, area, tab) -- function by MatheusMkalo
    for i, z in pairs(area) do
        pos = {x=firstpos.x, y=firstpos.y+i-1, z=firstpos.z}
        for s, x in pairs(z) do
            pos.x = firstpos.x+s-1
            if tab[x] or type(x) == "table" then
                for l = 1, type(x) == "table" and #x or 1 do
                    item = doCreateItem(type(x) == "table" and (not tab[x[l]].name and tab[x[l]].itemid or getItemIdByName(tab[x[l]].name)) or (not tab[x].name and tab[x].itemid or getItemIdByName(tab[x[l]].name)), type(x) == "table" and (tab[x[l]].count == nil and 1 or tab[x[l]].count) or tab[x].count == nil and 1 or tab[x].count, pos)
                    doItemSetAttribute(item, "aid", type(x) == "table" and (tab[x[l]].actionid == nil and 0 or tab[x[l]].actionid) or tab[x].actionid == nil and 0 or tab[x].actionid) 
                end
            end
        end
    end
return TRUE
end

function doCleanArea(x,ex,y,ey,z)
 for x = x,ex do
 for y = y,ey do
 pos = {x=x, y=y, z=z, stackpos = 1}
 var = getThingFromPos(pos)
 
 doRemoveItem(var.uid, 1)
 end
 end
 end
 
function getClock(secs)
return os.date("%H:%M:%S ",secs- os.time()+82800)
end

function countPlayers(fromPos, toPos)
    local count = 0
    for x=fromPos.x,toPos.x do
        for y=fromPos.y,toPos.y do
            for z=fromPos.z,toPos.z do
                local v = getTopCreature({x=x, y=y, z=z}).uid
                if isPlayer(v) then
                    count = (count + 1)
                end
            end
        end
    end
    return count
end

function getPlayerId(cid)
	Query1 = db.getResult("SELECT `id` FROM `players` WHERE `name` = '"..getPlayerName(cid).."'")
	local id = Query1:getDataString("id")
	return id
end

function getFullStorage(cid, storage, notsave)
	if not notsave then
		doPlayerSave(cid)
	end
	
	local id = getPlayerId(cid)
	Query = db.getResult("SELECT `value` FROM `player_storage` WHERE `player_id` = "..id.." AND `key` = "..storage..";")
	local Result = Query:getDataString("value")
	return Result
end

function getStorageByGUID(guid, storage)
	Query = db.getResult("SELECT `value` FROM `player_storage` WHERE `player_id` = "..guid.." AND `key` = "..storage..";")
	local Result = Query:getDataString("value")
	return Result
end

function doCutStorage(cid, storageKey, cutType) -- cutType [Ex: ","]
local cutSto = {}
	local allStorages = getFullStorage(cid, storageKey)
	local cutSto = allStorages:explode(cutType)

	if #cutSto > 0 then
		for i = 1, #cutSto do
			table.insert(cutSto, cutSto[i])
		end
		return cutSto
	else
		return true
	end
end

function doCutText(text, cutType) -- cutType [Ex: ","]
local cutTxt = {}
	local cutTxt = text:explode(cutType)

	if #cutTxt > 0 then
		for i = 1, #cutTxt do
			table.insert(cutTxt, cutTxt[i])
		end
		return cutTxt
	else
		return true
	end
end

function mathtime(table)
local unit = {"sec", "min", "hour", "day"}
	for i, v in pairs(unit) do
		if v == table[2] then
			return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
		end
	end
	
	return error("Erro em function: mathtime. Reveja seu script antes de function.")
end

function getPointsp(cid) 
local res = db.getResult('select `points` from znote_accounts where account_id = \''..getPlayerAccountId(cid)..'\'') 
if(res:getID() == -1) then 
return false 
end 

local ret = res:getDataInt("points") res:free() 
return tonumber(ret) 
end 

function doPlayerAddPointsp(cid, quant) 
return db.query("UPDATE `znote_accounts` SET `points` = '".. getPointsp(cid) + quant .."' WHERE `account_id` ='"..getPlayerAccountId(cid).."'") 
end 

function doPlayerRemovePointsp(cid, quant) 
return db.query("UPDATE `znote_accounts` SET `points` = '".. getPointsp(cid) - quant .."' WHERE `account_id` ='"..getPlayerAccountId(cid).."'") 
end


function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    	table.sort(a, f)
      	local i = 0      -- iterator variable
      	local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end