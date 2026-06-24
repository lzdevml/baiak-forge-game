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

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "minhafamilia") and (not npcHandler:isFocused(cid)) then
		npcHandler:say("PAI, MÃE, IRMÂ, TIOS E AVÓS... AMO MINHA FAMILIAA!!!", cid)
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)