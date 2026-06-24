function onUse(cid, item, fromPosition, itemEx, toPosition)
	if #mwParticipantes() == 0 then
		local p1,p2 = getThingFromPos(treinamw.pos.player1).uid,getThingFromPos(treinamw.pos.player2).uid
		if not isPlayer(p1) or not isPlayer(p2) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, treinamw.msgs.falta_player)
			doSendMagicEffect(fromPosition,2)
			return false
		end
		doTeleportThing(p1, treinamw.pos.sala_do_trainer)
		doTeleportThing(p2, treinamw.pos.sala_do_trainer)
		local m = doCreateMonster(treinamw.nome_do_monstro,treinamw.pos.spawn_monstro)
		setGlobalStorageValue(treinamw.storages.monstro,m)
		setGlobalStorageValue(treinamw.storages.jogadores,tabletostring({p1,p2}))
		verificaTrainerMw()
	end
	return true
end