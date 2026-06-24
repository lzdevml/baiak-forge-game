function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return true
end

	if (getPlayerLevel(cid) < 100) then
		doTeleportThing(cid, fromPosition, false)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED) 
		doPlayerSendCancel(cid, "Você deve ser level 100+ para entrar no castelo.")   
		return true
	else
		local checkP = getCreaturesFromArea({x=585, y=33, z=7}, {x=698, y=49, z=7}, true)
		if (#checkP > 0) then
			for i=1, #checkP do
				pid = checkP[i]
				if (getPlayerIp(pid) == getPlayerIp(cid)) then
					doTeleportThing(cid, fromPosition, false)
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
					doCreatureSay(cid, "Deus ta vendo você tentando entrar com 2 char com o mesmo IP...", TALKTYPE_MONSTER, getCreaturePosition(cid))
					return true
				else
					if (getPlayerIp(pid) < 1) then
						doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)), false)
					end
				end
			end
		end
	end

	doTeleportThing(cid, {x = 557, y = 419, z = 9}, false)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
    return true
end