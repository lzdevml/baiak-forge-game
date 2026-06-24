function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	doPlayerExitArena(cid)
     doPlayerSendTextMessage(cid, 27, "Você Foi levado para o templo, Bom Jogo!")	
    doSendMagicEffect(getThingPos(cid), 10)
	return true	
end
