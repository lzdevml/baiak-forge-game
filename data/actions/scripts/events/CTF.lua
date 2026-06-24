local conditionFlagBlue = {lookType = 226, lookHead = 87, lookBody = 87, lookLegs = 79, lookFeet = 79, lookTypeEx = 0, lookAddons = 3}
local conditionFlagRed = {lookType = 226, lookHead = 94, lookBody = 94, lookLegs = 79, lookFeet = 79, lookTypeEx = 0, lookAddons = 3}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getStorage(ctfConfig.eventStorage) == 1 then
		doRemoveItem(itemEx.uid)
		doCreatureSetStorage(cid, ctfConfig.flag.storage, 1)				
		doRemoveCondition(cid, CONDITION_OUTFIT)
		doSetCreatureOutfit(cid, (getCreatureStorage(cid, ctfConfig.blue.storage) == 1 and conditionFlagBlue or conditionFlagRed), -1)
	--	doChangeSpeed(cid, -(math.floor(getCreatureBaseSpeed(cid) / 2)))

		doBroadcastMessage('[CTF]\n' .. getCreatureName(cid) .. ' do [' .. (getCreatureStorage(cid, ctfConfig.blue.storage) == 1 and 'blue' or 'red') .. ' team] Pegou a bandeira!\nVamos capturar esta bandeira!', MESSAGE_STATUS_WARNING)
	end
	return true
end