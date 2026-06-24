local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)					    npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	         						npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end
        
function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (not npcHandler:isFocused(cid)) then
		return true
	end

	
	if msgcontains(msg, "nashor546456465") then
		if getPlayerStorageValue(cid, 487840) <= 0 then
			-- NAO TEM STORAGE
			npcHandler:say("Você deverá usar um Mystical Escriture para ter acesso à {nasho5465456456456r}.", cid)
			talkState[talkUser] = 0
		else
			-- TEM STORAGE
			npcHandler:say("Você gostaria de ir para {nasho545656564566r} de graça?", cid)
			talkState[talkUser] = 2
		end
	end
	
	if msgcontains(msg, "yes") or msgcontains(msg, "sim") then
		if talkState[talkUser] == 1 then
			npcHandler:say("Até logo.", cid)
			talkState[talkUser] = 0
			doTeleportThing(cid, {x = 6815, y = 977, z = 8})
		
		elseif talkState[talkUser] == 2 then
			npcHandler:say("Até logo.", cid)
			talkState[talkUser] = 0
			doTeleportThing(cid, {x = 15239, y = 1295, z = 6})
		end

	elseif (msgcontains(msg, "no") or msgcontains(msg, "bye")) then
		npcHandler:say("Então vai te catar.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
	
    -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
	
local travelNode = keywordHandler:addKeyword({"asura tower"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para asura tower por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 211, y = 270, z = 7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})
	
			
keywordHandler:addKeyword({"travel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Podemos viajar para {asura tower}."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Quem manda nesta merda sou eu."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Marinheiro habilidoso não se faz em mar sereno."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())