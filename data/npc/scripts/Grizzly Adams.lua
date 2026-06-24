local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end
 
local choose = {}
local cancel = {}
local available = {}

local grizzlyAdamsConfig = {
							ranks = {
									huntsMan_rank = {
													{id=11208, buy=0, sell=50, name='antlers'},
													{id=10549, buy=0, sell=100, name='bloody pincers'},
													{id=11183, buy=0, sell=35, name='crab pincers'},
													{id=10573, buy=0, sell=55, name='cyclops toe'},
													{id=10564, buy=0, sell=30, name='frosty ear of a troll'},
													{id=11193, buy=0, sell=600, name='hydra head'},
													{id=11366, buy=0, sell=80, name='lancer beetle shell'},
													{id=10578, buy=0, sell=420, name='mutated bat ear'},
													{id=11222, buy=0, sell=400, name='sabretooth'},
													{id=11367, buy=0, sell=20, name='sandcrawler shell'},
													{id=10547, buy=0, sell=280, name='scarab pincers'},
													{id=11365, buy=0, sell=60, name='terramite legs'},
													{id=11363, buy=0, sell=170, name='terramite shell'},
													{id=11184, buy=0, sell=30000, name='terrorbird beak'},
													
													{id=7398, buy=0, sell=500, name='cyclops trophy'},
													{id=11315, buy=0, sell=15000, name='draken trophy'},
													{id=11330, buy=0, sell=8000, name='lizard trophy'},
													{id=7401, buy=0, sell=500, name='minotaur trophy'}
													},

									bigGameHunter_rank = {
													{id=7397, buy=0, sell=3000, name='deer trophy'},
													{id=7400, buy=0, sell=3000, name='lion trophy'},
													{id=7394, buy=0, sell=3000, name='wolf trophy'}
													},

									trophyHunter_rank = {
													{id=7393, buy=0, sell=40000, name='demon trophy'},
													{id=7396, buy=0, sell=20000, name='behemoth trophy'},
													{id=7399, buy=0, sell=10000, name='dragon lord trophy'},
													
													{id=10518, buy=1000, sell=0, name='demon backpack'},
													},
							        }
							}

local Topic = {}
function greetCallback(cid)
	Topic[cid] = 0
	return true
end

local function setNewTradeTable(table)
local items = {}
for _, v in ipairs(table) do
	items[v.id] = {itemId = v.id, buyPrice = v.buy, sellPrice = v.sell, subType = 0, realName = v.name}
end
return items
end

local function setNewLineTable(oldTable, newTable)
for k, v in pairs(oldTable) do
	table.insert(newTable, k, v)
end
return true
end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
if (msgcontains(msg, "hi") or msgcontains(msg, "hello")) and (not npcHandler:isFocused(cid)) then
if (getPlayerStorageValue(cid, 100157) == -1) then
        npcHandler:say("Welcome "..getCreatureName(cid)..". Gostaria de se juntar ao 'Paw and Fur - Hunting Elite' ou dizer {trade} para comprar resistência?", cid)
		npcHandler:addFocus(cid)
		talkState[talkUser] = 5
  else
        npcHandler:say("Bem-vindo de volta, meu velho. O que o traz aqui desta vez?", cid)
        npcHandler:addFocus(cid)
        talkState[talkUser] = 0
		end
		return true
	end
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, "Adeus") or msgcontains(msg, "Volte Sempre") then
		selfSay("Boa caçada, meu velho!", cid, TRUE)
		Topic[talkUser] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	
	if (isInArray({"yes", "join"}, msg:lower()) and talkState[talkUser] == 5) then 
	    setPlayerStorageValue(cid, 100157, 1)
	    npcHandler:say("Ótimo! Boas-vindas ao nosso mais novo membro: "..getCreatureName(cid).."! Peça-me uma {task} se quiser sair para uma caçada.", cid)
	    talkState[talkUser] = 0
   elseif (msg:lower() == "no" and talkState[talkUser] == 5) then
        npcHandler:say("No problem old chap. Come back if you change your mind.", cid)  
   end

if (getPlayerStorageValue(cid, 100157) == -1) then
	npcHandler:say("Você terá que {join} se juntar a nós para obter mais informações.",cid)
	return false
