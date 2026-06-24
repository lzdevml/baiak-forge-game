local c = __GUILD_TOURNEY_CFG

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if isPlayer(cid) then
		
		registerCreatureEvent(cid, "GuildTourney")
		doTeleportThing(cid, newpos, true)
	end
return true
end