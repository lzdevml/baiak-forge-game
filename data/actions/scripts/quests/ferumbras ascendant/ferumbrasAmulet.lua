function onUse(cid, item, fromPosition, itemEx, toPosition)

	local amulet = getPlayerSlotItem(cid, CONST_SLOT_NECKLACE)
	if amulet ~= item then
		doPlayerSendTextMessage(cid, 25, "You need to equip the amulet to try use it.")
		return true
	end
	if item.itemid == 25423 then
		if math.random(2) == 1 then
			doCreatureAddHealth(cid, 1000)
			doPlayerSendTextMessage(cid, 25, "Magical sparks whirl around the amulet as you use it and you was healed.")
		else
			doCreatureAddMana(cid, 1000)
			doPlayerSendTextMessage(cid, 25, "Magical sparks whirl around the amulet as you use it and you was restored.")
		end
		doTransformItem(itemEx.uid, 25424)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
		return true
	elseif item.itemid == 25424 then
		doPlayerSendTextMessage(cid, 25, "You are tired of the last use of the amulet, you must wait for the recharge.")
	end
	return true
end
