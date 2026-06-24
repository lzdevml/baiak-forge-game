local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then

return false

end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

local msg = string.lower(msg)

local config = {

hours = 24,

storage = 58487,

rewards = {{itemid = 6527,chance = 50},{itemid = 2195,chance = 60},{itemid = 2160,chance = 80},{itemid = 9969,chance = 10},{itemid = 2523,chance = 1},{itemid = 2640,chance = 5},{itemid = 2472,chance = 20},{itemid = 9932,chance = 15},{itemid = 8306,chance = 10},{itemid = 8885,chance = 10},{itemid = 13212,chance = 4},{itemid = 7443,chance = 2},{itemid = 8981,chance = 20},{itemid = 13393,chance = 5},{itemid = 13394,chance = 3},{itemid = 11197,chance = 20}} -- itens que ele poderá ganhar 

}

function doAddReward()

a = true

while a == true do

local m = math.random(1,#config.rewards)

if config.rewards[m].chance > math.random(1, 100) then

doPlayerAddItem(cid, config.rewards[m].itemid, isItemStackable(config.rewards[m].itemid) and 1 or 1)

npcHandler:say("his prize was: "..getItemNameById(config.rewards[m].itemid), cid)

a = false

end

end

end


if isInArray({"presente","present"}, msg) then

npcHandler:say("you want to receive your gift now? {yes}", cid)

talkState[talkUser] = 1

elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 1) then

if getPlayerStorageValue(cid,config.storage) <= os.time() and getPlayerLevel(cid) > 150 then

doAddReward()

setPlayerStorageValue(cid, config.storage, os.time()+config.hours*3600)

else

npcHandler:say("Você não possui level maior que 150, ou você já pegou seu presente diário.", cid)

talkState[talkUser] = 0

end

elseif msg == "no" then  

selfSay("Then not", cid)  

talkState[talkUser] = 0  

npcHandler:releaseFocus(cid)  

end

return TRUE

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new())