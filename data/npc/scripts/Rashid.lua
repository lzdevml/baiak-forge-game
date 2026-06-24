local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end


function greetCallback(cid)
	Npchouse = getHouseFromPos(getThingPosition(getNpcId()))
	if Npchouse and not getHouseFromPos(getThingPosition(cid)) then
		npcHandler:unGreet(cid, true, true)
		return false
	end
	return true
end

npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_GREET, greetCallback)