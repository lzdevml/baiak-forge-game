function onAreaCombat(cid, ground, position)
	if isPlayer(cid) then
		return false
	end
	return true
end

function onCombat(cid, target)
	if isMonster(cid) then
		zombieEvent.zombieBite(cid, target)
		return false
	elseif isPlayer(cid) and isPlayer(target) then
		if getDistanceBetween(getThingPos(cid), getThingPos(target)) <= 1 and getPlayerStorageValue(cid, zombieEvent.storages.playerState) == 2 then
			zombieEvent.zombieBite(cid, target)
		end
		return false
	end
	return true
end

function onFollow(cid, target)
    if isPlayer(cid) then
        return false
    end
	return true
end

function onAttack(cid, target)
	if isMonster(cid) then
		if getPlayerStorageValue(target, zombieEvent.storages.playerState) == 2 then
			local targetList = getMonsterTargetList(cid)
			local newTarget
			for k, v in pairs(targetList) do
				if getPlayerStorageValue(v, zombieEvent.storages.playerState) < 2 then
					doMonsterSetTarget(cid, v)
					newTarget = true
					break
				end
			end
			if not newTarget then
				doCreatureSetNoMove(cid, true)
				return false
			end
		else
			if getCreatureNoMove(cid) then
				doCreatureSetNoMove(cid, false)
			end
		end
	end
	return true
end

function onThrow(cid, item, fromPosition, toPosition)
	if fromPosition.x == 65535 then
		if (fromPosition.y > 0 and fromPosition.y <= 10) or (toPosition.y > 0 and toPosition.y <= 10) then   
			doPlayerSendCancel(cid, "Você não pode alterar seus equipamentos durante este evento.")
			return false
		end
	end
	return true
end