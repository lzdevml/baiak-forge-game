local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end


npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. Will you help me? If you do, I'll reward you with nice addons! Just say {addons} or {help} if you don't know what to do.")
function playerBuyAddonNPC(cid, message, keywords, parameters, node)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if (parameters.confirm ~= true) and (parameters.decline ~= true) then
		if(getPlayerPremiumDays(cid) == 0) and (parameters.premium == true) then
			npcHandler:say('Sorry, but this addon is only for premium players!', cid)
			npcHandler:resetNpc()
			return true
		end
		if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
			npcHandler:say('You already have this addon!', cid)
			npcHandler:resetNpc()
			return true
		end
		local itemsTable = parameters.items
		local items_list = ''
		if table.maxn(itemsTable) > 0 then
			for i = 1, table.maxn(itemsTable) do
				local item = itemsTable[i]
				items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
				if i ~= table.maxn(itemsTable) then
					items_list = items_list .. ', '
				end
			end
		end
		local text = ''
		if (parameters.cost > 0) and table.maxn(parameters.items) then
			text = items_list .. ' and ' .. parameters.cost .. ' gp'
		elseif (parameters.cost > 0) then
			text = parameters.cost .. ' gp'
		elseif table.maxn(parameters.items) then
			text = items_list
		end
		npcHandler:say('Did you bring me ' .. text .. ' for ' .. keywords[1] .. '?', cid)
		return true
	elseif (parameters.confirm == true) then
		local addonNode = node:getParent()
		local addoninfo = addonNode:getParameters()
		local items_number = 0
		if table.maxn(addoninfo.items) > 0 then
			for i = 1, table.maxn(addoninfo.items) do
				local item = addoninfo.items[i]
				if (getPlayerItemCount(cid,item[1]) >= item[2]) then
					items_number = items_number + 1
				end
			end
		end
		if(getPlayerMoney(cid) >= addoninfo.cost) and (items_number == table.maxn(addoninfo.items)) then
			doPlayerRemoveMoney(cid, addoninfo.cost)
			if table.maxn(addoninfo.items) > 0 then
				for i = 1, table.maxn(addoninfo.items) do
					local item = addoninfo.items[i]
					doPlayerRemoveItem(cid,item[1],item[2])
				end
			end
			doPlayerAddOutfit(cid, addoninfo.outfit_male, addoninfo.addon)
			doPlayerAddOutfit(cid, addoninfo.outfit_female, addoninfo.addon)
			setPlayerStorageValue(cid,addoninfo.storageID,1)
			npcHandler:say('Here you are.', cid)
		else
			npcHandler:say('You do not have needed items or cash!', cid)
		end
		npcHandler:resetNpc()
		return true
	elseif (parameters.decline == true) then
		npcHandler:say('Not interested? Maybe other addon?', cid)
		npcHandler:resetNpc()
		return true
	end
	return false
end

local noNode = KeywordNode:new({'no'}, playerBuyAddonNPC, {decline = true})
local yesNode = KeywordNode:new({'yes'}, playerBuyAddonNPC, {confirm = true})

-- citizen (done)
local outfit_node = keywordHandler:addKeyword({'first citizen'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5878,100}}, outfit_female = 136, outfit_male = 128, addon = 1, storageID = 590001})
    outfit_node:addChildKeywordNode(yesNode)
local outfit_node = keywordHandler:addKeyword({'second citizen'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5890,100}, {5902,50}, {2480,1}}, outfit_female = 136, outfit_male = 128, addon = 2, storageID = 590002})
    outfit_node:addChildKeywordNode(yesNode)

-- hunter (done)
local outfit_node = keywordHandler:addKeyword({'first hunter'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5947,1}, {5876,100}, {5948,100}, {5891,5}, {5887,1}, {5889,1}, {5888,1}}, outfit_female = 137, outfit_male = 129, addon = 1, storageID = 590003})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second hunter'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5875,1}}, outfit_female = 137, outfit_male = 129, addon = 2, storageID = 590004})
    outfit_node:addChildKeywordNode(yesNode)

