local conditionsToRemove = {CONDITION_HASTE, CONDITION_INVISIBLE}

function onStepIn(cid,item, position, lastPosition, fromPosition, toPosition)
	if not zombieEvent.config.allowMultiClient and zombieEvent.isMultiClient(cid) then
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		doPlayerSendCancel(cid, "É proibida a entrada de MCs neste evento.")
	else
		setGlobalStorageValue(zombieEvent.storages.global.playerCount, getGlobalStorageValue(zombieEvent.storages.global.playerCount)+1)
		setPlayerStorageValue(cid, zombieEvent.storages.playerState, 1)
		setPlayerStorageValue(cid, zombieEvent.storages.originalSpeed, getCreatureSpeed(cid))
		local position = {x = math.random(zombieEvent.config.area.fromPos.x, zombieEvent.config.area.toPos.x), y = math.random(zombieEvent.config.area.fromPos.y, zombieEvent.config.area.toPos.y), z = zombieEvent.config.area.z}
		while not isWalkable(position, true, true) do
			position = {x = math.random(zombieEvent.config.area.fromPos.x, zombieEvent.config.area.toPos.x), y = math.random(zombieEvent.config.area.fromPos.y, zombieEvent.config.area.toPos.y), z = zombieEvent.config.area.z}
		end	
		doTeleportThing(cid, position)
		doPlayerPopupFYI(cid, "Aguarde o inicio do evento e não deixe os zombies te morderem, mas caso te mordam ajude-os mordendo os outros players.")
		for i = 1, #conditionsToRemove do
			if(hasCondition(cid, conditionsToRemove[i])) then
				doRemoveCondition(cid, conditionsToRemove[i])
			end
		end

		local events = {"zombieEvent_areacombat", "zombieEvent_combat", "zombieEvent_follow", "zombieEvent_throw"}
		for i = 1, #events do
			registerCreatureEvent(cid, events[i])
		end
	end
	return true
end