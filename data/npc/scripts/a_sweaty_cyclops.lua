local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)	selfTurn(EAST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(EAST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
	end	

	if npcHandler.topic[cid] == 5 then
		if msgcontains(msg, "25") then
			npcHandler:say("You trade {1 soul orb} for {25 infernal bolts}?", cid)
			npcHandler.topic[cid] = 7
		elseif msgcontains(msg, "100") then
			npcHandler:say("You trade {4 soul orb} for {100 infernal bolts}?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif npcHandler.topic[cid] == 6 then
		if msgcontains(msg, "25") then
			npcHandler:say("You trade {1 soul orb} for {25 crystalline arrows}?", cid)
			npcHandler.topic[cid] = 9
		elseif msgcontains(msg, "100") then
			npcHandler:say("You trade {4 soul orb} for {100 crystalline arrows}?", cid)
			npcHandler.topic[cid] = 10
		end
	end
	
	if msgcontains(msg, "piece of royal steel") or msgcontains(msg, "royal steel") then
		npcHandler:say("You need a Piece of Royal Steel? I need {1 crown armor}. You have?", cid)
		npcHandler.topic[cid] = 1
		
	elseif msgcontains(msg, "piece of draconian steel") or msgcontains(msg, "draconian steel") then
		npcHandler:say("You need a Piece of Draconian Steel? I need {1 dragon shield}. You have?", cid)
		npcHandler.topic[cid] = 2
		
	elseif msgcontains(msg, "piece of hell steel") or msgcontains(msg, "hell steel") then
		npcHandler:say("You need a Piece of Hell Steel? I need {1 devil helmet}. You have?", cid)
		npcHandler.topic[cid] = 3
		
	elseif msgcontains(msg, "huge chunk of crude iron") or msgcontains(msg, "huge chunk") or msgcontains(msg, "crude iron") then
		npcHandler:say("You need a Huge Chunk of Crude Iron? I need {1 giant sword}. You have?", cid)
		npcHandler.topic[cid] = 4
		
	elseif msgcontains(msg, "infernal bolt") or msgcontains(msg, "bolt") or msgcontains(msg, "infernal") then
		npcHandler:say("You need Infernal Bolts? I need {Soul Orb}. To 25 Infernal Bolts for 1 Soul Orb, Say {25}. To 100 Infernal Bolts for 1 Soul Orb, say {100}.", cid)
		npcHandler.topic[cid] = 5
		
	elseif msgcontains(msg, "crystalline arrow") or msgcontains(msg, "arrow") or msgcontains(msg, "crystalline") then
		npcHandler:say("You need Crystalline Arrows? I need {Soul Orb}. To 25 Crystalline Arrows for 1 Soul Orb, Say {25}. To 100 crystalline arrows for 1 Soul Orb, say {100}.", cid)
		npcHandler.topic[cid] = 6
		
-----------------------------------------------------------------------------------

	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid, 2487) >= 1 then
				if doPlayerRemoveItem(cid, 2487, 1) then
					npcHandler:say("Thank you!.", cid)
					doPlayerAddItem(cid, 5887, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 2 then
			if getPlayerItemCount(cid, 2516) >= 1 then
				if doPlayerRemoveItem(cid, 2516, 1) then
					npcHandler:say("Thank you!.", cid)
					doPlayerAddItem(cid, 5889, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 3 then
			if getPlayerItemCount(cid, 2462) >= 1 then
				if doPlayerRemoveItem(cid, 2462, 1) then
					npcHandler:say("Thank you!.", cid)
					doPlayerAddItem(cid, 5888, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 4 then
			if getPlayerItemCount(cid, 2393) >= 1 then
				if doPlayerRemoveItem(cid, 2393, 1) then
					npcHandler:say("Thank you!.", cid)
					doPlayerAddItem(cid, 5892, 1)
					npcHandler.topic[cid] = 0
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 7 then
			if getPlayerItemCount(cid, 5944) >= 1 then
				if doPlayerRemoveItem(cid, 5944, 1) then
					npcHandler:say("Thank you! For more, repeat {yes} and you will receive another 25...", cid)
					doPlayerAddItem(cid, 6529, 25)
					npcHandler.topic[cid] = 7
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 8 then
			if getPlayerItemCount(cid, 5944) >= 4 then
				if doPlayerRemoveItem(cid, 5944, 4) then
					npcHandler:say("Thank you! For more, repeat {yes} and you will receive another 100...", cid)
					doPlayerAddItem(cid, 6529, 100)
					npcHandler.topic[cid] = 8
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 9 then
			if getPlayerItemCount(cid, 5944) >= 1 then
				if doPlayerRemoveItem(cid, 5944, 1) then
					npcHandler:say("Thank you! For more, repeat {yes} and you will receive another 25...", cid)
					doPlayerAddItem(cid, 2534, 25)
					npcHandler.topic[cid] = 9
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
			
		elseif npcHandler.topic[cid] == 10 then
			if getPlayerItemCount(cid, 5944) >= 4 then
				if doPlayerRemoveItem(cid, 5944, 4) then
					npcHandler:say("Thank you! For more, repeat {yes} and you will receive another 100...", cid)
					doPlayerAddItem(cid, 2534, 100)
					npcHandler.topic[cid] = 10
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("You don't have it...", cid)
				npcHandler.topic[cid] = 0
			end
		end

	elseif(msgcontains(msg, "no") and isInArray({1,2,3,4,5,6,7,8,9,10}, npcHandler.topic[cid])) then
			npcHandler:say("Ok then.", cid)
			npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "um Humm! Welcume lil', |PLAYERNAME|! Say {Piece of Royal Steel}, {Piece of Draconian Steel}, {Piece of Hell Steel}, {Huge Chunk of Crude Iron}, {Infernal Bolt} or {crystalline arrow}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye lil' one.")

keywordHandler:addKeyword({"elves"}, StdModule.say, {npcHandler = npcHandler, text = "They were friend with me parents. Long before elves here, they often made visit. No longer come here."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, text = "I am smith."})
keywordHandler:addKeyword({"melt"}, StdModule.say, {npcHandler = npcHandler, text = "They were friend with me parents. Long before elves here, they often made visit. No longer come here."})
keywordHandler:addKeyword({"mesh kaha rogh"}, StdModule.say, {npcHandler = npcHandler, text = "Steel that is singing when forged. No one knows where find today."})
keywordHandler:addKeyword({"minotaurs"}, StdModule.say, {npcHandler = npcHandler, text = "They were friend with me parents. Long before elves here, they often made visit. No longer come here."})
keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "I called Bencthyclthrtrprr by me people. Lil' ones me call Big Ben."})
keywordHandler:addKeyword({"smith"}, StdModule.say, {npcHandler = npcHandler, text = "Working steel is my profession."})
keywordHandler:addKeyword({"teshial"}, StdModule.say, {npcHandler = npcHandler, text = "Is one of elven family or such thing. Me not understand lil' ones and their business."})
keywordHandler:addAliasKeyword({"cenath"})
keywordHandler:addKeyword({"tibia"}, StdModule.say, {npcHandler = npcHandler, text = "One day I'll go and look."})
keywordHandler:addKeyword({"uth'amon"}, StdModule.say, {npcHandler = npcHandler, text = "Heartiron from heart of big old mountain, found very deep. Lil' lil ones fiercely defend. Not wanting to have it used for stuff but holy stuff."})
keywordHandler:addKeyword({"uth'byth"}, StdModule.say, {npcHandler = npcHandler, text = "Not good to make stuff off. Bad steel it is. But eating magic, so useful is."})
keywordHandler:addKeyword({"uth'doon"}, StdModule.say, {npcHandler = npcHandler, text = "It's high steel called. Only lil' lil' ones know how make."})
keywordHandler:addKeyword({"uth'maer"}, StdModule.say, {npcHandler = npcHandler, text = "Brightsteel is. Much art made with it. Sorcerers too lazy and afraid to enchant much."})
keywordHandler:addKeyword({"za'kalortith"}, StdModule.say, {npcHandler = npcHandler, text = "It's evil. Demon iron is. No good cyclops goes where you can find and need evil flame to melt"})
keywordHandler:addKeyword({"zatragil"}, StdModule.say, {npcHandler = npcHandler, text = "Most ancients use dream silver for different stuff. Now ancients most gone. Most not know about."})
keywordHandler:addKeyword({"cyclops"}, StdModule.say, {npcHandler = npcHandler, text = "Me people not live here much. Most are far away."})
keywordHandler:addKeyword({"excalibug"}, StdModule.say, {npcHandler = npcHandler, text = "Me wish I could make weapon like it.."})
keywordHandler:addKeyword({"god"}, StdModule.say, {npcHandler = npcHandler, text = "You shut up. Me not want to hear."})
keywordHandler:addKeyword({"lil' lil'"}, StdModule.say, {npcHandler = npcHandler, text = "Lil' lil' ones are so fun. We often chat."})
keywordHandler:addKeyword({"keywords"}, StdModule.say, {npcHandler = npcHandler, text = "Lil' one the keywords are: {elves}, {job}, {melt}, {mesh kaha rogh}, {minotaurs}, {name}, {smith}, {teshial} or {cenath}, {tibia}, {uth'amon}, {uth'byth}, {uth'doon}, {uth'maer}, {za'kalortith}, {zatragil}, {cyclops}, {excalibug}, {god} and {lil' lil}.",})
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())