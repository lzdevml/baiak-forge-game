local function hasBoss()

	local id = getGlobalStorageValue("bossSys")
	if id ~= -1 then
		if isMonster(id) then
			return true
		else
			return false
		end
	end
	return false
end



local postp, postpentrada = {x = 144, y = 640, z = 7}



function onSay(cid, words, param, channel)
	if not hasBoss() then
        doCreateTeleport(1387, postpentrada, postp)
		local id = doCreateMonster("Boss Imohtep", {x = 38, y = 340, z = 7})
		setGlobalStorageValue("bossSys", id)
		doBroadcastMessage("O Boss Imohtep nasceu! Corram para matar ele -> Teleport no templo!")
		doPlayerSendTextMessage(cid, 27, "Você executou o comando Imohtep Manual, o Boss ja foi criado!")
	end
	return true
end