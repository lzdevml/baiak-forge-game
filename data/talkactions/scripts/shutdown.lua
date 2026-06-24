shutdownEvent = 0

function onSay(cid, words, param, channel)
	if(param == '') then
		doSetGameState(GAMESTATE_SHUTDOWN)
		return true
	end

	params = string.explode(param, ",")
	local action, reason, mins  = "", "", 0
	if(not tonumber(params[1])) then
		action = string.trim(params[1]:lower())
	else
		mins = string.trim(params[1])
		if(table.maxn(params) > 1) then
			reason = params[2]
		end
	end

	if(action) then
		if(action == "cancel" or action == "stop") then
			if(shutdownEvent ~= 0) then
				stopEvent(shutdownEvent)
				shutdownEvent = 0
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Desligamento cancelado.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "O servidor não esta na fase de desligamento.")
			end
			return true
		elseif(action == "kill") then
			os.exit()
			return true
		end
	end

	mins = tonumber(mins)
	if(not mins or mins < 0) then
		doPlayerSendCancel(cid, "Par numerico não pode ser menor que 0.")
		return true
	end

	if(shutdownEvent ~= 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "O servidor ja esta em um estado de desligamento. Para cancelar o desligamento, use o \"/shutdown stop\" command.")
		return true
	end

	return prepareShutdown(math.abs(math.ceil(mins)), reason)
end

function prepareShutdown(minutes, reason)
	if(minutes <= 0) then
		doSetGameState(GAMESTATE_SHUTDOWN)
		return false
	end

	local change, r = 5, (reason ~= "" and " Reason: "..reason or "")
	if(minutes == 1) then
		doBroadcastMessage("Servidor está indo para baixo em " .. minutos .. " minutos, por favor saia agora!" .. r)
	elseif(minutes <= 5) then
		doBroadcastMessage("Servidor ira reiniciar em " .. minutos .. " minutos, por favor aguarde." .. r)
		change = 1
	else
		doBroadcastMessage("Server is going down in " .. minutes .. " minutes." .. r)
	end

	shutdownEvent = addEvent(prepareShutdown, (change * 60 * 1000), minutes - change, reason)
	return true
end
