local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)					npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)				npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()								npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if (not npcHandler:isFocused(cid)) then
		return false
	end
 

local getguildwoe = db.getResult("SELECT `guild` FROM `woe` ORDER BY `id` DESC LIMIT 1;")
local guildd = getPlayerGuildId(cid)
local DESTINO = {x = 3831, y = 810, z = 7} 

   if msgcontains(msg, "secret island") then
      if getPlayerLevel(cid) > 100 and getguildwoe:getDataInt("guild") == getPlayerGuildId(cid)  then
         npcHandler:releaseFocus(cid)
         doTeleportThing(cid, DESTINO)
         selfSay(cid, 'Here you are.')
         doSendMagicEffect(getThingPos(cid), 10)
         doSendMagicEffect(DESTINO, 10)
      else
         selfSay("Me desculpe, mas você não tem acesso a secret island, precisa ter dominado o {MegaCastle} ou ser level 100+.", cid)
      end
   end
 
   return true
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())