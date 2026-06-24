local lvldodge = 35034

function onStatsChange(cid, attacker, type, combat, value)
	local playerPos = getCreaturePos(cid)
	if type == STATSCHANGE_MANALOSS and isCreature(attacker) then
		if (getPlayerStorageValue(cid, lvldodge)*0.3) >= math.random (0,1000) then
			doSendAnimatedText(getCreaturePos(cid), "MISS", COLOR_LIGHTBLUE)
			return false
		end

	elseif type == STATSCHANGE_HEALTHLOSS and isCreature(attacker) then
		if (getPlayerStorageValue(cid, lvldodge)*0.3) >= math.random (0,1000) then
			doSendAnimatedText(getCreaturePos(cid), "Dodge", COLOR_MAYABLUE)
			return false
		end
	end
	return true
end