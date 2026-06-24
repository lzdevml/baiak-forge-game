local kegs = {
	-- potions
	[16012] = 8473, -- ultimate health keg
	[16013] = 7590, -- great mana keg 
	[16014] = 7620, -- mana potion
	[16015] = 7591, -- great health keg
	[16016] = 8472, -- great spirit keg

	-- Runas
	[12537] = 2315, -- thunderstorm rune
	[12563] = 2288, -- stone shower rune
	[12541] = 2274, -- avalanche rune
	[12533] = 2304, -- great fireball rune

	[12527] = 2268, -- sudden death rune
	
	[12559] = 2269, -- wild growth rune
	[12529] = 2293, -- magic wall rune		
	[12547] = 2278 -- paralyze rune
	

}

local storageEx = 91501

function onUse(cid, item, fromPosition, itemEx, toPosition)

local stoPlayer = getPlayerStorageValue(cid, storageEx)
	if  stoPlayer < os.time() then
		if (kegs[item.itemid]) then
			local potionId, count
			
			if type(kegs[item.itemid]) == "table" then
				potionId = kegs[item.itemid].id
				count = kegs[item.itemid].count
			else
				potionId = kegs[item.itemid]
				count = 100
			end

			-- Verificar Cap e Espaço
			local backpack = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
			if backpack.uid == 0 then doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need a backpack to receive your items.') return false end
			if backpack and getAllContainerFree(backpack.uid) < 1 then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You have no space in your backpack.')
				doSendMagicEffect(getCreaturePosition(cid), 2)
				return false
			end
			if getPlayerFreeCap(cid) < getItemWeightById(potionId, count, true)+1 then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Please make sure that you can carry on additional '.. getItemWeightById(potionId, count, true) ..' oz.')
				doSendMagicEffect(getCreaturePosition(cid), 2)
				return false
			end


			itemCharges = getItemAttribute(item.uid, "charges")
			if itemCharges <= 1 then
				doRemoveItem(item.uid)
			else
				doItemSetAttribute(item.uid, "charges", itemCharges-1)
			end
			doPlayerSendTextMessage(cid, 22, "You've received ".. count .."x ".. getItemNameById(potionId) .. ".")
			doSendMagicEffect(getCreaturePosition(cid), 31)
			doPlayerAddItem(cid, potionId, count+1) doPlayerRemoveItem(cid, potionId, 1)			
			setPlayerStorageValue(cid, storageEx, os.time()+1)
		end
		return true
	else
		--doPlayerSendCancel(cid, "You need to wait " .. stoPlayer-os.time() .. " seconds to use it again.")
		doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return true
	end
	
end