-- mage (done)
local outfit_node = keywordHandler:addKeyword({'first mage'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2182,1}, {2186,1}, {2185,1}, {8911,1}, {2181,1}, {2183,1}, {2190,1}, {2191,1}, {2188,1}, {8921,1}, {2189,1}, {2187,1}, {5904,10}, {5809,1}, {2193,20}}, outfit_female = 138, outfit_male = 130, addon = 1, storageID = 590005}) 
outfit_node:addChildKeywordNode(yesNode) 
local outfit_node = keywordHandler:addKeyword({'second mage'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5903,1}}, outfit_female = 138, outfit_male = 130, addon = 2, storageID = 590006}) 
outfit_node:addChildKeywordNode(yesNode) 


-- knight (done)
local outfit_node = keywordHandler:addKeyword({'first knight'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5880,100}, {5892,1}}, outfit_female = 139, outfit_male = 131, addon = 1, storageID = 590007})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second knight'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5893,100}, {5924,1}, {5885,1}, {5887,1}}, outfit_female = 139, outfit_male = 131, addon = 2, storageID = 590008})
    outfit_node:addChildKeywordNode(yesNode)

-- nobleman (done)
local outfit_node = keywordHandler:addKeyword({'first nobleman'}, playerBuyAddonNPC, {premium = false, cost = 300000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, storageID = 590009})
    outfit_node:addChildKeywordNode(yesNode)
local outfit_node = keywordHandler:addKeyword({'second nobleman'}, playerBuyAddonNPC, {premium = false, cost = 300000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, storageID = 590010})
    outfit_node:addChildKeywordNode(yesNode)


-- summoner (done)
local outfit_node = keywordHandler:addKeyword({'first summoner'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5878,100}}, outfit_female = 141, outfit_male = 133, addon = 1, storageID = 590011}) 
outfit_node:addChildKeywordNode(yesNode) 
local outfit_node = keywordHandler:addKeyword({'second summoner'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5894,70}, {5911,20}, {5883,40}, {5922,35}, {5886,10}, {5881,60}, {5882,40}, {5904,15}, {5905,30}}, outfit_female = 141, outfit_male = 133, addon = 2, storageID = 590012}) 
outfit_node:addChildKeywordNode(yesNode) 



-- warrior (done)
local outfit_node = keywordHandler:addKeyword({'first warrior'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5925,100}, {5899,100}, {5884,1}, {10020,1}}, outfit_female = 142, outfit_male = 134, addon = 1, storageID = 590013})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second warrior'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5880,100}, {5887,1}}, outfit_female = 142, outfit_male = 134, addon = 2, storageID = 590014})
    outfit_node:addChildKeywordNode(yesNode)
    

-- barbarian (done)
local outfit_node = keywordHandler:addKeyword({'first barbarian'}, playerBuyAddonNPC, {premium =false, cost = 0, items =  {{5880,100}, {5892,1}, {5893,50}, {5876,50}}, outfit_female = 147, outfit_male = 143, addon = 1, storageID = 590015})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second barbarian'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5884,1}, {5885,1}, {5910,50}, {5911,50}, {5886,10}}, outfit_female = 147, outfit_male = 143, addon = 2, storageID = 590016})
    outfit_node:addChildKeywordNode(yesNode)
    

-- druid (done)
local outfit_node = keywordHandler:addKeyword({'first druid'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5896,50}, {5897,50}}, outfit_female = 148, outfit_male = 144, addon = 1, storageID = 466620})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second druid'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5906,100}, {5939,1}, {5940,1}}, outfit_female = 148, outfit_male = 144, addon = 2, storageID = 466621})
    outfit_node:addChildKeywordNode(yesNode)
    

-- wizard (done)
local outfit_node = keywordHandler:addKeyword({'first wizard'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{2536,1}, {2492,1}, {2488,1}, {2123,1}}, outfit_female = 149, outfit_male = 145, addon = 1, storageID = 590019})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second wizard'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5922,50}}, outfit_female = 149, outfit_male = 145, addon = 2, storageID = 590020})
    outfit_node:addChildKeywordNode(yesNode)
    


-- oriental (done)
local outfit_node = keywordHandler:addKeyword({'first oriental'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5945,1}}, outfit_female = 150, outfit_male = 146, addon = 1, storageID = 590021})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second oriental'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5883,100}, {5895,100}, {5891,2}, {5912,100}}, outfit_female = 150, outfit_male = 146, addon = 2, storageID = 590022})
    outfit_node:addChildKeywordNode(yesNode)
    

