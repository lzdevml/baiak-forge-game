local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, human |PLAYERNAME|. How can a humble djinn be of service? I can sell {bp ssa} (20), {bp might} (20) or {bag ssa} (8), {bag might} (8), etc...")

local talkState = {}

local runas = {
        ["bp ssa"] = {bp = 2003, item = 2197, priceEach = 50000, slots = 20, charges = 5}, -- bp ssa
        ["bp might"] = {bp = 1999, item = 2164, priceEach = 40000, slots = 20, charges = 20}, -- bp might
        ["bp time"] = {bp = 5926, item = 2169, priceEach = 2000, slots = 20}, -- bp time ring
        ["bp energy"] = {bp = 2002, item = 2204, priceEach = 1000, slots = 20}, -- bp energy ring
        ["bp life"] = {bp = 1998, item = 2168, priceEach = 1000, slots = 20}, -- bp life ring

        ["bp sword"] = {bp = 10519, item = 2207, priceEach = 1000, slots = 20}, -- bp sword ring
        ["bp axe"] = {bp = 2003, item = 2208, priceEach = 1000, slots = 20}, -- bp sword ring
        ["bp club"] = {bp = 2001, item = 2209, priceEach = 1000, slots = 20}, -- bp club ring

        ["bag sword"] = {bp = 10520, item = 2207, priceEach = 1000, slots = 8}, -- bag sword ring
        ["bag axe"] = {bp = 1996, item = 2208, priceEach = 1000, slots = 8}, -- bag sword ring
        ["bag club"] = {bp = 1994, item = 2209, priceEach = 1000, slots = 8}, -- bag club ring

        ["bag ssa"] = {bp = 1996, item = 2197, priceEach = 50000, slots = 8, charges = 5}, -- bag ssa
        ["bag might"] = {bp = 1992, item = 2164, priceEach = 40000, slots = 8, charges = 20}, -- bag might
        ["bag time"] = {bp = 5927, item = 2169, priceEach = 2000, slots = 8}, -- bag time
        ["bag energy"] = {bp = 1995, item = 2204, priceEach = 1000, slots = 8}, -- bag energy ring
        ["bag life"] = {bp = 1991, item = 2168, priceEach = 1000, slots = 8}, -- bag life ring
        
    }  

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local runa = {}
		for l, m in pairs(runas) do
            if msgcontains(msg, l) then 
            	setPlayerStorageValue(cid, 48975,l)
            	local container
            	if string.explode(l, " ")[1] == "bp" then 
            		container = "backpack"
            	else 
            		container = "bag" 
            	end
            	selfSay('Are you sure you want to buy a '.. container .. ' of {' .. getItemNameById(runas[l].item) .. '} for {'.. milharFormat((runas[l].priceEach)*runas[l].slots) .. '} gps? If you do not have enough money/cap, the value will be discounted only from what you buy?' , cid)
            	talkState[talkUser] = 2
            end
        end
        if talkState[talkUser] == 2 and msgcontains(msg, 'yes') then
        	talkState[talkUser] = 0

	        local countRunas = 0
	        local countGold = 0
	        local runename
	        for l, m in pairs(runas) do
	            if l == getPlayerStorageValue(cid, 48975) then     
	            	runename = getItemNameById(runas[l].item)
	                local needed_cap = getItemWeightById(runas[l].bp, 1, false)
	                    if getPlayerFreeCap(cid) < needed_cap then
	                    	selfSay('You do not have enough cap.' , cid)
	                        return true
	                    end

	                    if getPlayerMoney(cid) < 10000 then
	                    	selfSay('You do not have enough money.',cid)
	                    	return true
	                    end

	                local checking_backpack = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK) 
	                
	                if checking_backpack.uid == 0 then
	                	selfSay('There is not enough room.', cid)
	                    return true
	                else
	                    local slots_free = getAllContainerFree(checking_backpack.uid)
	                    if slots_free == 0 then
	                    	selfSay('There is not enough room.', cid)
	                        return true
	                    end
	                end 
	                local bp = doPlayerAddItem(cid, runas[l].bp, 1)
	                for i = 1, runas[l].slots do
	                    local needed_cap = getItemWeightById(runas[l].item, 1, false)
	                    if getPlayerFreeCap(cid) < needed_cap then
	                    	selfSay('You bought {' .. countRunas .. 'x} ' .. getItemNameById(runas[l].item) .. ' for {' .. milharFormat(countGold) .. '} gps.', cid)
	                        return true
	                    end

	                    
	                    local slots_free = getAllContainerFree(checking_backpack.uid)
	                    if slots_free == 0 then
	                    	selfSay('There is not enough room.', cid)
	                        return true
	                    end

	                    if doPlayerRemoveMoney(cid, runas[l].priceEach) then
	                        additem = doAddContainerItem(bp, runas[l].item, 1)
	                        countRunas = countRunas + 1
	                        countGold = countGold + runas[l].priceEach

	                        if runas[l].charges then
	                        	doItemSetAttribute(additem, "charges", runas[l].charges)
	                        end
	                    end
	                end
	            end
	        end
	        selfSay('You bought {' .. countRunas .. 'x} ' .. runename .. ' for {' .. milharFormat(countGold) .. '} gps.', cid)
	    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())