local leverpos = {x = 975, y = 2508, z = 9}
local tp_pos = {x = 946, y = 2475, z = 8, stackpos=1}
local timelever = {5, "min"} -- tempo da LEVER

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

local function countTextRed(cid, pos, tempo)
	if tempo > 0 then
		doSendAnimatedText(pos, tempo, TEXTCOLOR_RED)
		doSendMagicEffect(pos, CONST_ME_MAGIC_RED)
		addEvent(countTextRed, 1000, cid, pos, tempo-1)
	else
		doSendMagicEffect(pos, 2)
	end
end

local function countTutorialArrow(cid, pos, tempo)
	if tempo > 0 then
		doSendMagicEffect(pos, CONST_ME_TUTORIALARROW)
		addEvent(countTutorialArrow, 10000, cid, pos, tempo-10)
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

local function changeBack(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)

    if (item.itemid == 1945) then
		countTextRed(cid, tp_pos, 300)
		countTutorialArrow(cid, tp_pos, 300)
		doTransformItem(item.uid, item.itemid + 1)
		setGlobalStorageValue(cid, 30079, os.time()+5*60)
		addEvent(changeBack, mathtime(timelever) * 1000, leverpos)

    elseif (item.itemid == 1946) then
		doCreatureSay(cid, "Aguarde ".. convertTime(getGlobalStorageValue(cid, 30079) - os.time()) .." para usar a alavanca novamente.", TALKTYPE_ORANGE_1, false, 0, leverpos)
    end
    return true
end