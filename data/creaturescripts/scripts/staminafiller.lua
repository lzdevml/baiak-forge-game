local storage = 19387
local tempo = 20 * 60
local minutes = 5

local bosses = {
    ["Trainer Bk"] = {}
}

function onAttack(cid, target)
	local bid = bosses[getCreatureName(target)]
	if isMonster(target) and bid then
        	doPlayerSetStorageValue(cid, storage, getPlayerStorageValue(cid, storage)+1)
		if getPlayerStorageValue(cid, storage) >= tempo then
			doPlayerAddStamina(cid, minutes)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua stamina está subindo...")
			doPlayerSetStorageValue(cid, storage, 0)
		end
    	end
   return true
end