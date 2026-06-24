function onStatsChange(cid, attacker, type, combat, value)
	if isMonster(cid) then
		local t, spectator = getSpectators({x = 152, y = 78, z = 10}, 11, 11)
    	local check = 0
	    if #t ~= nil then
	        for i = 1, #t do
			spectator = t[i]
	            if string.lower(getCreatureName(spectator)) == "minion of gaz'haragoth" then
	               check = check + 1
	            end
	        end
	    end
		if string.lower(getCreatureName(cid)) == "gaz'haragoth" then
			local hp = (getCreatureHealth(cid) / getCreatureMaxHealth(cid)) * 100
			if ((check < 2) and hp <= 95) or ((check < 4) and hp <= 75) or ((check < 6) and hp <= 55) or ((check < 10) and hp <= 35) then
				for j = 1, 1 do
					doCreatureSay(cid, "Minions! Follow my call!", TALKTYPE_MONSTER_SAY, nil, nil, getCreaturePosition(cid))
					doCreateMonster("Minion Of Gaz'haragoth", getCreaturePosition(cid))
				end
			end
		end
	end
	return true
end

