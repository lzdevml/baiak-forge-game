--[[
	CONST_SLOT_FIRST = 1
	CONST_SLOT_HEAD = CONST_SLOT_FIRST
	CONST_SLOT_NECKLACE = 2
	CONST_SLOT_BACKPACK = 3
	CONST_SLOT_ARMOR = 4
	CONST_SLOT_RIGHT = 5
	CONST_SLOT_LEFT = 6
	CONST_SLOT_LEGS = 7
	CONST_SLOT_FEET = 8
	CONST_SLOT_RING = 9
	CONST_SLOT_AMMO = 10
	CONST_SLOT_LAST = CONST_SLOT_AMMO
]]

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic, Description = {}, {}
local thinkMsg = {
	"I can personalise your items, come to me!",
	"Want to upgrade your items temporarily? Come to me!"
}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                      npcHandler:onThink() end

function greetCallback(cid)
	Topic[cid], Description[cid] = 1, nil
	return true
end

local items = {
          item1 = {2346, 2349}, -- item1 item que será pedido e que será dado na primeira troca
          item2 = {2033, 15515} -- item2 item que será pedido e que será dado na segunda troca
}
local counts = {
          count1 = {1, 1}, -- count1 quantidade que será pedido e que será dado na primeira troca
          count2 = {10, 1} -- count2 quantidade que será pedido e que será dado na segunda troca
}

function creatureSayCallback(cid, type, msg)

	local slot = getPlayerSlotItem(cid, CONST_SLOT_AMMO)

	function checkSlot(cid)
		if slot.uid == 0 then
			npcHandler:say('You do not have the equipament in the slot you select.', cid)
		end
	end

	--if slot.uid == 0 then
		--npcHandler:say('You do not have the equipament in the slot you select. Place the item in the slot below your shield to begin the process. Place the item and say {yes}.', cid)

	--elseif slot.uid > 0 then
		if (Topic[cid] == 1) and (msgcontains(msg, 'yes')) then
			npcHandler:say('Place the item to imbue in the slot below your shield and do not remove or the process ends. {Yes}?', cid)
			Topic[cid] = 3

		elseif (Topic[cid] == 3) and (msgcontains(msg, 'yes')) then
			npcHandler:say('{Gay}?', cid)

		end

	--end

	--elseif (Topic[cid] == 1) and (msgcontains(msg, 'yes') or msgcontains(msg, 'imbuement') or msgcontains(msg, 'imbuements')) then
		--npcHandler:say('Choose the imbuements type: {swiftness}', cid)
		--Topic[cid] = 2

	--elseif Topic[cid] == 2 and msgcontains(msg, 'swiftness') then
		--npcHandler:say('What kinda of weapon you want to upgrade? {boots}', cid)
		--Topic[cid] = 17

	 -- swiftness
	--elseif Topic[cid] == 17 and msgcontains(msg, 'boots') then
		--local slot = getPlayerSlotItem(cid, CONST_SLOT_AMMO)

		--if slot.uid == 0 then
      	--npcHandler:say('You do not have the equipament in the slot you select.', cid)   
         --return true
      --end
	--else
		--npcHandler:say('You do not have items enoght to make a Imbuement', cid)
	--end

	if msgcontains(msg, 'blue note') then
                    if getPlayerItemCount(cid, items.item1[1]) >= counts.count1[1] then
                              doPlayerRemoveItem(cid, items.item1[1], counts.count1[1])
                              doPlayerAddItem(cid, items.item1[2], counts.count1[2])
                              selfSay('You just swap '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..' for '.. counts.count1[2] ..' '.. getItemNameById(items.item1[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count1[1] ..' '.. getItemNameById(items.item1[1]) ..'.', cid)
                    end

   elseif msgcontains(msg, 'bar of gold') then
                    if getPlayerItemCount(cid, items.item2[1]) >= counts.count2[1] then
                              doPlayerRemoveItem(cid, items.item2[1], counts.count2[1])
                              doPlayerAddItem(cid, items.item2[2], counts.count2[2])
                              selfSay('You just swap '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..' for '.. counts.count2[2] ..' '.. getItemNameById(items.item2[2]) ..'.', cid)
                    else
                              selfSay('You need '.. counts.count2[1] ..' '.. getItemNameById(items.item2[1]) ..'.', cid)
                    end
   end

	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, 'I hope you made the right choice, have a wonderful day.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Okay well, I guess you don\'t care if someone steals your stuff... You will have no idea if it\'s yours...')
npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|! I am a brander. I can personalize any of your items for a price, would you like to continue to the next step?')
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())