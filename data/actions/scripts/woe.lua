dofile("./_woe.lua")

local timelever = {5, "min"} -- tempo da LEVER
local leverpos = {x = 3844, y = 2576, z = 7}

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

local function convertTime(a)
  if(type(tonumber(a)) == "number" and a > 0) then
    if (a <= 3599) then
      local minute = math.floor(a/60)
      local second = a - (60 * minute)
      if(second == 0) then
        return ((minute)..((minute > 1) and " minutos" or " minuto"))
      else
        return ((minute ~= 0) and ((minute>1) and minute.." minutos e " or minute.." minuto e ").. ((second>1) and second.." segundos" or second.." segundo") or ((second>1) and second.." segundos" or second.. " segundo"))
      end
    else
      local hour = math.floor(a/3600)
      local minute = math.floor((a - (hour * 3600))/60)
      local second = (a - (3600 * hour) - (minute * 60))
      if (minute == 0 and second > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(second..((second > 1) and " segundos" or " segundo"))
      elseif (second == 0 and minute > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(minute..((minute > 1) and " minutos" or " minuto"))
      elseif (second == 0 and minute == 0) then
        return (hour..((hour > 1) and " horas" or " hora"))
      end
      return (hour..((hour > 1) and " horas, " or " hora, "))..(minute..((minute > 1) and " minutos e " or " minuto e "))..(second..((second > 1) and " segundos" or " segundo"))
    end
  end
end

local function changeBack(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	Woe.getInfo()
	local config = woe_config
	if (item.uid == 45448) and (item.itemid == 1945) then
		if not Woe.isStarted() or (infoLua[2] ~= getPlayerGuildId(cid)) or (getPlayerGuildLevel(cid) ~= GUILDLEVEL_LEADER) then
			return true
		end
		if (getPlayerMoney(cid) < 1000000) then
			return doPlayerSendCancel(cid, "Not enough money.")
		end
		if Woe.check() then
		--	Woe.summon()
			if doPlayerRemoveMoney(cid, 1000000) then
				doRemoveMonstersInArea({x=3828,y=2619,z=8}, {x=3828,y=2619,z=8})
				doRemoveMonstersInArea({x=3865,y=2593,z=8}, {x=3865,y=2593,z=8})
				doRemoveMonstersInArea({x=3808,y=2591,z=7}, {x=3808,y=2591,z=7})
				doRemoveMonstersInArea({x=3817,y=2579,z=6}, {x=3817,y=2579,z=6})
				doCreateMonster("Antirush", {x=3828,y=2619,z=8}, false, true);
				doCreateMonster("Antirush", {x=3865,y=2593,z=8}, false, true);
				doCreateMonster("Antirush", {x=3808,y=2591,z=7}, false, true);
				doCreateMonster("Antirush", {x=3817,y=2579,z=6}, false, true);
				doBroadcastMessage("[War Castle] A guild dominante do castelo pagou 1kk para atrasar os jogadores! Os wild growths nasceram novamente.", config.bcType)
				doTransformItem(item.uid, item.itemid + 1)
				addEvent(changeBack, mathtime(timelever) * 1000, leverpos)
				setGlobalStorageValue(cid, 45448, os.time()+5*60)
			else
				doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
			end
		end
		
	elseif (item.uid == 45448) and (item.itemid == 1946) then
		doCreatureSay(cid, "Para usar novamente a alavanca, aguarde ".. convertTime(getGlobalStorageValue(cid, 45448) - os.time()) ..".", TALKTYPE_ORANGE_1, false, 0, {x=3844, y=2576, z=7})
	end
	return true
end