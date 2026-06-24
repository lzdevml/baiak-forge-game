local config = {
	effectonuse = 14, -- efeito que sai
	levelsdodge = 100,  --- leveis que terão
	storagedodge = 35034 -- storage que será verificado
}
   
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (getPlayerStorageValue(cid, config.storagedodge) < config.levelsdodge) then
		if doRemoveItem(item.uid, 1) then
			doSendMagicEffect(fromPosition, config.effectonuse)
			doSendAnimatedText(fromPosition, "+Protect+", COLOR_YELLOW)
			doPlayerSendTextMessage(cid, 22, "You advanced your protect to level: ["..(getPlayerStorageValue(cid, config.storagedodge)+1).."/100].")
			setPlayerStorageValue(cid, config.storagedodge, getPlayerStorageValue(cid, config.storagedodge)+1)
		else
			doPlayerSendTextMessage(cid, 25, "ERROR! Please contact the administrator.")
			return true
		end

	elseif (getPlayerStorageValue(cid, config.storagedodge) >= config.levelsdodge) then
		doPlayerSendTextMessage(cid, 22, "Você já atingiu o nível DEUS de Protect Skill.")
		return true
	end
	return true
end