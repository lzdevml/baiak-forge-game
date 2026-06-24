local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local config = {
transferDisabledVocations = {0} -- disable non vocation characters
}

local talkState, count, transfer = {}, {}, {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end


--///////////////////////////START SCRIPT(bank)///////////////////////////--
if(not getPlayerBalance) then
	getPlayerBalance = function(cid)
	local result = db.getResult("SELECT `balance` FROM `players` WHERE `id` = " .. getPlayerGUID(cid))
	if(result:getID() == -1) then
	return false
	end

	local value = tonumber(result:getDataString("balance"))
	result:free()
	return value
	end

	doPlayerSetBalance = function(cid, balance)
	db.executeQuery("UPDATE `players` SET `balance` = " .. balance .. " WHERE `id` = " .. getPlayerGUID(cid))
	return true
	end

	doPlayerWithdrawMoney = function(cid, amount)
	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
	return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
	end

	doPlayerDepositMoney = function(cid, amount)
	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
	end

	doPlayerTransferMoneyTo = function(cid, target, amount)
	local balance = getPlayerBalance(cid)
	if(amount > balance) then
		return false
	end

	local tid = getPlayerByName(target)
	if(tid > 0) then
		doPlayerSetBalance(tid, getPlayerBalance(tid) + amount)
	else
	if(playerExists(target) == FALSE) then
		return false
	end

	db.executeQuery("UPDATE `player_storage` SET `value` = `value` + '" .. amount .. "' WHERE `player_id` = (SELECT `id` FROM `players` WHERE `name` = '" .. escapeString(player) .. "') AND `key` = '" .. balance_storage .. "'")
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) - amount)
	return true
	end
end

local function getPlayerVocationByName(name)
	local result = db.getResult("SELECT `vocation` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if(result:getID() == -1) then
	return false
	end

	local value = result:getDataString("vocation")
	result:free()
	return value
end

local function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967295)
end

local function getCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if(isValidMoney(money)) then
	return money
	end
	return -1
end

function greetCallback(cid)
	talkState[cid], count[cid], transfer[cid] = 0, nil, nil
	return true
end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

---------------------------- help ------------------------
	if msgcontains(msg, 'advanced') then
	if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
		selfSay("Once you are on the Tibian mainland, you can access new functions of your bank account, such as transferring money to other players safely or taking part in house auctions.", cid)
	else
		selfSay("Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you have enough money.", cid)
	end
	talkState[cid] = 0
	
	elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
		selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
		talkState[cid] = 0
		
	elseif msgcontains(msg, 'bank') then
		npcHandler:say("We can change money for you. You can also access your bank account.", cid)
		talkState[cid] = 0

	elseif msgcontains(msg, 'job') then
		npcHandler:say("I work in this bank. I can change money for you and help you with your bank account.", cid)
		talkState[cid] = 0
		
