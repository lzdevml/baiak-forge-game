local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'spellbook'}, 2175, 150, 1, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 'magic lightwand')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')
shopModule:addSellableItem({'wand of vortex', 'vortex'}, 2190, 100, 'wand of vortex')
shopModule:addSellableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 200, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of decay', 'decay'}, 2188, 1000, 'wand of decay')
shopModule:addSellableItem({'wand of draconia', 'draconia'}, 8921, 1500, 'wand of draconia')
shopModule:addSellableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 2000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno', 'inferno'},2187, 3500, 'wand of inferno')
shopModule:addSellableItem({'wand of starstorm', 'starstorm'}, 8920, 3600, 'wand of starstorm')
shopModule:addSellableItem({'wand of voodoo', 'voodoo'}, 8922, 4400, 'wand of voodoo')

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 2182, 50, 1, 'snakebite rod')
shopModule:addSellableItem({'moonlight rod', 'moonlight'}, 2186, 500,  1, 'moonlight rod')
shopModule:addSellableItem({'necrotic rod', 'necrotic'}, 2185, 1000, 1, 'necrotic rod')
shopModule:addSellableItem({'northwind rod', 'northwind'}, 8911, 1500, 1, 'northwind rod')
shopModule:addSellableItem({'terra rod', 'terra'}, 2181, 2500, 1, 'terra rod')
shopModule:addSellableItem({'hailstorm rod', 'hailstorm'}, 2183, 3500, 1, 'hailstorm rod')
shopModule:addSellableItem({'springsprout rod', 'springsprout'}, 8912, 3600, 1, 'springsprout rod')
shopModule:addSellableItem({'underworld rod', 'underworld'}, 8910, 4400, 1, 'underworld rod')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500,  'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000,  'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 5000,  'necrotic rod')
shopModule:addBuyableItem({'northwind rod', 'northwind'}, 8911, 7500,  'northwind rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000,  'terra rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm'}, 2183, 15000,  'hailstorm rod')
shopModule:addBuyableItem({'springsprout rod', 'springsprout'}, 8912, 18000,  'springsprout rod')
shopModule:addBuyableItem({'underworld rod', 'underworld'}, 8910, 22000,  'underworld rod')

shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')
shopModule:addBuyableItem({'antidote potion'}, 8474, 50, 1, 'antidote potion')

shopModule:addBuyableItem({'animate dead'}, 2316, 375, 1, 'animate dead rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 26, 1, 'desintegrate rune')
shopModule:addBuyableItem({'energy bomb'}, 2262, 162, 1, 'energy bomb rune')
shopModule:addBuyableItem({'fireball'}, 2302, 30, 1, 'fireball rune')
shopModule:addBuyableItem({'holy missile'}, 2295, 16, 1, 'holy missile rune')
shopModule:addBuyableItem({'icicle'}, 2271, 30, 1, 'icicle rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 116, 1, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 700, 1, 'paralyze rune')
shopModule:addBuyableItem({'poison bomb'}, 2286, 85, 1, 'poison bomb rune')
shopModule:addBuyableItem({'soulfire'}, 2308, 46, 1, 'soulfire rune')
shopModule:addBuyableItem({'stone shower'}, 2288, 37, 1, 'stone shower rune')
shopModule:addBuyableItem({'thunderstorm'}, 2315, 37, 1, 'thunderstorm rune')
shopModule:addBuyableItem({'wild growth'}, 2269, 160, 1, 'wild growth rune')

shopModule:addBuyableItem({'avalanche'}, 2274, 45, 1, 'avalanche rune')
shopModule:addBuyableItem({'antidote'}, 2266, 65, 1, 'antidote rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 15, 1, 'destroy field rune')
shopModule:addBuyableItem({'energy field'}, 2277, 38, 1, 'energy field rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 85, 1, 'energy wall rune')
shopModule:addBuyableItem({'explosion'}, 2313, 31, 1, 'explosion rune')
shopModule:addBuyableItem({'fire bomb'}, 2305, 117, 1, 'fire bomb rune')
shopModule:addBuyableItem({'fire field'}, 2301, 28, 1, 'fire field rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 61, 1, 'fire wall rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 45, 1, 'great fireball rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 12, 1, 'heavy magic missile rune')
shopModule:addBuyableItem({'intense healing'}, 2265, 95, 1, 'intense healing rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 4, 1, 'light magic missile rune')
shopModule:addBuyableItem({'poison field'}, 2285, 21, 1, 'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 52, 1, 'poison wall rune')
shopModule:addBuyableItem({'stalagmite'}, 2292, 12, 1, 'stalagmite rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 108, 1, 'sudden death rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 175, 1, 'ultimate healing rune')

shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 100, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 500, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'decay'}, 2188, 2000, 'wand of decay')
shopModule:addBuyableItem({'wand of draconia', 'draconia'}, 8921, 3000, 'wand of draconia')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 3000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 5000, 'wand of inferno')
shopModule:addBuyableItem({'wand of starstorm', 'starstorm'}, 8920, 8000, 'wand of starstorm')
shopModule:addBuyableItem({'wand of voodoo', 'voodoo'}, 8922, 10000, 'wand of voodoo')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 100, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'necrotic rod', 'necrotic'}, 2185, 2000, 'necrotic rod')
shopModule:addBuyableItem({'northwind rod', 'northwind'}, 8911, 5000, 'northwind rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 3000, 'terra rod')
shopModule:addBuyableItem({'hailstorm rod', 'hailstorm'}, 2183, 6000, 'hailstorm rod')
shopModule:addBuyableItem({'springsprout rod', 'springsprout'}, 8912, 8000, 'springsprout rod')
shopModule:addBuyableItem({'underworld rod', 'underworld'}, 8910, 10000,  'underworld rod')

local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}

function greetCallback(cid)
	Npchouse = getHouseFromPos(getThingPosition(getNpcId()))
	if Npchouse and not getHouseFromPos(getThingPosition(cid)) then
		npcHandler:unGreet(cid, true, true)
		return false
	end
	
	msg = 'Greetings |PLAYERNAME|. Eu vendo runas e potions'	
	npcHandler:setMessage(MESSAGE_GREET, msg)
	return true
end


local x = {}
local bpType = {}
local max = {}
local slots = {}
local item = {}
local count = {}
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 50111) <= 0) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 50111, 1)
			talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0

	else
        local filterMessage = doCutText(msg, ' ')
	for i, v in pairs(filterMessage) do
		if tonumber(v) then
			count[cid] = tonumber(v)
			break
		end
	end

	for j,k in pairs(runas) do
		if msgcontains(msg, j) then
			item[cid] = j
			break
		end
	end
	if count[cid] and count[cid] > 2000 then
		selfSay('The maximum quantity must be 2000 items.' , cid)
        count[cid] = false
		return true
	end

	if count[cid] and item[cid] and not msgcontains(msg, 'yes') and not msgcontains(msg, 'no') and not msgcontains(msg, 'bag') and not msgcontains(msg, 'bp') and not msgcontains(msg, 'backpack') then
		local needed_cap = getItemWeightById(runas[item[cid]].item, 1, true)*count[cid]
        if getPlayerFreeCap(cid) < needed_cap+ (count[cid] < 800 and 8 or 18) then
        	selfSay('You don\'t have the capacity to carry this!', cid)
            return true
        end

		local price = count[cid] * runas[item[cid]].priceEach
		selfSay('Are you sure you want to buy '.. count[cid] ..'x {' .. getItemNameById(runas[item[cid]].item) .. '} for {'.. milharFormat(price) .. '} gps?' , cid)
		talkState[talkUser] = 3
		return true
	end

	if talkState[talkUser] == 3 and msgcontains(msg, 'yes') then
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

        local container = false
        if count[cid] > 100 then
	        conainer = count[cid] < 800 and runas[item[cid]].bag or runas[item[cid]].backpack
	        container = doPlayerAddItem(cid, conainer, 1)
	    end
        if doPlayerRemoveMoney(cid, count[cid] * runas[item[cid]].priceEach) then
        	if container then
            	doAddContainerItem(container, runas[item[cid]].item, count[cid])
            else
            	doPlayerAddItem(cid, runas[item[cid]].item, count[cid])
            end
            selfSay('Ok.', cid)
            talkState[talkUser] = 0
            return true
        end
        talkState[talkUser] = 0
	end

	if msgcontains(msg, 'bag') then
		x[cid] = 40 
    	bpType[cid] = "bag"
    	max[cid] = 800
    	slots[cid] = 8
    elseif msgcontains(msg, 'bp') or msgcontains(msg, 'backpack') then
    	x[cid] = 100
    	bpType[cid] = "backpack"
    	max[cid] = 2000
    	slots[cid] = 20
    end

    if bpType[cid] then
    	for l, m in pairs(runas) do
    		if msgcontains(msg, l) then 
	    		if getPlayerItemCount(cid,m.item) > 20000 then
		        	selfSay('You do not have cap.',cid)
		        	talkState[talkUser] = 0
		        	return false
		        end
		        item[cid] = l
	        	selfSay('Are you sure you want to buy a '.. bpType[cid] ..' of {' .. getItemNameById(runas[l].item) .. '} for {'.. milharFormat((runas[l].priceEach)*max[cid]) .. '} gps? If you do not have enough money/cap, the value will be discounted only from what you buy?' , cid)
	        	talkState[talkUser] = 2
	        	break
		    end
    	end
    end


	
    if talkState[talkUser] == 2 and msgcontains(msg, 'yes') then
    	talkState[talkUser] = 0
        local countrunas = 0
        local countGold = 0
        local runename = ''
        for l, m in pairs(runas) do
            if l == item[cid] then   
            	runename = getItemNameById(m.item)
                local needed_cap = 10
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
                local backpack = bpType[cid] == "bag" and runas[l].bag or runas[l].backpack
                backpack = doPlayerAddItem(cid, backpack, 1)
                for i = 1, x[cid] do
                    local needed_cap = getItemWeightById(runas[l].item, 20, true)
                    if getPlayerFreeCap(cid) < needed_cap+2 then
                    	selfSay('You bought {' .. countrunas .. 'x} ' .. getItemNameById(runas[l].item) .. ' for {' .. milharFormat(countGold) .. '} gps.', cid)
                        return true
                    end

                    
                    local slots_free = getAllContainerFree(checking_backpack.uid)
                    if slots_free == 0 then
                    	selfSay('There is not enough room.', cid)
                        return true
                    end

                    if doPlayerRemoveMoney(cid, runas[l].priceEach*20) then
                        doAddContainerItem(backpack, runas[l].item, 20+1)
                        doPlayerRemoveItem(cid, runas[l].item, 1)

                        countrunas = countrunas + 20
                        countGold = countGold + (runas[l].priceEach*20)
                    end
                end
            end
        end
        selfSay('You bought {' .. countrunas .. 'x} ' .. runename .. ' for {' .. milharFormat(countGold) .. '} gps.', cid)
    end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_GREET, greetCallback)