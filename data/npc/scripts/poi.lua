local item = 2160
local quantidade = 30

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local storage = 20999

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end

     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     if msgcontains(msg, "join") then
         if getPlayerStorageValue(cid, storage) == -1 then
             selfSay("Talk 'yes' to continue", cid)
             talkState[talkUser] = 1
         elseif getPlayerStorageValue(cid, storage) == 1 then

             selfSay("You already have my permission. Proceed with your mission", cid)
         end
     elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
         if(doPlayerRemoveItem(cid, 2160, 30)) then 
                 selfSay("Ready! You have my permission.", cid)
                 setPlayerStorageValue(cid, storage, 1)
             else
                 selfSay("You do not have 300k to buy my permission .", cid)
             end

         talkState[talkUser] = 0
     elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
         selfSay("Ok then.", cid)
         talkState[talkUser] = 0
     end
     return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())