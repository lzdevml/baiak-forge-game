local posBoss = {x = 33514, y = 32238, z = 12}
local posToBoss = {x = 33481, y = 32332, z = 13}

function verificaBoss(cid)
	for x = posBoss.x, posBoss.x  do
		for y = posBoss.y, posBoss.y do
			if isMonster(getThingFromPos({x = x, y = y, z = posBoss.z, stackpos = 253}).uid) then
				doTeleportThing(getThingFromPos({x = x, y = y, z = posBoss.z, stackpos = 253}).uid, posToBoss)
			end
		end
	end
end

function onDeath(cid, corpse, deathList)
	if getCreatureName(cid) == "Bone Capsule" then
		verificaBoss(cid)
	end
	return true
end
