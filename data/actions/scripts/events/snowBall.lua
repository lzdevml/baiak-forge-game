function onUse(cid, item, frompos, item2, topos)
	if item.actionid == 35076 then
		if (SBW_AMMOINFI) then
			doPlayerSendTextMessage(cid, 27, "[SnowBall WAR] Bolas de neve infinitas! Não precisa comprar.")
			return true
		else
			if (getPlayerStorageValue(cid, SBW_SCORE) > 0) and (getPlayerStorageValue(cid, SBW_AMMO) < 30) then
				doPlayerSetStorageValue(cid, SBW_SCORE, getPlayerStorageValue(cid, SBW_SCORE)-1)
				doPlayerSetStorageValue(cid, SBW_AMMO, getPlayerStorageValue(cid, SBW_AMMO)+SBW_AMMOBUY)
				doPlayerSendTextMessage(cid, 27, "[SnowBall WAR] Você trocou 1 ponto de jogo por " .. SBW_AMMOBUY .. "x bolas de neve.")
				doSendMagicEffect(getCreaturePosition(cid), 4)
			else
				doPlayerSendTextMessage(cid, 27, "[SnowBall WAR] Você não possui pontos de jogo suficiente ou já está carregando muitas bolas de neve.")  
				return true
			end
		end
	end
	return true
end