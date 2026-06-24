function onStepIn(cid, item, position, fromPosition)


	local config = {

		msgDenied = "Olá "..getCreatureName(cid)..". Você não é vip donate adquira agora mesmo em nósso site: Tibia-Global.Net",

		msgWelcome = "Seja Bem Vindo a Área donate "..getCreatureName(cid).." "
	}


	if not isVip(cid) then
		doTeleportThing(cid, fromPosition)
		doPlayerPopupFYI(cid, config.msgDenied)
		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_POFF)
		return true
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, config.msgWelcome)
	return true
end
