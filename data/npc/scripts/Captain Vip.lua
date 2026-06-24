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

local travelNode = keywordHandler:addKeyword({"edron"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Edron por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 33174, y = 31764, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})	
	
local travelNode = keywordHandler:addKeyword({"secret library"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Secret Library por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 6815, y = 978, z = 8} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})		

local travelNode = keywordHandler:addKeyword({"banutinha"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Banutinha [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 32894, y = 32546, z = 9} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})
	
local travelNode = keywordHandler:addKeyword({"caverna do dragao"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Caverna do Dragao [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 14775, y = 6334, z = 8} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})
	
	
local travelNode = keywordHandler:addKeyword({"vikia"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Vikia [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 5149, y = 5063, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})

local travelNode = keywordHandler:addKeyword({"ghenov"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Ghenov [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 7050, y = 7210, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})

local travelNode = keywordHandler:addKeyword({"ghala"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Ghala [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 6167, y = 6030, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})
	
local travelNode = keywordHandler:addKeyword({"portal city"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Portal City [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 3842, y = 798, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})	

local travelNode = keywordHandler:addKeyword({"dangeon"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Dangeon [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 10763, y = 10701, z = 6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})

local travelNode = keywordHandler:addKeyword({"alpha"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer navegar para Alpha [PREMIUM] por " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 2202, y = 1698, z = 7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})

local travelNode = keywordHandler:addKeyword({"blood city"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Você quer voltar para blood city " .. (getConfigInfo("freeTravel") and "gratis?" or "0 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=206, y=74, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "Não tenho o dia todo.."})

    local travelNode = keywordHandler:addKeyword({'zao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Zao por conta da casa?'})
    travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 8515, y = 8085, z = 9} })
     travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})

     local travelNode = keywordHandler:addKeyword({'nargor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Nargor por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 154, y = 737, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})


            local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir ao Svargrond por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 588, y = 644, z = 7} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})

            local travelNode = keywordHandler:addKeyword({'dragon lord city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Custaria 110 por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 484, y = 44, z = 13} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})
        
	local travelNode = keywordHandler:addKeyword({'razachai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir RazAchai conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 8494, y = 8362, z = 6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})
        
	local travelNode = keywordHandler:addKeyword({'tiquanda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Tiquanda por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=132, y=177, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})
        
	local travelNode = keywordHandler:addKeyword({'frozenland'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Frozenland por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 2136, y = 786, z = 6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})
        
	local travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Port Hope 160 por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=32527, y=32784, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})
        
	local travelNode = keywordHandler:addKeyword({'materos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Materos por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1793, y = 1269, z = 6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})

	local travelNode = keywordHandler:addKeyword({'anshara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Anshara por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1735, y = 689, z = 6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})
			
	local travelNode = keywordHandler:addKeyword({'kahlahari'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Kahlahari por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1277, y = 1687, z = 6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})

	local travelNode = keywordHandler:addKeyword({'roshamuul'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Roshamuul por conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 24804, y = 347, z = 13} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})

	local travelNode = keywordHandler:addKeyword({'braga'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Braga por  conta da casa?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1139, y = 2032, z = 7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})

    local travelNode = keywordHandler:addKeyword({'quefren'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Quefren por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 1344, y = 2081, z = 7} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'}) 
			
    local travelNode = keywordHandler:addKeyword({'amenofis'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Gostaria de ir a Amenofis [PREMIUM] por  conta da casa?'})
            travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 2550, y = 1786, z = 6} })
            travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Problema seu.'})	 			



keywordHandler:addKeyword({"travel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voce deseja ir para as Cidades {Razachai}, {Portal City}, {Tiquanda}, {Frozenland}, {Materos}, {Anshara}, {Kahlahari}, {Braga}, {Nashor},  {Zao}, {Svargrond}, {Roshamuul}, {Thais}, {Carlin}, {Abdendriel}, {Secret Library}, {Gogue}, {Magogue}, e {Quefren} se for PREMIUM pode viajar livremente para: {Edron}, {Caverna do Dragao}, {Banutinha}, {Ghala}, {Dangeon}, {Amenofis}, {Alpha}, {Vikia}, e {Ghenov}. Ou podemos voltar para {Blood City}."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "O vento e as ondas estão sempre do lado dos melhores marinheiros.."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "O silêncio da alma é a melodia que toca."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())





























