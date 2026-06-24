function onDeath(target, corpse, deathList) 
	if isPlayer(target) or getCreatureMaster(target) then
		return true
	end
	local killers = deathList
    local cid = #killers > 1 and killers[2] or killers[1]
    if not isPlayer(cid) then 
        return true
    end 

	local inTask = checkPlayerIsInTask(cid)
	if #inTask >= 1 then
		local task = _MONSTERS_TASK_SYSTEM_CONFIG
		getCName = getCreatureName(target):lower()
		check = checkAlreadyDoingThisTask(cid, getCName, inTask)
		if check then -- Return Monster Name if Can Do, or false if can't
			getTask = task[check]
			if getTask then
				if getTask.class == "premium" and not isPremium(cid) then
					return true
				end
				if getTask.inDay ~= false then
					b = getInfoPlayerTask(cid, check)
					data = tonumber(b[2])
					now = os.time()
					a = {sto = getTask.storage, killeds = getTask.countSto, total = getTask.count, timeToDo = getTask.inDay}
					getKills = getPlayerStorageValue(cid, a.killeds)



					-- Caso bugue a storage:
					if not isNumber(getKills) or getKills == nil then
						print('>>> >> > The '..getTask.mlist[1]..' task have some error with player '..getCreatureName(cid)..' and was FIXED Automatically, please check is out.')
						--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'The '..getTask.mlist[1]..' task have some error with player '..getCreatureName(cid)..' and wasn\'t FIXED, please contact to the Administrator.')						
						setPlayerStorageValue(cid, a.killeds, tonumber(getFullStorage(cid,a.killeds, true)))
						return true
					end

					-- Salvar o player a cada 100 kills
					if (getKills%100) == 0 then
						doPlayerSave(cid)
					end

					doneMsg = "Congratulations, you have killed "..a.total.." "..getTask.mlist[1]..", go to NPC of Task for get yours awards."
					closedMsg = "Sorry, but your "..getTask.mlist[1].." task was closed in "..os.date("%b %d, %Y at %X", data).."."
					if now < data then
						if getKills < a.total then
							setPlayerStorageValue(cid, a.killeds, (getKills+1))
							if (getKills+1) < a.total then
								if a.timeToDo then
									doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed " .. getPlayerStorageValue(cid, a.killeds) .. " of "..a.total.." "..getTask.mlist[1]..", you have untill "..os.date("%b %d, %Y at %X", data).." to complete this task.")
								else
									doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed " .. getPlayerStorageValue(cid, a.killeds) .. "/"..a.total.." "..getTask.mlist[1]..".")
								end
							else
								doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, doneMsg)
							end
						else
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, doneMsg)
						end
					else
						doCloseTimedTask(cid, getCName)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, closedMsg)
						return true
					end
				else
					a = {sto = getTask.storage, killeds = getTask.countSto, total = getTask.count}
					getKills = getPlayerStorageValue(cid, a.killeds)

						-------- Caso bugue a storage: ----
						if not isNumber(getKills) or getKills == nil then
							print('>>> >> > The '..getTask.mlist[1]..' task have some error with player '..getCreatureName(cid)..' and was FIXED Automatically by Swatt Script, please check is out.')
							--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'The '..getTask.mlist[1]..' task have some error with player '..getCreatureName(cid)..' and wasn\'t FIXED Automatically, please contact to the Administrator.')
							setPlayerStorageValue(cid, a.killeds, tonumber(getFullStorage(cid,a.killeds, true)))
							return true
						end

					-- Salvar o player a cada 100 kills
					if (getKills%100) == 0 then
						doPlayerSave(cid)
					end

					doneMsg = "Congratulations, you have killed "..a.total.." "..getTask.mlist[1]..", go to NPC of Task for get yours awards."
					if getKills < a.total then
						setPlayerStorageValue(cid, a.killeds, (getKills+1))
						if (getKills+1) < a.total then
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have killed " .. getPlayerStorageValue(cid, a.killeds) .. "/"..a.total.." "..getTask.mlist[1]..".")
						else
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, doneMsg)
						end
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, doneMsg)
					end
				end
			end
		end
	end
return TRUE
end