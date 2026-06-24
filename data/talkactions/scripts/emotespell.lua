function onSay(cid, words, param)		
	if param == "on" then
		if getPlayerStorageValue(cid, 35001) ~= 1 then
			setPlayerStorageValue(cid, 35001, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Emote spells: ON")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You emoted spells is already activated. (by default!)")
		end

	elseif param == "off" then
		if getPlayerStorageValue(cid, 35001) == 1 then
			setPlayerStorageValue(cid, 35001, 0)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Emote spells: OFF")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You emoted spells is already disabled.")
		end

	elseif param == "" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Use command: !emotespell on | !emotespell off")
    end
    return true
end