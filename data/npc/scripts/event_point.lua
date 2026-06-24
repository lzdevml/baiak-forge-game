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
local moeda = 6527 -- id da sua moeda vip
local e = {
	  [13397] = {price = 500},
	  [13394] = {price = 500},
	  [13393] = {price = 300},	  
	  [7443] = {price = 3000},	  
	  [13208] = {price = 2200},	  
	  [13407] = {price = 5000},	  
	  [13427] = {price = 5000},	
	  [13406] = {price = 5000},	  
	  [13425] = {price = 5000},	 
	  [13212] = {price = 2200},	
	  [13397] = {price = 400},	 
	  [13354] = {price = 500},	
	  [13353] = {price = 600},
	  [12888] = {price = 3500},	
	  [9969] = {price = 300},	
	  [12861] = {price = 450},
	  [12865] = {price = 450},
	  [12866] = {price = 450},
	  [12867] = {price = 450},
	  [12870] = {price = 450},
	  [12871] = {price = 450},	
	  [8981] = {price = 50},	  
	  [12846] = {price = 3000},	  
	  [12692] = {price = 7000} 
	  }
	  
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
    if  e[item] and not doPlayerRemoveItem(cid, moeda, e[item].price) then
          selfSay("You don't have "..e[item].price.." "..getItemNameById(moeda), cid)
             else
        doPlayerAddItem(cid, item)
        selfSay("Here are you.", cid)
       end
    return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
            for var, ret in pairs(e) do
                    table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
                end
            openShopWindow(cid, shopWindow, onBuy, onSell)
	        end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())