local conditionBlack = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionBlack, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionBlack, {lookType = 134, lookHead = 114, lookBody = 114, lookLegs = 114, lookFeet = 114})
local conditionRed = createConditionObject(CONDITION_OUTFIT)
setConditionParam(conditionRed, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(conditionRed, {lookType = 143, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94})
function onStepIn(cid, item, position, fromPosition)
	if getPlayerAccess(cid) > 3 or getPlayerLevel(cid) < 80 then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser no mínimo level 80!")
		return true
	end

	if getGlobalStorageValue(4) >= getGlobalStorageValue(5) then
		setPlayerStorageValue(cid, 52, 1)
		setGlobalStorageValue(5, getGlobalStorageValue(5)+1)
		doAddCondition(cid, conditionBlack)
		doRemoveCondition(cid, CONDITION_INVISIBLE)
		doTeleportThing(cid, {x = 32538, y = 32409, z = 7})
		doCreatureSetNoMove(cid, true)
		doPlayerPopupFYI(cid, "-BR-\nVocê entrou! Aguarde o ínicio do evento. Você precisa matar todos os players do time adversário e SOBREVIVER para obter a recompensa.\n\n-ENG-\nYou entered! Wait for the event start. You need to kill all the players of the opposing team and SURVIVE for win the reward.")
	else
		setPlayerStorageValue(cid, 51, 1)
		setGlobalStorageValue(4, getGlobalStorageValue(4)+1)
		doAddCondition(cid, conditionRed)
		doRemoveCondition(cid, CONDITION_INVISIBLE)
		doTeleportThing(cid, {x = 32595, y = 32377, z = 7})
		doPlayerPopupFYI(cid, "-BR-\nVocê entrou! Aguarde o ínicio do evento. Você precisa matar todos os players do time adversário e SOBREVIVER para obter a recompensa.\n\n-ENG-\nYou entered! Wait for the event start. You need to kill all the players of the opposing team and SURVIVE for win the reward.")
		doCreatureSetNoMove(cid, true)
	end
	return true
end