---------------------------- balance ---------------------
	elseif msgcontains(msg, 'balance') then
		if getPlayerBalance(cid) >= 1000000000 then
			npcHandler:say('SURREAL! You must be very important, one of the billionaire players of this world! Your account balance is incredible ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 100000000 then
			npcHandler:say('I think you must be one of the richest inhabitants in the world! Your account balance is ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 10000000 then
			npcHandler:say('You have made ten millions and it still grows! Your account balance is ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 1000000 then
			npcHandler:say('Wow, you have reached the magic number of a million gp!!! Your account balance is ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold!', cid)
			talkState[cid] = 0
		elseif getPlayerBalance(cid) >= 100000 then
			npcHandler:say('You certainly have made a pretty penny. Your account balance is ' .. doNumberFormat(getPlayerBalance(cid)) .. ' gold.', cid)
			talkState[cid] = 0
		else
			selfSay("Your account balance is " .. doNumberFormat(getPlayerBalance(cid)) .. " gold.", cid)
			talkState[cid] = 0
		end
	
---------------------------- deposit ---------------------
	elseif msgcontains(msg, 'deposit all') and getPlayerMoney(cid) > 0 then
		count[cid] = getPlayerMoney(cid) - getPlayerBalance(cid)
	if not isValidMoney(count[cid]) then
		selfSay("Sorry, but you can't deposit that much.", cid)
		talkState[cid] = 0
		return false
	end

	if count[cid] < 1 then
		selfSay("You don't have any money to deposit in you inventory..", cid)
		talkState[cid] = 0
	else
		selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
		talkState[cid] = 2
	end
	
	elseif msgcontains(msg, 'deposit') then
		if getCount(msg) == 0 then
			selfSay("You are joking, aren't you??", cid)
			talkState[cid] = 0
			
		elseif getCount(msg) ~= -1 then
			if getPlayerMoney(cid) - getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				
				if isValidMoney(count[cid]) then
					selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
					talkState[cid] = 2
				end
			else
				selfSay("You do not have enough gold.", cid)
				talkState[cid] = 0
			end
		else
			selfSay("Please tell me how much gold it is you would like to deposit.", cid)
			talkState[cid] = 1
		end
			
		elseif talkState[cid] == 1 then
			if getCount(msg) == -1 then
				selfSay("Please tell me how much gold it is you would like to deposit.", cid)
				talkState[cid] = 1
			else				
			if getPlayerMoney(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				
				if isValidMoney(count[cid]) then
					selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
					talkState[cid] = 2
				end
			else
				selfSay("You do not have enough gold.", cid)
				talkState[cid] = 0
			end
			end
		
	elseif talkState[cid] == 2 then
		if msgcontains(msg, 'yes') then
		if not doPlayerDepositMoney(cid, count[cid]) then
			selfSay("You don\'t have enough gold.", cid)
		else
			selfSay("Alright, we have added the amount of " .. count[cid] .. " gold to your balance. You can withdraw your money anytime you want to. Your account balance is " .. getPlayerBalance(cid) .. ".", cid)
		end
		elseif msgcontains(msg, 'no') then
			selfSay("As you wish. Is there something else I can do for you?", cid)
		end
			talkState[cid] = 0
			
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		if getCount(msg) == 0 then
			selfSay("Sure, you want nothing you get nothing!'", cid)
			talkState[cid] = 0
			
		elseif getCount(msg) ~= -1 then
			if getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				
				if isValidMoney(count[cid]) then
					selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
					talkState[cid] = 7
				else
					selfSay("There is not enough gold on your account.", cid)
					talkState[cid] = 0
				end
			else
				selfSay("There is not enough gold on your account.", cid)
				talkState[cid] = 0
			end
		else
			selfSay("Please tell me how much gold you would like to withdraw.", cid)
			talkState[cid] = 6
		end
			
		elseif talkState[cid] == 6 then
			if getCount(msg) == -1 then
				selfSay("Please tell me how much gold you would like to withdraw.", cid)
				talkState[cid] = 6
			else				
			if getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				
				if isValidMoney(count[cid]) then
					selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
					talkState[cid] = 7
				end
			else
				selfSay("There is not enough gold on your account.", cid)
				talkState[cid] = 0
			end
			end
	
	elseif talkState[cid] == 7 then
	if msgcontains(msg, 'yes') then
	if not doPlayerWithdrawMoney(cid, count[cid]) then
		selfSay("There is not enough gold on your account. Your account balance is " .. getPlayerBalance(cid) .. ". Please tell me the amount of gold coins you would like to withdraw.", cid)
		talkState[cid] = 0
	else
		selfSay("Here you are, " .. count[cid] .. " gold. Please let me know if there is something else I can do for you.", cid)
		talkState[cid] = 0
	end
	
	elseif msgcontains(msg, 'no') then
		selfSay("As you wish. Is there something else I can do for you?", cid)
		talkState[cid] = 0
	end
	
---------------------------- transfer --------------------
	elseif msgcontains(msg, 'transfer') then
		selfSay("Please tell me the amount of gold you would like to transfer.", cid)
		talkState[cid] = 11
		
	elseif talkState[cid] == 11 then
		count[cid] = getCount(msg)
		
		if getPlayerBalance(cid) < count[cid] then
			selfSay("You dont have enough money on your bank account.", cid)
			talkState[cid] = 0
			return true
		end

		if isValidMoney(count[cid]) then
			selfSay("Who would you like transfer " .. count[cid] .. " gold to?", cid)
			talkState[cid] = 12
		else
			selfSay("Is isnt valid amount of gold to transfer.", cid)
			talkState[cid] = 0
		end
		
	elseif talkState[cid] == 12 then
		transfer[cid] = msg

		if getCreatureName(cid) == transfer[cid] then
			selfSay("Ekhm, You want transfer money to yourself? Its impossible!", cid)
			talkState[cid] = 0
			return true
		end

		if isInArray(config.transferDisabledVocations, getPlayerVocation(cid)) then
			selfSay("Your vocation cannot transfer money.", cid)
			talkState[cid] = 0
		end

		if playerExists(transfer[cid]) then
			selfSay("So you would like to transfer " .. count[cid] .. " gold to \"" .. transfer[cid] .. "\" ?", cid)
			talkState[cid] = 13
		else
			selfSay("Player with name \"" .. transfer[cid] .. "\" doesnt exist.", cid)
			talkState[cid] = 0
		end
		
	elseif talkState[cid] == 13 then
		if msgcontains(msg, 'yes') then
		local targetVocation = getPlayerVocationByName(transfer[cid])
		if not targetVocation or isInArray(config.transferDisabledVocations, targetVocation) or not doPlayerTransferMoneyTo(cid, transfer[cid], count[cid]) then
			selfSay("This player does not exist on this world or have no vocation.", cid)
		else
			selfSay("You have transferred " .. count[cid] .. " gold to \"" .. transfer[cid] .."\".", cid)
			transfer[cid] = nil
		end
		
		elseif msgcontains(msg, 'no') then
			selfSay("As you wish. Is there something else I can do for you?", cid)
		end
			talkState[cid] = 0
	end
	return true
end
--///////////////////////////END SCRIPT(bank)///////////////////////////--

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())