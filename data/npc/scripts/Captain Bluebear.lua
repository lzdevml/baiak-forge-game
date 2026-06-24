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

	
	if msgcontains(msg, "nashor") then
		if getPlayerStorageValue(cid, 487840) <= 0 then
			-- NAO TEM STORAGE
			npcHandler:say("Você deverá usar um Mystical Escriture para ter acesso à {nashor}.", cid)
			talkState[talkUser] = 0
		else
			-- TEM STORAGE
			npcHandler:say("Você gostaria de ir para {nashor} de graça?", cid)
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
	
local travelNode = keywordHandler:addKeyword({"secret library"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Secret Library por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 6815, y = 978, z = 8} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})	
	
local travelNode = keywordHandler:addKeyword({"gogue"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Gogue por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 449, y = 3199, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})	

local travelNode = keywordHandler:addKeyword({"luxor"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Luxor por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 196, y = 2987, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})	


     local travelNode = keywordHandler:addKeyword({'nargor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Lost City por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 154, y = 737, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})
	

            local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir ao Svargrond por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 718, y = 622, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})

      
      
    local travelNode = keywordHandler:addKeyword({'tiquanda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Tiquanda por conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 131, y = 168, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})
        
    local travelNode = keywordHandler:addKeyword({'frozenland'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Frozenland por conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 2136, y = 786, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})
        
        
    local travelNode = keywordHandler:addKeyword({'materos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Materos por conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1793, y = 1269, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})

    local travelNode = keywordHandler:addKeyword({'anshara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Anshara por conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1735, y = 689, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})
            
    local travelNode = keywordHandler:addKeyword({'kahlahari'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Kahlahari por conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1277, y = 1687, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})

    local travelNode = keywordHandler:addKeyword({'braga'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Braga por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1139, y = 2032, z = 7} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})
			
	local travelNode = keywordHandler:addKeyword({'roshamuul'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Roshamuul por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 24804, y = 347, z = 13} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'})		

    local travelNode = keywordHandler:addKeyword({'kalahari'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Kalahari por conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1392, y = 2011, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então não me encha o saco!!'}) 

local travelNode = keywordHandler:addKeyword({"blood city"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Blood City" .. (getConfigInfo("freeTravel") and "gratis??" or " de graça?")})
    travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=206, y=74, z=6} })
    travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Problema seu! Saia de perto de mim.."})



			
keywordHandler:addKeyword({"travel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Podemos viajar para as cidades {Tiquanda}, {Frozenland}, {Materos}, {Anshara}, {Kahlahari}, {Svargrond}, {Braga}, {Roshamuul}, {Nargor}, {Secret Library}, {Gogue}, {Luxor} e {Kalahari}. Ou podemos voltar para {Blood City}."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Quem manda nesta merda sou eu."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Marinheiro habilidoso não se faz em mar sereno."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())