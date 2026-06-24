function onDeath(cid, corpse, deathList)
	local position = getCreaturePosition(cid)
	if getCreatureName(cid) == "Ferumbras Soul Splinter" then
		doCreateMonster("Ferumbras Essence", position)
	end
	return true
end