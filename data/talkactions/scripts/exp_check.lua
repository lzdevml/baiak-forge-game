local nme = "Exp Check"

function onSay(cid, words, param)
	if tonumber(getPlayerStorageValue(cid,722362)) >= os.time() then
	doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você tem mais "..timeString(tonumber(getPlayerStorageValue(cid,722362)) - os.time()).." de Double Exp, aproveite.")
	elseif
		tonumber(getPlayerStorageValue(cid,722384)) >= os.time() then
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"Você tem mais "..timeString(tonumber(getPlayerStorageValue(cid,722384)) - os.time()).." de 20% Exp, aproveite.")
	else
		doPlayerSendCancel(cid, "Você não está sobre efeito de nenhum double exp.")
		
	end
	return true
end
