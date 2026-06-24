local config = {

	item = 13445, 	-- ID do item
	count = 1, 		-- Qnt de item que será removida
	charges = 1800,  -- Charges
	
	remove = 9020, 	-- Item que será removido
	countr = 25, 	-- Qnt do item que será removida 

	texto = "Você comprou star amulet. Custou 25 Tokens.",
	texto2 = "Tokens insuficientes. Precisa de 25 Tokens para comprar star amulet.",
	effect = 15

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if doPlayerRemoveItem(cid, config.remove, config.countr) then
		doPlayerSendTextMessage(cid, 22, config.texto)
		local item = doPlayerAddItem(cid, config.item, config.count)
		doItemSetAttribute(item, "charges", config.charges)
		doSendMagicEffect(fromPosition, config.effect)
	else
		doPlayerSendTextMessage(cid, 22, config.texto2)
	end
	return true
end