local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end


function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
	end
	
	if msgcontains(msg, "mission") or msgcontains(msg, "missao") or msgcontains(msg, "quest") then
		if getPlayerStorageValue(cid, 45490) <= 0 then
			npcHandler:say("Eu preciso de ajuda. Você precisa dar 'Use' nos {Large Pile of Various Bones} em roshamuul. Assim que juntar 50 pontos, posso falar com {Captain Chelop} para que ele possa liberar travel para upper roshamuul. Você aceita?", cid)
			npcHandler.topic[cid] = 1
		elseif getPlayerStorageValue(cid, 45490) == 1 then
			npcHandler:say("Você conseguiu os 50 pontos?", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Obrigado pela ajuda! No momento não tenho nenhuma outra missão para você.", cid)
			npcHandler.topic[cid] = 0
		end
	
----------------------------------------------------------------------------

	elseif msgcontains(msg, "yes") or msgcontains(msg, "sim") then
		if npcHandler.topic[cid] == 1 then
			setPlayerStorageValue(cid, 45490, 1)
			setPlayerStorageValue(cid, 45491, 0) -- pontos
			npcHandler:say("Tome cuidado com os monstros desta área. Você só receberá o ponto caso nenhum {Guzzlemaw} apareça ao dar use no {Large Pile of Various Bones}.", cid)
			npcHandler.topic[cid] = 0
			
		elseif npcHandler.topic[cid] == 2 then
			if getPlayerStorageValue(cid, 45491) >= 50 then
				setPlayerStorageValue(cid, 45490, 2)
				npcHandler:say("Muito bom! Você é incrível. Agora você pode ir para upper roshamuul através do npc {Captain Chelop}.", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Desculpe, você não ainda não tem os 50 pontos.", cid)
				npcHandler.topic[cid] = 0
			end
		end
		
	elseif(msgcontains(msg, "no") and isInArray({1,2}, npcHandler.topic[cid])) then
		npcHandler:say("Ok.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hmm Saudações. Talvez eu tenha missões para você, diga {mission}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Cuidado, essas terras são perigosas.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())