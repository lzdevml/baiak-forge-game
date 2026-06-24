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
local moeda = 11198 -- id da sua moeda vip
local b = {
	  [12861] = {price = 50}, 
	  [12862] = {price = 50}, 
	  [12863] = {price = 50}, 
	  [12864] = {price = 50}, 
	  [12865] = {price = 50}, 
	  [12866] = {price = 50}, 
	  [12867] = {price = 50}, 
	  [12868] = {price = 50}, 
	  [12869] = {price = 50}, 
	  [12870] = {price = 50}, 
	  [12871] = {price = 50}, 	
	  [8981] = {price = 30}, 
	  [13212] = {price = 1000}, 
	  [13393] = {price = 250}, 	
	  [13394] = {price = 250}, 	
	  [13397] = {price = 200}, 	
	  [13353] = {price = 50}, 	  
	  [13354] = {price = 500} 
	  }
	  
local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
    if  b[item] and not doPlayerRemoveItem(cid, moeda, b[item].price) then
          selfSay("You don't have "..b[item].price.." "..getItemNameById(moeda), cid)
             else
        doPlayerAddItem(cid, item)
        selfSay("Here are you.", cid)
       end
    return true
end
if (msgcontains(msg, 'trade') or msgcontains(msg, 'TRADE'))then
            for var, ret in pairs(b) do
                    table.insert(shopWindow, {id = var, subType = 0, buy = ret.price, sell = 0, name = getItemNameById(var)})
                end
            openShopWindow(cid, shopWindow, onBuy, onSell)
	        end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())