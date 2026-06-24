function onLogin(cid)
	if (getPlayerStorageValue(cid, bomberman.inGameStorage) ~= -1) then
		setPlayerStorageValue(cid, bomberman.inGameStorage, -1)
	end
	return true
end

function onThrow(cid, target)
	if isPlayer(target) then
		if (getPlayerStorageValue(target, bomberman.inGameStorage) ~= -1) then
			doPlayerSendCancel(cid, "Você não pode empurrar aqui.")
			return false
		end
	end
	return true
end