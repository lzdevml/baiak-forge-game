function onUse(cid, item, fromPosition, itemEx, toPosition)		
	if (not isPlayerPzLocked(cid)) then
		if getCreatureSkullType(cid) == SKULL_RED then
			doCreatureSetSkullType(cid, 0)
			db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você removeu seu Red Skull e zerou seus Frags. Para checar seus frags digite: !frags")

		elseif getCreatureSkullType(cid) == SKULL_BLACK then
			doCreatureSetSkullType(cid, 0)
			db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você removeu seu Black Skull e zerou seus Frags. Para checar seus frags digite: !frags")

		else
			db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você zerou seus Frags. Para checar seus frags digite: !frags")
		end

		doRemoveItem(item.uid, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você deve estar em 'Protect Zone' para usar este item.")
		return true
	end
	return true
end