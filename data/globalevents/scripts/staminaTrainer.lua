function onThink(interval, lastExecution)
	for _, pid in next, getPlayersOnline() do
		local thingPos = getThingPos(pid)
		if isInRange(thingPos, {x = 3021, y = 1370, z = 7}, {x = 3091, y = 1466, z = 7}) or isInRange(thingPos, {x = 1015, y = 1020, z = 7}, {x = 1037, y = 1043, z = 6}) then
			if getCreatureCondition(pid, CONDITION_INFIGHT) == true then
				if getPlayerStamina(pid) < 2520 then
					doPlayerAddStamina(pid, 1)
					doSendMagicEffect(thingPos, CONST_ME_YELLOW_RINGS)
					doPlayerSendTextMessage(pid, MESSAGE_EVENT_ADVANCE, "[STAMINA] Você recebeu 1 minuto de stamina. Continue treinando!")
			 end
			end
		end		
	end
	return true
end
