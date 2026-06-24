function onKill(cid, target, damage, flags)
	if isPlayer(target) then
		return true
	end

	local position = getCreaturePosition(target)
	local t = getThingPos(target)

	if isPlayer(cid) and bit.band(flags, 1) == 1 then
		if getCreatureName(target) == "Snake God Essence" and not getCreatureByName("Snake Thing") then
			if doCreateMonster("Snake Thing", t, false, true) then
				doCreatureSay(cid, "NÃO É TÃO FÁCIL, MORTAIS! SINTAM O PODER DE UM DEUS!", TALKTYPE_ORANGE_1, false, 0, position)
			end
		elseif getCreatureName(target) == "Snake Thing" and not getCreatureByName("Lizard Abomination") then
			if doCreateMonster("Lizard Abomination", t, false, true) then
				doCreatureSay(cid, "NÃO É TÃO FÁCIL, MORTAIS! SINTAM O PODER DE UM DEUS!", TALKTYPE_MONSTER, false, 0, position)
			end
		elseif getCreatureName(target) == "Lizard Abomination" and not getCreatureByName("Mutated Zalamon") then
			if doCreateMonster("Mutated Zalamon", t, false, true) then
				doCreatureSay(cid, "NÃO É TÃO FÁCIL, MORTAIS! SINTAM O PODER DE UM DEUS!", TALKTYPE_MONSTER, false, 0, position)
			end
		end
	end

	return true
end