-- pirate (done)
local outfit_node = keywordHandler:addKeyword({'first pirate'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6098,100}, {6126,100}, {6097,100}}, outfit_female = 155, outfit_male = 151, addon = 1, storageID = 590023})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second pirate'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6101,1}, {6102,1}, {6100,1}, {6099,1}}, outfit_female = 155, outfit_male = 151, addon = 2, storageID = 590024})
    outfit_node:addChildKeywordNode(yesNode)
    


-- assassin (done)
local outfit_node = keywordHandler:addKeyword({'first assassin'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5912,50}, {5910,50}, {5911,50}, {5913,50}, {5914,50}, {5909,50}, {5886,10}}, outfit_female = 156, outfit_male = 152, addon = 1, storageID = 590025})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second assassin'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5804,1}, {5930,100}}, outfit_female = 156, outfit_male = 152, addon = 2, storageID = 590026})
    outfit_node:addChildKeywordNode(yesNode)
    

-- beggar (done)
local outfit_node = keywordHandler:addKeyword({'first beggar'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5878,50}, {5921,30}, {5913,20}, {5894,10}}, outfit_female = 157, outfit_male = 153, addon = 1, storageID = 590027})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second beggar'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5883,100}, {2160,2}, {6107,1}}, outfit_female = 157, outfit_male = 153, addon = 2, storageID = 590028})
    outfit_node:addChildKeywordNode(yesNode)
    



-- shaman (done)
local outfit_node = keywordHandler:addKeyword({'first shaman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5810,5}, {3955,5}, {5015,1}}, outfit_female = 158, outfit_male = 154, addon = 1, storageID = 590029})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second shaman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{3966,5}, {3967,5}}, outfit_female = 158, outfit_male = 154, addon = 2, storageID = 590030})
    outfit_node:addChildKeywordNode(yesNode)
    

-- norseman (done)
local outfit_node = keywordHandler:addKeyword({'first norseman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{7290,5}}, outfit_female = 252, outfit_male = 251, addon = 1, storageID = 590031})
    outfit_node:addChildKeywordNode(yesNode)
local outfit_node = keywordHandler:addKeyword({'second norseman'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{7290,10}}, outfit_female = 252, outfit_male = 251, addon = 2, storageID = 590032})
    outfit_node:addChildKeywordNode(yesNode)

-- nightmare (done)
local outfit_node = keywordHandler:addKeyword({'first nightmare'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,1500}}, outfit_female = 269, outfit_male = 268, addon = 1, storageID = 590034})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second nightmare'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,1500}}, outfit_female = 269, outfit_male = 268, addon = 2, storageID = 590035})
    outfit_node:addChildKeywordNode(yesNode)
    


-- jester (done)
local outfit_node = keywordHandler:addKeyword({'first jester'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5879,1}, {5911,1}, {5914,1}, {5910,1}, {5912,1}, {5878,4}}, outfit_female = 270, outfit_male = 273, addon = 1, storageID = 590036})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second jester'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5909,5}}, outfit_female = 270, outfit_male = 273, addon = 2, storageID = 590037})
    outfit_node:addChildKeywordNode(yesNode)
    

-- brotherhood (done)
local outfit_node = keywordHandler:addKeyword({'first brotherhood'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,1500}}, outfit_female = 279, outfit_male = 278, addon = 1, storageID = 590038})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second brotherhood'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{6500,1500}}, outfit_female = 279, outfit_male = 278, addon = 2, storageID = 590039})
    outfit_node:addChildKeywordNode(yesNode)
    

-- Warmaster (done)
local outfit_node = keywordHandler:addKeyword({'first warmaster'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5886,15}, {5904,15},{5884,1}}, outfit_female = 335, outfit_male = 336, addon = 1, storageID = 590039})
    outfit_node:addChildKeywordNode(yesNode)
    
local outfit_node = keywordHandler:addKeyword({'second warmaster'}, playerBuyAddonNPC, {premium = false, cost = 0, items = {{5886,15}, {5904,15},{5884,1}}, outfit_female = 335, outfit_male = 336, addon = 2, storageID = 590040})
    outfit_node:addChildKeywordNode(yesNode)

keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can give you {citizen}, {hunter}, {knight}, {mage}, {frost tracer}, {dragon slayer}, {summoner}, {warrior}, {barbarian}, {druid}, {wizard}, {oriental}, {pirate}, {assassin}, {beggar}, {shaman}, {norseman}, {nighmare}, {jester}, {yalaharian}, {brotherhood}, {warmaster} and {wayfarer} addons.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.'})
npcHandler:addModule(FocusModule:new())