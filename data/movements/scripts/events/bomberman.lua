function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if item.itemid == 12820 then -- Velocidade
		doChangeSpeed(cid, 50)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você ganhou mais velocidade!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)

	elseif item.itemid == 12821 then -- Radius
		doCreatureSetStorage(cid, bomberman.radiusStorage, getCreatureStorage(cid, bomberman.radiusStorage) + 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O poder de fogo da sua bomba aumentou!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)

	elseif item.itemid == 12822 then -- Imunidade
		doCreatureSetStorage(cid, bomberman.imuneStorage, os.time() + 10)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você está imune por 10 segundos!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)

	elseif item.itemid == 12823 then -- Mais bombas
		doCreatureSetStorage(cid, bomberman.bombLimitStorage, getCreatureStorage(cid, bomberman.bombLimitStorage) + 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Agora você pode soltar mais bombas de uma vez!")
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
		doRemoveItem(item.uid)
	end
	return true
end