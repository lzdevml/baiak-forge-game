eventsId = {}

local function rechargeStamina(cid)
if not isPlayer(cid) then
	eventsId[cid] = nil
	return
end

    doPlayerAddStamina(cid, 1)
    eventsId[cid] = addEvent(rechargeStamina, 2 * 60 * 1000, cid)
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if isPlayer(cid) then
        eventsId[cid] = addEvent(rechargeStamina, 2 * 60 * 1000, cid)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bem vindo aos trainers Castle's " .. getCreatureName(cid) .."! Você receberá 1 minuto de stamina a cada 3 minutos treinando no Castelo.")
    end

    return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if isPlayer(cid) then
        stopEvent(eventsId[cid])
        eventsId[cid] = nil
    end

    return true
end