end
if isInArray({"offer", "trade"}, msg:lower()) then
if getPlayerRank(cid) >= 2 then 
		if getPlayerRank(cid) == 2 or getPlayerRank(cid) == 3 then
			tradeRank = grizzlyAdamsConfig.ranks.huntsMan_rank
		elseif getPlayerRank(cid) == 4 then
			tradeRank = grizzlyAdamsConfig.ranks.bigGameHunter_rank
			setNewLineTable(grizzlyAdamsConfig.ranks.huntsMan_rank, grizzlyAdamsConfig.ranks.bigGameHunter_rank)
		elseif getPlayerRank(cid) == 5 or getPlayerRank(cid) == 6 then
			tradeRank = grizzlyAdamsConfig.ranks.trophyHunter_rank
			setNewLineTable(grizzlyAdamsConfig.ranks.huntsMan_rank, grizzlyAdamsConfig.ranks.bigGameHunter_rank)
			setNewLineTable(grizzlyAdamsConfig.ranks.huntsMan_rank, grizzlyAdamsConfig.ranks.trophyHunter_rank)
		end
		local items = setNewTradeTable(tradeRank)
			local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if ignoreCap == false and (getPlayerFreeCap(cid) < getItemWeightById(items[item].itemId, amount) or inBackpacks and getPlayerFreeCap(cid) < (getItemWeightById(items[item].itemId, amount) + getItemWeightById(1988, 1))) then
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Você não tem cap suficiente.')
			end
			if items[item].buyPrice then
				doPlayerRemoveMoney(cid, amount * items[item].buyPrice)
				for i = 1, amount do
					if inBackpacks then
						local backpack = doCreateItemEx(1988, 1)
						doAddContainerItem(backpack, items[item].itemId, amount)
					else
						doPlayerAddItem(cid, items[item].itemId, amount, true)
					end
				end
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
			end
			return true
			end
			 
			local function onSell(cid, item, subType, amount, ignoreCap, inBackpacks)
			if items[item].sellPrice then
				doPlayerAddMoney(cid, items[item].sellPrice * amount)
				doPlayerRemoveItem(cid, items[item].itemId, amount)
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
			end
		openShopWindow(cid, tradeRank, onBuy, onSell)
		return selfSay('It\'s my offer.', cid)
	else
		return selfSay('You don\'t have any rank.', cid)
		end
