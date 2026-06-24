local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'beach backpack', 'beach'}, 5949, 5000, 'beach backpack')
shopModule:addBuyableItem({'crown backpack', 'crown'}, 2190, 5000, 'crown backpack')
shopModule:addBuyableItem({'green backpack', 'green'}, 1998, 5000, 'green backpack')
shopModule:addBuyableItem({'jewelled backpack', 'jewelled'}, 5801, 5000, 'jewelled backpack')
shopModule:addBuyableItem({'demon backpack', 'demon'}, 10518, 5000, 'demon backpack')
shopModule:addBuyableItem({'yellow backpack', 'demon'}, 1999, 5000, 'yellow backpack')
shopModule:addBuyableItem({'camouflage backpack', 'camouflage'}, 3940, 5000, 'camouflage backpack')
shopModule:addBuyableItem({'blue backpack', 'blue'}, 2002, 5000, 'blue backpack')
shopModule:addBuyableItem({'fur backpack', 'fur'}, 7342, 5000, 'fur backpack')
shopModule:addBuyableItem({'grey backpack', 'grey'}, 2003, 5000, 'grey backpack')
shopModule:addBuyableItem({'pirate backpack', 'pirate'}, 5926, 5000, 'pirate backpack')
shopModule:addBuyableItem({'red backpack', 'red'}, 2000, 5000, 'red backpack')
shopModule:addBuyableItem({'brocade backpack', 'brocade'}, 9774, 5000, 'brocade backpack')
shopModule:addBuyableItem({'moon backpack', 'moon'}, 10521, 5000, 'moon backpack')
shopModule:addBuyableItem({'backpack', 'backpack'}, 1988, 5000, 'backpack')
shopModule:addBuyableItem({'pick', 'pick'}, 2553, 1000, 'pick')
shopModule:addBuyableItem({'shovel', 'shovel'}, 2554, 1000, 'shovel')
shopModule:addBuyableItem({'rope', 'rope'}, 2120, 50, 'rope')

shopModule:addSellableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 30002) == -1) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 30002, 1)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser]) == TRUE) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
