local pos = {x = 557, y = 433, z = 9}

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
		if getPlayerItemCount(cid, 2165) >= 1 or getPlayerItemCount(cid, 2202) >= 1 then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não pode entrar com stealth ring. Guarde seu ring de invisibilidade para poder entrar.")
		else
			if getPlayerStorageValue(cid, 45358) - os.time() > 0 then
				if getCreatureCondition(cid, CONDITION_INVISIBLE) == true then
					doRemoveCondition(cid, CONDITION_INVISIBLE)
				end
				
				doTeleportThing(cid, pos, true)
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				doPlayerPopupFYI(cid, "                                                             [+] Daily Quest [+]\n                                     # Quests Diárias Pharaot #\n\n- TUTORIAL -\nLogo abaixo você verá uma alavanca que o levará a Daily Quest\nVocê pode ultilizar a alavanca com amigos dentro do quadrado, a união faz a força.\nApós à 10º WAVE, todos da sala vão ser teleportados para sala de recompensa.\n\n- INFO -\nVocê só poderá fazer a Daily à cada 20hrs.\nVocê pode fazer a Daily SOLO ou em GRUPO.\nNa Daily, não pode atacar outros jogadores.\n\nLogo acima você encontrará o EVENTO DOTA.Logo acima você encontrará o EVENTO DOTA.\n\n  Daily disponível em: ".. convertTime(getPlayerStorageValue(cid, 45358) - os.time()) ..".")
			else
				if getCreatureCondition(cid, CONDITION_INVISIBLE) == true then
					doRemoveCondition(cid, CONDITION_INVISIBLE)
				end
				
				doTeleportThing(cid, pos, true)
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				doPlayerPopupFYI(cid, "                                                             [+] Daily Quest [+]\n                                     # Quests Diárias Pharaot #\n\n- TUTORIAL -\nLogo abaixo você verá uma alavanca que o levará a Daily Quest\nVocê pode ultilizar a alavanca com amigos dentro do quadrado, a união faz a força.\nApós à 10º WAVE, todos da sala vão ser teleportados para sala de recompensa.\n\n- INFO -\nVocê só poderá fazer a Daily à cada 20hrs.\nVocê pode fazer a Daily SOLO ou em GRUPO.\nNa Daily, não pode atacar outros jogadores.\nSe morrer, poderá fazer novamente.\nSe morrer, perde items/exp/skills normalmente.\Logo acima você encontrará o EVENTO DOTA.\n\n  Daily já está disponível.")
			end
		end
	end
	return true
end

function onAddItem(moveitem, tileitem, position)
	doRemoveItem(moveitem.uid, moveitem.type > 0 and moveitem.type or 1)
	return true
end