function onStatsChange(cid, attacker, type, combat, value)
	if isMonster(cid) and (getCreatureName(cid) == "Barrier") then
		if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_HEALTHGAIN) then
			a = getCreatureHealth(cid) >= (getCreatureMaxHealth(cid)/2) and doSetItemOutfit(cid, 3766, -1) or doSetItemOutfit(cid, 3767, -1)
		end
	end
	return true
end