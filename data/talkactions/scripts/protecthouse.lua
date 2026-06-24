function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite: /protecthouse on/off para ligar ou desligar a proteção da house.")
		return true
	end

	local parame = tostring(param)
	if parame == "on" then
		local house = getHouseFromPos(getCreaturePosition(cid))
		if not house then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não está dentro de sua house!")
			return true
		end
		if getHouseInfo(house, false).owner ~= getPlayerGUID(cid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não é o dono desta house!")
			return true
		end
		if isHouseProtected(house) == true then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A sua house já está com a proteção ativada!")
			return true
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você ativou a proteção de sua house! Apenas você ou seu marriage poderá mover, adicionar ou remover items.")
		setHouseProtection(house, true)

	elseif parame == "off" then
		local house = getHouseFromPos(getCreaturePosition(cid))
		if not house then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não está dentro de nenhuma house!")
			return true
		end
		if getHouseInfo(house, false).owner ~= getPlayerGUID(cid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não é o dono desta house!")
			return true
		end
		if isHouseProtected(house) == false then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A sua house já está com a proteção desativada!")
			return true
		end
		
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você desativou a proteção de sua house! Agora qualquer player poderá mover, adicionar ou remover items.")
		setHouseProtection(house, false)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite: /protecthouse on/off para ligar ou desligar a proteção da house.")
		return true
	end
	
	return true
end
