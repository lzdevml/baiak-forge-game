local gold_coin = 10559
local magic_coin = 2159
local nme = getCreatureName(getNpcCid())

local offers = {

	-- [index] = {"nome do item", id do item vendido, id do item cobrado, quant. item cobrado, quant. item vendido}
	[1] = {"god ek helmet", 12746, gold_coin, 40, 1, "diamond coins"},
	[2] = {"god ek armor", 12752, gold_coin, 40, 1, "diamond coins"},
	[3] = {"god ek legs", 12758, gold_coin, 40, 1, "diamond coins"},
	[4] = {"god ek boots", 12765, gold_coin, 40, 1, "diamond coins"},
	[5] = {"god ek shield", 12770, gold_coin, 40, 1, "diamond coins"},
	[6] = {"god ek sword", 12780, gold_coin, 50, 1, "diamond coins"},
	[7] = {"god ek axe", 12778, gold_coin, 50, 1, "diamond coins"},
	[8] = {"god ek ring", 12787, gold_coin, 30, 1, "diamond coins"},
	[9] = {"god rp helmet", 12747, gold_coin, 40, 1, "diamond coins"},
	[10] = {"god rp armor", 12754, gold_coin, 40, 1, "diamond coins"},
	[11] = {"god rp legs", 12759, gold_coin, 40, 1, "diamond coins"},
	[12] = {"god rp ring", 12788, gold_coin, 30, 1, "diamond coins"},
	[13] = {"god rp boots", 12766, gold_coin, 40, 1, "diamond coins"},
	[14] = {"vip rp shield", 12771, gold_coin, 40, 1, "diamond coins"},
	[15] = {"god infernal cross", 12782, gold_coin, 30, 1, "diamond coins"},
	[16] = {"god mage robe", 12705, gold_coin, 40, 1, "diamond coins"},
	[17] = {"god mage legs", 12760, gold_coin, 40, 1, "diamond coins"},
	[18] = {"god mage boots", 12767, gold_coin, 40, 1, "diamond coins"},
	[19] = {"god mage shield", 12772, gold_coin, 40, 1, "diamond coins"},
	[20] = {"god mage wand", 12786, gold_coin, 50, 1, "diamond coins"},
	[21] = {"god ek club", 12776, gold_coin, 50, 1, "diamond coins"},
	[22] = {"god mage ring", 12789, gold_coin, 30, 1, "diamond coins"},
	[23] = {"god mage hat", 12748, gold_coin, 30, 1, "diamond coins"},
}

-- local offers = {

	-- [index] = {"nome do item", id do item vendido, id do item cobrado, quant. item cobrado, quant. item vendido}
	-- [1] = {"magic upgrade", 8306, gold_coin, 1, 1, "gold ingots"},
	-- [2] = {"red gem", 2156, magic_coin, 20, 1, "magic coins"},
	-- [3] = {"violet gem", 2153, magic_coin, 25, 1, "magic coins"},
	-- [4] = {"yellow gem", 2154, magic_coin, 50, 1, "magic coins"},
	-- [5] = {"green gem", 2155, gold_coin, 2, 1, "gold ingots"},
	-- [6] = {"blue gem", 2158, gold_coin, 5, 1, "gold ingots"},
	-- [7] = {"black gem", 2178, gold_coin, 10, 1, "gold ingots"},
	-- [8] = {"orange gem", 2363, gold_coin, 1, 1, "gold ingots"},
	-- [6] = {"autoloot", 7703, magic_coin, 15, 1, "magic coins"},
	-- [7] = {"autoloot2", 7702, magic_coin, 20, 1, "magic coin"},
	-- [9] = {"autoloot active", 9733, gold_coin, 100, 1, "gold ingots"},
	-- [10] = {"xp ring", 12716, gold_coin, 100, 1, "gold ingots"},
	-- [11] = {"death rune", 2307, gold_coin, 5, 100, "gold ingots"},
	-- [12] = {"reset magic upgrade", 8300, gold_coin, 1, 1, "gold ingots"},
	-- [13] = {"jar", 12775, gold_coin, 250, 1, "gold ingots"},

-- }

local function isNumber(string)
	return tonumber(string) ~= nil
end

