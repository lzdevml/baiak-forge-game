function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return true
end

	if (getPlayerLevel(cid) < 300) then
		doTeleportThing(cid, fromPosition, false)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED) 
		doPlayerSendCancel(cid, "Você deve ser level 300+ para entrar na Eldritch Quest.")   
		return true
	else
		local checkP = getCreaturesFromArea({x = 828, y = 2486, z = 7}, {x = 935, y = 2547, z = 7}, true)
		if (#checkP > 0) then
			for i=1, #checkP do
				pid = checkP[i]
				if (getPlayerIp(pid) == getPlayerIp(cid)) then
					doTeleportThing(cid, fromPosition, false)
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
					doCreatureSay(cid, "Deus ta vendo esse mc ai...", TALKTYPE_MONSTER, getCreaturePosition(cid))
					return true
				else
					if (getPlayerIp(pid) < 1) then
						doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)), false)
					end
				end
			end
		end
	end

	doTeleportThing(cid, {x = 849, y = 2529, z = 7}, false)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
    return true
end