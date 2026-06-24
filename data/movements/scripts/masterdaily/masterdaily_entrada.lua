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

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end
	
    if isPlayer(cid) then
		if getPlayerLevel(cid) >= 170 then
			if getPlayerStorageValue(cid, 42013) - os.time() < 0 then
				return false
			else
				doPlayerSendTextMessage(cid, 27, "Seu tempo para Daily ainda não expirou! Aguarde ".. convertTime(getPlayerStorageValue(cid, 42013) - os.time()) .." para acessar essa área.")
				doTeleportThing(cid, fromPosition, true)
				doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
			end
		else
			doPlayerSendTextMessage(cid, 27, "Você precisa ser level 170 ou superior para fazer a Daily Quest!")
			doTeleportThing(cid, fromPosition, true)
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
		end
	end
    return true
end