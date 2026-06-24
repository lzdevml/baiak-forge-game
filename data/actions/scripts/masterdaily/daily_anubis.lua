local exit_Anubis2 = {x = 160, y = 51, z = 7}
local reward2 = {
	[0] = {id = 12468, amount = 5, chance = 100}, -- Stamina Refiller
}

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

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (item.actionid == 57919) then
		if getPlayerFreeCap(cid) < 105.00 then
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você precisa ter mais que '105.00 oz' para abrir o baú, por segurança.")
		end
		
		if getPlayerStorageValue(cid, 42014) - os.time() >= 0 then
			doTeleportThing(cid, exit_Anubis2)
			doSendMagicEffect(getCreaturePosition(cid), 12)
			return doPlayerSendTextMessage(cid, 27, "Seu tempo para a Anubis Quest ainda não expirou! Você não deveria estar nesta SALA!!")
		end
		
		local rand = math.random(1,100)
		for i = 0, #reward2 do
			if (reward2[i].chance > rand) then
				if doPlayerAddItem(cid, reward2[i].id, reward2[i].amount) then
					doTeleportThing(cid, exit_Anubis2)
					doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
					setPlayerStorageValue(cid, 42014, os.time()+20*60*60)
					return doPlayerSendTextMessage(cid, 27, "Você finalizou a Anubis Quest e recebeu um item. Poderá fazer a Anubis novamente em: ".. convertTime(getPlayerStorageValue(cid, 42014) - os.time()) ..".")
				else
					return doPlayerPopupFYI(cid, "                                  [+] Anubis Quest [+]\n\nVocê está sem espaço em sua backpack. Libere espaço.\nSe continuar clicando poderá perder sua Anubis!")
				end
			end
		end
	end
    return true
end