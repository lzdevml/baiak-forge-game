local talk_state = 0

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()  npcHandler:onThink() end
	 local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local config = {
   npcstorage = 18687,
   killstorage = 19001,
   amountkills = 10,
   rewarditem = 2160,
   rewardexp = 12000
}

function creatureSayCallback(cid, type, msg)


   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

 
   if(not npcHandler:isFocused(cid)) then
      if(msg == 'hi' or msg == 'hello') then
         if(getPlayerStorageValue(cid, config.npcstorage) == -1) then
            selfSay('Hello '..getPlayerName(cid)..', I have a mission for you if you are strong enough. I want you to kill 10 players, do you accept?', cid)
            talkState[talkUser] = 1
         elseif(getPlayerStorageValue(cid, config.npcstorage) == 1) then
            selfSay('Did you kill 10 players?', cid)
            talkState[talkUser] = 1
         else
            selfSay('Hello '..getPlayerName(cid)..', bringer of death!', cid)
         end
         npcHandler:addFocus(cid)
      else
         return false
      end
   end
 
   if(msgcontains(msg, 'yes')) and talkState[talkUser] == 1 then
      if(getPlayerStorageValue(cid, config.npcstorage) == -1) then
         selfSay('Lets see if you can make it!', cid)
         doPlayerSetStorageValue(cid, config.npcstorage, 1)
      elseif(getPlayerStorageValue(cid, config.npcstorage) == 1) then
         if(getPlayerStorageValue(cid, config.killstorage) >= config.amountkills) then
            selfSay('Well, didn\'t expected it, but well done, here is your reward.', cid)
            doPlayerAddItem(cid, config.rewarditem, 1)
                      doPlayerAddExp(cid, config.rewardexp)
            doPlayerSetStorageValue(cid, config.npcstorage, 2)
         else
                     selfSay('You killed '..(getPlayerStorageValue(cid, config.killstorage) +1)..' players, you need to kill '..config.amountkills..'!', cid)
         end
      end
      talkState[talkUser] = 0
   elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
      talkState[talkUser] = 0
      selfSay('I knew you were not strong enough!', cid)
   elseif(msgcontains(msg, 'bye')) then
      selfSay('Bye.', cid)
      npcHandler:releaseFocus(cid)
   end
   return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())