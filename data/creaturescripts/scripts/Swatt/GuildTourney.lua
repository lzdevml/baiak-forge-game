local c = __GUILD_TOURNEY_CFG

function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
	if isPlayer(cid) then
		health = getCreatureMaxHealth(cid) - getCreatureHealth(cid)
		doCreatureAddHealth(cid, health)
		unregisterCreatureEvent(cid, "GuildTourney")
		goToTemple(cid)
		return false
	end
return true
end