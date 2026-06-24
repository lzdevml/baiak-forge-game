local config = {
	effectonuse = 14, -- efeito que sai
	levelscrit = 100,  --- leveis que terão
	storagecrit = 35033 -- storage que será verificado
}
   
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, config.storagecrit) < config.levelscrit) then
		if doRemoveItem(item.uid, 1) then
			doSendMagicEffect(fromPosition, config.effectonuse)
			doSendAnimatedText(fromPosition, "+Letal+", COLOR_RED)
			doPlayerSendTextMessage(cid, 22, "You advanced your letal skill to level: ["..(getPlayerStorageValue(cid, config.storagecrit)+1).."/"..config.levelscrit.."].")
			setPlayerStorageValue(cid, config.storagecrit, getPlayerStorageValue(cid, config.storagecrit)+1)
		else
			doPlayerSendTextMessage(cid, 25, "ERROR! Please contact the administrator.")
			return true
		end
		
	elseif (getPlayerStorageValue(cid, config.storagecrit) >= config.levelscrit) then
		doPlayerSendTextMessage(cid, 22, "Você já atingiu o nível MAX de Letal Skill.")
		return true
    end
	return true
end