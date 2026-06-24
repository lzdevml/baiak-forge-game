function onLogin(cid)
	if getPlayerStorageValue(cid, WarConfigs.WarUrgentExit) == 1 then
		doPlayerWarUrgentExit(cid)
	end
	registerCreatureEvent(cid, "War_Cytis_Death")
	return true
end

function onLogout(cid)
	if getPlayerStorageValue(cid, WarConfigs.WarPlayerJoined) == 1 then
		doPlayerSendCancel(cid, "You can not log out at war.")
		return false
	else
		return true
	end
end

function onDeath(cid, corpse, deathList)
	deathInWarAntientrosa(cid)
	return true
end