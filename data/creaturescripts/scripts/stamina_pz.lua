local config = {
	staminaToAdd = 5,
	maxStamina = 42 * 60,
	toAdd = {
		[{0, 14}] = 3 * 60, -- Stamina Vermelha
		[{15, 39}] = 4 * 60,-- Stamina Amarela
		[{40, 42}] = 5 * 60 -- Stamina Verde
	}
}

local sString = config.staminaToAdd > 1 and "s" or ""
local timeStorage = 57940

function onThink(cid, interval)
	if not isPlayer(cid) then
		return true
	elseif getPlayerStamina(cid) >= config.maxStamina then
		return true
	end
	
	for k, v in pairs(config.toAdd) do
		if getPlayerStamina(cid) >= (k[1] * 60) and getPlayerStamina(cid) <= (k[2] * 60) then
			if getPlayerStorageValue(cid, timeStorage) >= v then
				setPlayerStorageValue(cid, timeStorage, 0)
				doPlayerAddStamina(cid, config.staminaToAdd)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[Stamina Refill] Você regenerou ".. config.staminaToAdd .. " minuto".. sString .." de stamina por esta em protection zone.")
				return true
			end
		end
	end
	
	if getTilePzInfo(getThingPos(cid)) then
		setPlayerStorageValue(cid, timeStorage, getPlayerStorageValue(cid,timeStorage) + 1)
	end	
	return true
end