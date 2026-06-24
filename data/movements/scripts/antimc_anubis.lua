local para_onde_o_jogador_vai = {x=19882, y=20089, z=7}
local area = {
	[1] = {{x = 19872, y = 20076, z = 7}, {x = 20010, y = 20169, z = 7}}
}

function onStepIn(cid, item, position, fromPosition, toPosition)
if (not isPlayer(cid)) then
	return true
end

    for _, v in pairs(area) do
        for _, pid in pairs(getPlayersOnline()) do
            if (getPlayerIp(pid) == getPlayerIp(cid) and isInRange(getThingPos(pid), v[1], v[2])) then
                doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
				doCreatureSay(cid, "[GUERRA JUSTA] Só é permitido 1 jogador por IP no Castle 21h.", TALKTYPE_MONSTER, getCreaturePosition(cid))
                return true
            end
        end
    end
	
	doTeleportThing(cid, para_onde_o_jogador_vai, false)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
    return true
end