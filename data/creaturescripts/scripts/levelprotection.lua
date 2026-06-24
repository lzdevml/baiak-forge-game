local conditions = {
	CONDITION_INFIGHT,
	CONDITION_POISON,
	CONDITION_FIRE,
	CONDITION_ENERGY,
	CONDITION_BLEEDING,
	CONDITION_PARALYZE,
	CONDITION_DRUNK,
	CONDITION_DROWN,
	CONDITION_FREEZING,
	CONDITION_DAZZLED,
	CONDITION_CURSED
}

function onPrepareDeath(cid, deathList)
	if isPlayer(cid) and getPlayerLevel(cid) <= 50 and getCreatureHealth(cid) <= 10 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), true)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid), 65535, 256, true)
		doCreatureAddMana(cid, getCreatureMaxMana(cid), true)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você não perde experiência/skills até level 50.")

		for _, condition in ipairs(conditions) do
			if getCreatureCondition(cid, condition) then
				doRemoveCondition(cid, condition)
			end
		end

		return false
	end
	return true
end