local function decodeMessage(string)

	local count, ammount = 0, 1
	local str, index = "", 0

	for i = 1, #string do
		local character = string.sub(string,i,count + 1)
		count = count + 1
		if not isNumber(character) then 
			local letra = string.byte(string.sub(string,i,i))
			index = letra == string.byte(' ') and i + 1 or i 
			break;
		end
		str = str..character
	end

	local item = string.sub(string,index,#string)
	ammount = isNumber(str) and tonumber(str) or 1
	return {item, ammount};

end

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 		 	end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)   		end
function onCreatureSay(cid, type, msg) 	NpcSystem.parseParameters(npcHandler,cid)	npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end
function onPlayerEndTrade(cid)				npcHandler:onPlayerEndTrade(cid)			end
function onPlayerCloseChannel(cid)			npcHandler:onPlayerCloseChannel(cid)		end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
	local msg = string.lower(msg)


	if msgcontains(msg,"DC") then
		selfSay(gm(cid,nme,8),cid)
	
	elseif msgcontains(msg,"look god ek helmet") then
		selfSay(gm(cid,nme,9),cid)
		
	elseif msgcontains(msg,"look god ek armor") then
		selfSay(gm(cid,nme,10),cid)
	
	elseif msgcontains(msg,"look god ek legs") then
		selfSay(gm(cid,nme,11),cid)
		
	elseif msgcontains(msg,"look god ek boots") then
		selfSay(gm(cid,nme,12),cid)
		
	elseif msgcontains(msg,"look vip ek shield") then
		selfSay(gm(cid,nme,13),cid)
		
	elseif msgcontains(msg,"look god ek ring") then
		selfSay(gm(cid,nme,14),cid)		
		
	elseif msgcontains(msg,"look god hammer") then
		selfSay(gm(cid,nme,15),cid)
		
	elseif msgcontains(msg,"look god axe") then
		selfSay(gm(cid,nme,16),cid)	
		
	elseif msgcontains(msg,"look god sword") then
		selfSay(gm(cid,nme,17),cid)
	
	elseif msgcontains(msg,"look god rp helmet") then
		selfSay(gm(cid,nme,18),cid)
		
	elseif msgcontains(msg,"look god rp armor") then
		selfSay(gm(cid,nme,19),cid)		
		
	elseif msgcontains(msg,"look god rp legs") then
		selfSay(gm(cid,nme,20),cid)		
		
	elseif msgcontains(msg,"look god rp boots") then
		selfSay(gm(cid,nme,21),cid)

	elseif msgcontains(msg,"look vip rp shield") then
		selfSay(gm(cid,nme,22),cid)

	elseif msgcontains(msg,"look gold rp ring") then
		selfSay(gm(cid,nme,23),cid)

	elseif msgcontains(msg,"look god infernal cross") then
		selfSay(gm(cid,nme,24),cid)

	elseif msgcontains(msg,"look god mage robe") then
		selfSay(gm(cid,nme,25),cid)

	elseif msgcontains(msg,"look god mage hat") then
		selfSay(gm(cid,nme,26),cid)

	elseif msgcontains(msg,"look god mage legs") then
		selfSay(gm(cid,nme,27),cid)

	elseif msgcontains(msg,"look god mage boots") then
		selfSay(gm(cid,nme,28),cid)

	elseif msgcontains(msg,"look god mage shield") then
		selfSay(gm(cid,nme,29),cid)

	elseif msgcontains(msg,"look god mage wand") then
		selfSay(gm(cid,nme,30),cid)

	elseif msgcontains(msg, "trade") then

		local str, count = "", 1
		for a = 1, #offers do
			if a > #offers then break end;
			local begin = a == 1 and "" or ", "
			begin = a == #offers and " e " or begin
			str = str..begin.."{"..offers[a][1].."}"
		end
		str = str.." "..gm(cid,nme,2)
		selfSay(gm(cid,nme,3).." "..str,cid)

	elseif talkState[talkUser] == 20 then
		if agreeNPC(msg) then
			local tb = getPlayerTableStorage(cid,822560)
			if #tb > 0 then
				if getPlayerItemCount(cid, tb[4]) >= tb[3] then
					doPlayerRemoveItem(cid,tb[4],tb[3])
					for i = 1, tb[2] do
						doPlayerAddItem(cid, tb[1],1)
					end
					selfSay(gm(cid,nme,4).." "..tb[2].." "..getItemNameById(tb[1])..".",cid)
				else
					selfSay(gm(cid,nme,5),cid)
				end
			end
		elseif disagreeNPC(msg) then
			selfSay("Ok.",cid)
		end
		doPlayerSetStorageValue(cid,822560,-1)
		talkState[talkUser] = 0
	else

		local info, item = decodeMessage(msg), false
		for a, b in pairs(offers) do
			if b[1] == info[1] then
				item = offers[a] or false
			end
		end
		if item then
			selfSay(gm(cid,nme,6).." ".. info[2] * item[5] .." "..info[1].." por ".. info[2] * item[4] .." ".. item[6] .." ?", cid)
			setPlayerTableStorage(cid, 822560, {item[2], item[5] * info[2], item[4] * info[2], item[3]})
			talkState[talkUser] = 20
		else
			selfSay(gm(cid,nme,7), cid)
		end
	end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
