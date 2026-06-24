function onDeath(cid, corpse, killer)
  
	local monstName = "The Horned Fox" -- nome do monstro
	local target = getCreatureTarget(cid) 
	if isMonster(cid) and (getCreatureName(cid) == monstName) then
		setPlayerStorageValue(killer[1], 111310, getPlayerStorageValue(killer[1], 111310) +3)
		doBroadcastMessage("The player "..getPlayerName(killer[1]).." destroyed one of the walls of the castle.")
		doSendMagicEffect(getPlayerPosition(target), 65)
	end
	return true
end