function onStatsChange(cid, attacker, type, combat, value)
	local monster = "Ascending Ferumbras" -- nome do boss
	if not isMonster(cid) then 
		return true 
	end 
	if type == STATSCHANGE_HEALTHLOSS and getCreatureName(cid):lower() == monster:lower() then
		if #getCreatureSummons(cid) ~= 0 then
			return false
		end
	end
	return true
end