local itemId = 13212

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 9827 then
		local tab = getLegendTable(cid, item)
		local obj = tab[item.actionid]
		if not obj then
			print('[Legend Lever ERROR] The table not FOUND.')
		return true
		end

		if getGameState() == GAMESTATE_STARTUP then
			doPlayerSendCancel(cid, 'As roleta foram desabilitadas para salvar o servidor.')
			return true
		end

		if obj.busy then
			doPlayerSendCancel(cid, 'Aguarde o resultado final do jogador ' .. obj.ownerName .. '.')
			return true
		end

		if (not doPlayerRemoveItem(cid, itemId, 1)) then
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Você não possui 1x ' .. getItemInfo(itemId).name .. ' para tentar a sorte.')
			return true
		end

		doTransformItem(item.uid, 9828)
		doDecayItem(item.uid)
		doCreatureSetNoMove(cid, true)
		return legendLever:random(cid, obj, item)

	elseif item.itemid == 9828 then
		return doPlayerSendCancel(cid, 'Aguarde um pouco para poder utilizar esta alavanca novamente.')
	end
end