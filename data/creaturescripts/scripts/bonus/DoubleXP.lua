-- Monday = Segunda
-- Tuesday = Terça
-- Wednesday = Quarta
-- Thursday = Quinta
-- Friday = Sexta
-- Saturday = Sabado
-- Sunday = Domingo

function onLogin(cid)
	DoubleDays = {"Saturday"}
	if isInArray(DoubleDays, os.date("%A")) then
		doPlayerSetRate(cid, SKILL__LEVEL, 2.0)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Double XP]\nVoce foi recompensado com DOUBLE!\nAproveite.")
	end
	return true
end