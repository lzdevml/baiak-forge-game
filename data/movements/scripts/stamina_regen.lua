-- <movevent type="StepIn" actionid="9755" event="script" value="stamina_regen.lua"/>
-- <movevent type="StepOut" actionid="9755" event="script" value="stamina_regen.lua"/>

local config = {

	staminaToAdd = 5,
	tileAID = 9755,
	maxStamina = 42 * 60,
	
	toAdd = {
		[{0, 14}] = 3 * 60, -- Stamina Vermelha
		[{14, 40}] = 4 * 60,-- Stamina Amarela
		[{40, 42}] = 5 * 60 -- Stamina Verde
	}
}

local sString = config.staminaToAdd > 1 and "s" or ""
execute = {}

function onStepIn(cid, item, position)
	if isPlayer(cid) and getPlayerStamina(cid) < config.maxStamina then
		doSendMagicEffect(getThingPos(cid), CONST_ME_FIREWORK_RED)
         doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "[Stamina Refill] Sua stamina começou regenerar por estar em uma cabine de treinamento!")
		 setPlayerStorageValue(cid, 9756, 1)
		for k, v in pairs(config.toAdd) do
			if getPlayerStamina(cid) >= (k[1] * 60) and getPlayerStamina(cid) <= (k[2] * 60) then
				execute[cid] = addEvent(addStamina, v * 1000, cid)
				break
			end
		end
	end
	return true
end

function onStepOut(cid, item, position)
	if isPlayer(cid) then
	setPlayerStorageValue(cid, 9756, 0)
		if execute[cid] then
			stopEvent(execute[cid])
			execute[cid] = nil
		end
	end
	return true
end

function addStamina(cid)
	if not isPlayer(cid) or getTileInfo(getThingPos(cid)).aid ~= config.tileAID or getPlayerStamina(cid) >= config.maxStamina then
		return
	else
		doSendMagicEffect(getThingPos(cid), CONST_ME_FIREWORK_BLUE)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "[Stamina Refill] Você regenerou ".. config.staminaToAdd .. " minuto".. sString .." de stamina por estar em uma cabine de treinamento!.")
		doPlayerAddStamina(cid, config.staminaToAdd)
		
		for k, v in pairs(config.toAdd) do
			if getPlayerStamina(cid) >= (k[1] * 60) and getPlayerStamina(cid) <= (k[2] * 60) then
				execute[cid] = addEvent(addStamina, v * 1000, cid)
			end
		end	
	end
end