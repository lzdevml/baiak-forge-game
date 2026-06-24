function onStepIn(cid, item, position, fromPosition)

local config = {
	msgDenied = "Você nao e VIP compre agora mesmo!", -- será que é pq colocou o premium false/;
	msgWelcome = "Bem Vindo a area VIP!"
}
	
	if isPlayer(cid) then
		if isPremium(cid) == false then
			doTeleportThing(cid, fromPosition, true)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
			return TRUE
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
		return TRUE
	end
end