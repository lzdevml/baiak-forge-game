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
local talkState = {}
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local shopWindow = {}
local moeda = 13393 -- id da sua moeda vip
local s = {
	  [12924] = {price = 100},	  
	  [12925] = {price = 100},
	  [12926] = {price = 100},	 
	  [12927] = {price = 100},	 
	  [12928] = {price = 100},	 
	  [12929] = {price = 100},	 
	  [12930] = {price = 100},	 
	  [12931] = {price = 100},	 
	  [12932] = {price = 100},	 
	  [12933] = {price = 100},	 
	  [12934] = {price = 100},	 
	  [12935] = {price = 100}, 
	  [12936] = {price = 100}, 
	  [12937] = {price = 100}, 
	  [12938] = {price = 100}, 
	  [12874] = {price = 100}, 
	  [13201] = {price = 100}, 
	  [12968] = {price = 100}, 	  
	  [12939] = {price = 100}, 
	  [12940] = {price = 100}, 
	  [13390] = {price = 100}, 
	  [13391] = {price = 100}, 
	  [13392] = {price = 100}
	  }
	  
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
    if  s[item] and not doPlayerRemoveItem(cid, moeda, s[item].price) then
          selfSay("You don't have "..s[item].price.." "..getItemNameById(moeda), cid)
             else
        doPlayerAddItem(cid, item)
        selfSay("Here are you.", cid)
       end
    return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
            for var, ret in pairs(s) do
                    table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
                end
            openShopWindow(cid, shopWindow, onBuy, onSell)
	        end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())