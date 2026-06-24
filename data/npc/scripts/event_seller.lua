local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(WEST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(WEST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, 'mary point') then 
		npcHandler:say("Você quer trocar {10 event coins} por {1 mary point}?", cid)
		npcHandler.topic[cid] = 1
	end
		
	if msgcontains(msg, '20% exp potion') then 
		npcHandler:say("Você quer trocar {50 event coins} por {1 small exp potion 20%}?", cid)
		npcHandler.topic[cid] = 2
	end
		
	if msgcontains(msg, 'event ring') then 
		npcHandler:say("Você quer trocar {10 event coin} por {1 event ring}?", cid)
		npcHandler.topic[cid] = 3
	end
	
	if msgcontains(msg, 'might ring') then 
		npcHandler:say("Você quer trocar {3 event coin} por {1 might ring}?", cid)
		npcHandler.topic[cid] = 4
	end
	
	if msgcontains(msg, 'stamina refiller') then 
		npcHandler:say("Você quer trocar {85 event coins} por {1 stamina refiller}?", cid)
		npcHandler.topic[cid] = 5
	end
	
	if msgcontains(msg, 'refine stone') then 
		npcHandler:say("Você quer trocar {70 event coins} por {1 refine stone}?", cid)
		npcHandler.topic[cid] = 6
	end
	
	if msgcontains(msg, 'double exp escriture') then 
		npcHandler:say("Você quer trocar {100 event coins} por {1 double exp escriture}?", cid)
		npcHandler.topic[cid] = 7
	end
	
	if msgcontains(msg, 'addon doll') then 
		npcHandler:say("Você quer trocar {140 event coins} por {1 addon doll}?", cid)
		npcHandler.topic[cid] = 8
	end	
		
	if msgcontains(msg, 'pair of soft boots') then 
		npcHandler:say("Você quer trocar {80 event coins} por {1 pair of soft boots}?", cid)
		npcHandler.topic[cid] = 9
	end			
	
-----------------------------------------------------------------------------------
	
	if msgcontains(msg, "yes") or msgcontains(msg, "sim") then	
		if npcHandler.topic[cid] == 1 then -- dodge
			if getPlayerItemCount(cid, 6527) >= 10 then
				if doPlayerRemoveItem(cid, 6527, 10) then
					npcHandler:say("Boa escolha! Mary Point.", cid)
					doPlayerAddItem(cid, 5953, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
		
		elseif npcHandler.topic[cid] == 2 then -- critical
			if getPlayerItemCount(cid, 6527) >= 50 then
				if doPlayerRemoveItem(cid, 6527, 50) then
					npcHandler:say("Boa escolha! Small EXP 20% Potion.", cid)
					doPlayerAddItem(cid, 7440, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
		
		elseif npcHandler.topic[cid] == 3 then -- event ring
			if getPlayerItemCount(cid, 6527) >= 10 then
				if doPlayerRemoveItem(cid, 6527, 10) then
					npcHandler:say("Boa escolha! Event Ring.", cid)
					doPlayerAddItem(cid, 10502, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 4 then -- might ring
			if getPlayerItemCount(cid, 6527) >= 3 then
				if doPlayerRemoveItem(cid, 6527, 3) then
					npcHandler:say("Boa escolha! Might Ring.", cid)
					doPlayerAddItem(cid, 2164, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 5 then -- stamina refiller
			if getPlayerItemCount(cid, 6527) >= 85 then
				if doPlayerRemoveItem(cid, 6527, 85) then
					npcHandler:say("Boa escolha! Stamina Refiller.", cid)
					doPlayerAddItem(cid, 12849, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 6 then --refine stone
			if getPlayerItemCount(cid, 6527) >= 70 then
				if doPlayerRemoveItem(cid, 6527, 70) then
					npcHandler:say("Boa escolha! Refine Stone.", cid)
					doPlayerAddItem(cid, 8306, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 7 then -- de
			if getPlayerItemCount(cid, 6527) >= 100 then
				if doPlayerRemoveItem(cid, 6527, 100) then
					npcHandler:say("Boa escolha! Double Exp Escriture.", cid)
					doPlayerAddItem(cid, 5957, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 8 then --refine stone
			if getPlayerItemCount(cid, 6527) >= 140 then
				if doPlayerRemoveItem(cid, 6527, 140) then
					npcHandler:say("Boa escolha! Addon Doll.", cid)
					doPlayerAddItem(cid, 9693, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end	
		elseif npcHandler.topic[cid] == 9 then --refine stone
			if getPlayerItemCount(cid, 6527) >= 80 then
				if doPlayerRemoveItem(cid, 6527, 80) then
					npcHandler:say("Boa escolha! Soft Boots.", cid)
					doPlayerAddItem(cid, 6132, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("Você não possui event coin suficiente.", cid)
				npcHandler.topic[cid] = 0
			end					

		end

	elseif(msgcontains(msg, "no") and isInArray({1,2,3,4,5,6,7,8,9,10}, npcHandler.topic[cid])) then
		npcHandler:say("Ok then.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end


npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|! Eu vendo alguns itens em troca de event coins. Para saber mais, diga {itens}.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")

keywordHandler:addKeyword({"itens"}, StdModule.say, {npcHandler = npcHandler, text = "Eu vendo os seguintes itens: {Mary Point}, {Small Exp Potion 20%}, {Event Ring}, {Might Ring}, {Stamina Refiller}, {Refine Stone}, {Double Exp Escriture}, {Addon Doll}, e {Pair of Soft Boots}."})
keywordHandler:addAliasKeyword({"item"})
keywordHandler:addAliasKeyword({"itens"})
keywordHandler:addAliasKeyword({"iten"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())