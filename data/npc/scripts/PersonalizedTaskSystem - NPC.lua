local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local taskList = _MONSTERS_TASK_SYSTEM_CONFIG
local libcfg = _SETTING_TASK_SYSTEM_CONFIG

function greetCallback(cid)
	Npchouse = getHouseFromPos(getThingPosition(getNpcId()))
	if Npchouse and not getHouseFromPos(getThingPosition(cid)) then
		npcHandler:unGreet(cid, true, true)
		return false
	end
	
	msg = 'Hello '.. getPlayerName(cid) .. '. Say {task}, {consult}, {cancel} or {help} to know more about that or {done} to receive your award!'
	npcHandler:setMessage(MESSAGE_GREET, msg)
	talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	talkState[talkUser] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
	return false
	end

	--- [[  MENSAGENS PRIMÁRIAS  ]] ---
	if (msgcontains(msg, 'task') or msgcontains(msg, 'tasks')) then
		local str = ''
		local strSpecial = ''
		tabClass = {}
        for index, result in pairsByKeys(taskList) do
			if not isInArray(tabClass, result.class) then
				table.insert(tabClass, result.class)
				if result.class ~= 'special' and result.class ~= 'addons' and result.class ~= 'timed' then
					if str == '' then
						str = str.."{"..result.class.."}"
					else
						str = str.." ou {"..result.class.."}"
					end
				end
			end
        end
		selfSay('The tasks are divided by categories, we have: '..str..'. We also have {addons} and {special} tasks.', cid)
		talkState[talkUser] = 15
		
	elseif talkState[talkUser] == 15 then
		m = msg:lower()
		if isInArray(tabClass, m) then
			tabMonster = {}
			local str = ''
			for index, result in pairs(taskList) do
				if result.class == m then
					table.insert(tabMonster, index)
					if str == '' then
						str = str.."{"..index.."}"
					else
						str = str.." | {"..index.."}"
					end
				end
			end
			selfSay('Currently for {'..msg: lower () ..'} we have the following monsters: '..str ..', which one do you want?', cid)
			talkState[talkUser] = 1
		else
			selfSay('Sorry, I didn\'t find the category you said, say one of the above.', cid)
			talkState[talkUser] = 15
		end
	
	--- [[ CONSULTANDO RECOMPENSAS ]] ---
	elseif (msgcontains(msg, 'award') or msgcontains(msg, 'help') or msgcontains(msg, 'reward')) then
		selfSay('Tell me a monster name to know the awards.', cid)
		talkState[talkUser] = 10
	
	--- [[ LISTANDO TASKS ]] ---
	elseif (msgcontains(msg, 'consult') or msgcontains(msg, 'check')) then
		str = ""
		get = checkPlayerIsInTask(cid)
		if #get > 0 then
			if str == "" then str = "Your Active Task List:" end
			for a = 1, #get do
				task = taskList[get[a]]
				tinfo = getInfoPlayerTask(cid, get[a])
				if not task.inDay then
					str = ""..str.."\n » ["..task.mlist[1]:upper().."] \n Killeds: "..milharFormat(getPlayerStorageValue(cid, task.countSto)).."/"..milharFormat(task.count).." » Repeateds: "..tinfo[1].."/"..task.repeated..".\n Expiration Date: Never.\n"
				else
					str = ""..str.."\n » ["..task.mlist[1]:upper().."] \n Killeds: "..milharFormat(getPlayerStorageValue(cid, task.countSto)).."/"..milharFormat(task.count).." » Repeateds: "..tinfo[1].."/"..task.repeated..".\n Expiration Date: "..os.date("%b %d, %Y at %X", tinfo[2])..".\n"
				end
			end
		else
			str = "You don't have any task active right now."
		end
		rept = checkPlayerRepetationTask(cid)
		if #rept > 0 then
			str = ""..str.."\nTask Already Done:"
			for a = 1, #rept do
				task = taskList[rept[a]]
				tinfo = getInfoPlayerTask(cid, rept[a])
				str = ""..str.."\n » ["..task.mlist[1]:upper().."] » Repeateds: "..tinfo[1].."/"..task.repeated.."."
			end
		end
		doShowTextDialog(cid, 10103, str)
		selfSay('Can I help you with anything else?', cid)
		talkState[talkUser] = 0
	
	--- [[ CANCELANDO TASK ]] ---
	elseif (msgcontains(msg, 'cancel') or msgcontains(msg, 'canceling')) then
		getTask = checkPlayerIsInTask(cid)
		if #getTask > 0 then
			acTasks = doGiveTaskMonsterList(cid, getTask) -- Retorna Lista de Tasks Ativas como Texto
			selfSay('This is your active task list: ['..acTasks..']. What task you wanna cancel?', cid)
			talkState[talkUser] = 12
		else
			selfSay('You aren\'t in any task.', cid)
			talkState[talkUser] = 0
		end
	
	--- [[ CONCLUINDO TASKS ]] ---
	elseif (msgcontains(msg, 'done') or msgcontains(msg, 'completed') or msgcontains(msg, 'report')) then
		doneTask = doPlayerDonePersoTask(cid)
		if doneTask then
			confer = taskList[doneTask]
			if confer then
				killeds = tonumber(getPlayerStorageValue(cid, confer.countSto))
				if killeds >= tonumber(confer.count) then
					--[[ Givin' The Awards ]]--
					doGiveTaskAwards(cid, confer.awards)
					--[[ Resetin' Values ]]--
					inativo = 0
					getInfo = getInfoPlayerTask(cid, doneTask)
					repet = getInfo[1] + 1
					newValue = "&"..inativo.."/"..repet.."/0"
					-- Adicionar tempo pra repetir 
					if confer.waitDaysToRepeat then
						waitTime = 86400*confer.waitDaysToRepeat
						newValue = "&"..inativo.."/"..repet.."/" .. os.time()+waitTime
					end
					setPlayerStorageValue(cid, confer.storage, newValue)
					setPlayerStorageValue(cid, confer.countSto, 0)
					--[[ Sendin' Message ]]--
					getAwardList = getAwardsList(cid, confer.awards)
					selfSay('Congratulations, you have done the {'..doneTask..' task} and received: '..getAwardList..'.', cid)
					talkState[talkUser] = 0
				else
					selfSay('Sorry, you have killed '..milharFormat(killeds)..' of '..milharFormat(confer.count)..' '..doneTask..', go kill more '..milharFormat(confer.count-killeds)..'.', cid)
					talkState[talkUser] = 0
				end
			else
				selfSay('Sorry, but some error occurred with your task, contact to administrator.', cid)
				talkState[talkUser] = 0
			end
		else
			selfSay('You don\'t have done any task.', cid)
			talkState[talkUser] = 0
		end

	--- [[  NEGOCIAÇÃO & CONFIRMAÇÃO  ]] ---
	elseif talkState[talkUser] == 1 then
		getMonster = taskList[msg:lower()]
		if getMonster then
			if getMonster.class == "premium" and not isPremium(cid) then
				selfSay('Excuse me but this task is for Players with Premium Account only.', cid)
				talkState[talkUser] = 0
				return true
			end
			mMonster = msg:lower()
			mCount = getMonster.count
			mPrice = getMonster.price
			mSto = getMonster.storage
			mCountSto = getMonster.countSto
			repetMax = getMonster.repeated
			getAwardList = getAwardsList(cid, getMonster.awards)
			getInfo = getInfoPlayerTask(cid, mMonster)
			waitDaysToRepeat = 0
			if not getInfo or getInfo[2] < os.time() then
				finalDate = 0
			else
				finalDate = getInfo[2]
			end

			if tonumber(finalDate) > os.time() then
				if getMonster.waitDaysToRepeat then
					waitDaysToRepeat = getMonster.waitDaysToRepeat
				end
				selfSay('You have to wait {' .. waitDaysToRepeat .. '} day(s) to start this task again. Until {'..os.date("%b %d, %Y at %X", finalDate)..'} (Use command {!time} to get current time)', cid)
				return true
			end

			if getMonster.inDay then -- Task com Tempo
				selfSay('Alright, in this task you have to kill {'..milharFormat(mCount)..'} '..mMonster..' in {'..getMonster.inDay..' day(s)}, your award is '..getAwardList..' and will {cost '..milharFormat(mPrice)..' gold coins}, do you wanna try?', cid)
			else
				selfSay('Alright, in this task you have to kill {'..milharFormat(mCount)..' '..mMonster..'}, your award is '..getAwardList..' and will {cost '..milharFormat(mPrice)..' gold coins}, do you wanna try?', cid)
			end
			talkState[talkUser] = 2
		else
			selfSay('I\'m sorry, this monster isn\'t in my task system.', cid)
			talkState[talkUser] = 1
		end
		
	elseif talkState[talkUser] == 2 then
		if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
			checkTask = checkPlayerIsInTask(cid) -- Retorna Lista de Tasks Ativas
			acTasks = doGiveTaskMonsterList(cid, checkTask) -- Retorna Lista de Tasks Ativas como Texto
			if #checkTask < libcfg.taskAtSameTime then
				getInfo = getInfoPlayerTask(cid, mMonster)
				if not getInfo or getInfo[1] < repetMax then
					getDoingTask = checkAlreadyDoingThisTask(cid, mMonster, checkTask)
					if not getDoingTask then
						if #checkTask > 0 then
							selfSay('Okay, actually you have '..acTasks..' task actives ['..#checkTask..'/'..libcfg.taskAtSameTime..']. Do you wanna active the {'..mMonster..' task} payin\' {'..milharFormat(mPrice)..' gold coins}?', cid)
						else
							selfSay('Okay, do you wanna continue with the task and payin\' '..milharFormat(mPrice)..' gold coins?', cid)
						end
						talkState[talkUser] = 3
					else
						selfSay('Sorry, but the {'..mMonster..'} task already is active.', cid)
						talkState[talkUser] = 0
					end
				else
					selfSay('Sorry, but you have done {'..mMonster..'} task for '..getInfo[1]..' times.', cid)
					talkState[talkUser] = 0
				end
			else
				selfSay('Sorry, but you have '..acTasks..' task(s) actives, the limit of task actives at same time is '..libcfg.taskAtSameTime..', you can {cancel} or go done it.', cid)
				talkState[talkUser] = 0
			end
		elseif (msgcontains(msg, 'not') or msgcontains(msg, 'no')) then
			selfSay('Okay, see u later.', cid)
			talkState[talkUser] = 0
		else
			selfSay('Can I help you? Say {task} again if I do.', cid)
			talkState[talkUser] = 0
		end
	
	elseif talkState[talkUser] == 3 then
		if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
			local cost = mPrice
			if getPlayerMoney(cid) >= cost or getPlayerBalance(cid) >= cost then
            if not doPlayerRemoveMoney(cid, cost) then
                doPlayerSetBalance(cid, getPlayerBalance(cid) - cost)
                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, milharFormat(cost) .. " gold coins have been debited from your bank account.\n(Balance: " .. milharFormat(getPlayerBalance(cid)) .. ")")   
                end
				ativo = 1
				if not getInfo then
					repet = 0
					finalDate = 0
				else
					repet = getInfo[1]
					finalDate = getInfo[2]
				end
				if not getMonster.inDay then
					newValue = "&"..ativo.."/"..repet.."/0"
					selfSay('Congratulations, you have started the {'..mMonster..'} task, go kill {'..milharFormat(mCount)..'} and come back.', cid)
				else
					finalDate = (os.time() + (86400 * getMonster.inDay))
					newValue = "&"..ativo.."/"..repet.."/"..finalDate..""
					selfSay('Congratulations, you have started the {'..mMonster..'} task, go kill {'..milharFormat(mCount)..'} untill {'..os.date("%b %d, %Y at %X", finalDate)..'} and come back. (Use command {!time} to get current time)', cid)
				end
				setPlayerStorageValue(cid, mSto, newValue)
				setPlayerStorageValue(cid, mCountSto, 0)
				talkState[talkUser] = 0
			else
				selfSay('Sorry, but you don\'t have money enough.', cid)
				talkState[talkUser] = 0
			end
		else
			selfSay('Okay, see u later.', cid)
			talkState[talkUser] = 0
		end

	--- [[  INFORMAÇÕES DE TASKS  ]] ---
	elseif talkState[talkUser] == 10 then
		getMonster = taskList[msg:lower()]
		if getMonster then
			getAwardList = getAwardsList(cid, getMonster.awards)
			if getMonster.inDay then
				selfSay('Alright, killing {'..milharFormat(getMonster.count)..' '..msg:lower()..'s in '..getMonster.inDay..' day(s)} payin\' {'..milharFormat(getMonster.price)..' gold coins} give you the follow awards: '..getAwardList..'.', cid)
			else
				selfSay('Alright, killing {'..milharFormat(getMonster.count)..' '..msg:lower()..'s} payin\' {'..milharFormat(getMonster.price)..' gold coins} give you the follow awards: '..getAwardList..'.', cid)
			end
			talkState[talkUser] = 0
		else
			selfSay('I\'m sorry, this monster isn\'t in my task system.', cid)
			talkState[talkUser] = 10
		end
		
	--- [[  CANCELANDO TASKS  ]] ---
	elseif talkState[talkUser] == 12 then
		monst = msg:lower()
		saying = taskList[monst]
		if saying then
			checkTask = checkPlayerIsInTask(cid) -- Retorna Lista de Tasks Ativas
			checking = checkAlreadyDoingThisTask(cid, monst, checkTask) -- Confere Task Ativa // False Se Não Estiver na Lista
			if checking then
				selfSay('You are sure that you wanna cancel the {'..monst..' task}?', cid)
				talkState[talkUser] = 13
			else
				selfSay('I\'m sorry, you don\'t have this task active right now.', cid)
				talkState[talkUser] = 0
			end			
		else
			selfSay('I\'m sorry, this monster isn\'t in my task system.', cid)
			talkState[talkUser] = 12
		end	
	
	--- [[  CANCELANDO TASKS  ]] ---
	elseif talkState[talkUser] == 13 then
		if (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) then
			inf = getInfoPlayerTask(cid, monst)
			doCloseTimedTask(cid, monst)
			selfSay('Ok, your {'..monst..' task} has been cancelled succesfully.', cid)
			talkState[talkUser] = 0			
		else
			selfSay('Ok, I see you later.', cid)
			talkState[talkUser] = 0
		end
		
	end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_GREET, greetCallback)