end
 
	if isInArray({"tasks", "task", "mission"}, msg:lower()) then
		local can = getTasksByPlayer(cid)
		if (getPlayerStorageValue(cid, 100157) == -1) then
 	        return (npcHandler:say("Você terá que {join}, para obter qualquer {task}",cid))
        end
		if #can > 0 then
			local text = ""
			local sep = ", "
			table.sort(can, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(can) do
				t = t + 1
				if t == #can - 1 then
					sep = " and "
				elseif t == #can then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
			selfSay("Atualmente, as tasks: " .. (#can > 1 and "" or "") .. " que você pode escolher " .. (#can > 1 and "são:" or "é:") .. " " .. text, cid)
			talkState[talkUser] = 0
		else
			selfSay("Eu não tenho nenhuma tarefa para você agora.", cid)
		end
	elseif (msg:lower() == "report" or msg:lower() == "status") then
		local started = getPlayerStartedTasks(cid)
		local finishedAtLeastOne = false
		local finished = 0
		local result = ''
		if started and #started > 0 then
			for _, id in ipairs(started) do
				if getCreatureStorage(cid, KILLSSTORAGE_BASE + id) >= tasks[id].killsRequired then
					for _, reward in ipairs(tasks[id].rewards) do
						local deny = false
						if reward.storage then
							if getCreatureStorage(cid, reward.storage[1]) >= reward.storage[2] then
								deny = true
							end
						end
						if isInArray({REWARD_MONEY, "money"}, reward.type:lower()) and not deny then
							local amountValue = reward.value[1]
							doPlayerAddMoney(cid, amountValue)
							result = string.format('%s %s gold,', result, comma_value(amountValue))
						elseif isInArray({REWARD_EXP, "exp", "experience"}, reward.type:lower()) and not deny then
							local addExp = reward.value[1]
							doPlayerAddExperience(cid, addExp)
							result = string.format('%s %s exp,', result, comma_value(addExp))
						elseif isInArray({REWARD_ACHIEVEMENT, "achievement", "ach"}, reward.type:lower()) and not deny then
							if doPlayerAddAchievement then
								doPlayerAddAchievement(cid, reward.value[1], true)
							end
						elseif isInArray({REWARD_STORAGE, "storage", "stor"}, reward.type:lower()) and not deny then
							doCreatureSetStorage(cid, reward.value[1], reward.value[2])
						elseif isInArray({REWARD_POINT, "points", "point"}, reward.type:lower()) and not deny then
							doCreatureSetStorage(cid, POINTSSTORAGE, getCreatureStorage(cid, POINTSSTORAGE) + reward.value[1])
						elseif isInArray({REWARD_ITEM, "item", "items", "object"}, reward.type:lower()) and not deny then
							local itemId = reward.value[1]
							local itemCount = reward.value[2]
							doPlayerAddItem(cid, itemId, itemCount)
							result = string.format('%s %dx %s,', result, itemCount, getItemNameById(itemId))
						end
 
						if reward.storage then
							doCreatureSetStorage(cid, reward.storage[1], reward.storage[2])
						end
					end

					if tasks[id].norepeatable then
						doCreatureSetStorage(cid, QUESTSTORAGE_BASE + id, 2)
					else
						doCreatureSetStorage(cid, QUESTSTORAGE_BASE + id, 0)
					end
					doCreatureSetStorage(cid, KILLSSTORAGE_BASE + id, 0)
					if getCreatureStorage(cid, REPEATSTORAGE_BASE + id) < 1 then
						doCreatureSetStorage(cid, REPEATSTORAGE_BASE + id, 0)
					end
					doCreatureSetStorage(cid, REPEATSTORAGE_BASE + id, getCreatureStorage(cid, REPEATSTORAGE_BASE + id) + 1)
					finishedAtLeastOne = true
					finished = finished + 1
				end
			end
 
		if not finishedAtLeastOne then
			local started = getPlayerStartedTasks(cid)
			if started and #started > 0 then
				local text = ""
				local sep = ", "
				table.sort(started, (function(a, b) return (a < b) end))
				local t = 0
				for _, id in ipairs(started) do
					t = t + 1
					if t == #started - 1 then
						sep = " and "
					elseif t == #started then
						sep = "."
					end
					text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
				end
					selfSay("As tarefas atua" .. (#started > 1 and "is" or "is") .. " que você começou " .. (#started > 1 and "são" or "é") .. " " .. text, cid)
					Topic[cid] = 1
				else
					selfSay("Impressionante! Você terminou " .. (finished > 1 and "várias" or "a") .. " tasks" .. (finished > 1 and "s" or "") .. ". Fale comigo novamente se quiser começar um {task}.", cid)
				end
			else
				selfSay(string.format("Parabéns! Você recebeu: {%s}", result), cid)
			end
		end
	elseif msg ~= "" and canStartTask(cid, msg) then
		if #getPlayerStartedTasks(cid) >= tasksByPlayer then
			selfSay("Desculpe, mas você já começou " .. tasksByPlayer .. " tasks. Você pode verificar o {status} ou {cancel} uma tarefa.", cid)
			return true
		end
		local task = getTaskByName(msg)
		if task and getCreatureStorage(cid, QUESTSTORAGE_BASE + task) > 0 then  
			return false
		end
		selfSay("Nesta tarefa você deve derrotar " .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".Tem certeza de que deseja iniciar esta tarefa?", cid)
		choose[cid] = task
		talkState[talkUser] = 1
	elseif msg:lower() == "yes" and talkState[talkUser] == 1 then
		doCreatureSetStorage(cid, QUESTSTORAGE_BASE + choose[cid], 1)
		selfSay("Excelente! Você pode verificar o {status} de sua tarefa dizendo {report} para mim. Além disso, você também pode {cancel} para cancelar uma task quando desejar.", cid)
		choose[cid] = nil
		talkState[talkUser] = 0	
	elseif msg:lower() == "started" then
		local started = getPlayerStartedTasks(cid)
		if started and #started > 0 then
			local text = ""
			local sep = ", "
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(started) do
				t = t + 1
				if t == #started - 1 then
					sep = " e "
				elseif t == #started then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
 
			selfSay("As tarefas atua" .. (#started > 1 and "is" or "is") .. " que você começou " .. (#started > 1 and "são" or "é") .. " " .. text, cid)
		else
			selfSay("Você ainda não iniciou nenhuma tarefa.", cid)
		end
	elseif msg:lower() == "cancel" then
		local started = getPlayerStartedTasks(cid)
		local task = getTaskByName(msg)
		local text = ""
			local sep = ", "
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(started) do
				t = t + 1
				if t == #started - 1 then
					sep = " or "
				elseif t == #started then
					sep = "?"
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
		if started and #started > 0 then
			selfSay("O cancelamento de uma tarefa fará com que o contador seja reiniciado. Qual dessas tarefas você deseja cancelar?" .. (#started > 1 and "" or "") .. " " .. text, cid)
			talkState[talkUser] = 2
		else
			selfSay("Você ainda não iniciou nenhuma tarefa.", cid)
		end
	elseif getTaskByName(msg) and talkState[talkUser] == 2 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if getCreatureStorage(cid, KILLSSTORAGE_BASE + task) > 0 then
			selfSay("Você matou atualmente " .. getCreatureStorage(cid, KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Cancelar esta tarefa reiniciará a contagem. Tem certeza que deseja cancelar esta tarefa?", cid)
		else
			selfSay("Tem certeza que deseja cancelar esta tarefa?", cid)
		end
		talkState[talkUser] = 3
		cancel[cid] = task
	elseif getTaskByName(msg) and Topic[cid] == 1 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if getCreatureStorage(cid, KILLSSTORAGE_BASE + task) > 0 then
			selfSay("Você matou atualmente " .. getCreatureStorage(cid, KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".", cid)
			Topic[cid] = 0
		else
		    selfSay("Você ainda não iniciou nenhuma tarefa.", cid)
		end
	elseif msg:lower() == "yes" and talkState[talkUser] == 3 then
		doCreatureSetStorage(cid, QUESTSTORAGE_BASE + cancel[cid], -1)
		doCreatureSetStorage(cid, KILLSSTORAGE_BASE + cancel[cid], -1)
		selfSay("Você cancelou a tarefa " .. (tasks[cancel[cid]].name or tasks[cancel[cid]].raceName) .. ".", cid)
		talkState[talkUser] = 0
	elseif isInArray({"points", "rank"}, msg:lower()) then
	    if getCreatureStorage(cid, POINTSSTORAGE) < 1 then
		selfSay("Neste momento, você tem 0 pontos de Paw & Fur. Vocês " .. (getPlayerRank(cid) == 6 and "é um Elite Hunter" or getPlayerRank(cid) == 5 and "é um Trophy Hunter" or getPlayerRank(cid) == 4 and "é um Big Game Hunter" or getPlayerRank(cid) == 3 and "é um Ranger" or getPlayerRank(cid) == 2 and "é um Huntsman" or getPlayerRank(cid) == 1 and "é um member"  or "ainda não foi classificado") .. ".", cid)
		elseif getCreatureStorage(cid, POINTSSTORAGE) >= 1 then 
		selfSay("Neste momento, você tem " .. getCreatureStorage(cid, POINTSSTORAGE) .. " Paw & Fur points. Você " .. (getPlayerRank(cid) == 6 and "é um Elite Hunter" or getPlayerRank(cid) == 5 and "é um Trophy Hunter" or getPlayerRank(cid) == 4 and "é um Big Game Hunter" or getPlayerRank(cid) == 3 and "é um Ranger" or getPlayerRank(cid) == 2 and "é um Huntsman" or getPlayerRank(cid) == 1 and "are a Member"  or "haven't been ranked yet") .. ".", cid)
		end
		talkState[talkUser] = 0
	end
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Boa caçada, meu velho!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)