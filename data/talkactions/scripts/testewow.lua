dofile("./_woe.lua")

local config = woe_config

function onSay(cid, words, param, channel)
	if getGlobalStorageValue(722643) - os.time() <= 0 then -- CHECK DTT COM WAR CASTLE (EVITAR BUG)
		if not Woe.isTime() then
			doBroadcastMessage("[War Castle] A Batalha pelo castelo vai iniciar em 5 minutos.", config.bcType)
			doBroadcastMessage("[War Castle] A Batalha terá uma duração de " .. config.timeToEnd .. " minutos. O portal para o castelo se encontra no templo.", config.bcType)
			addEvent(doBroadcastMessage, 4 * 60 * 1000, "[War Castle] A Batalha pelo castelo vai iniciar em 1 minuto. O portal para o castelo se encontra no templo.", config.bcType)
			addEvent(setGlobalStorageValue, 5 * 60 * 1000, stor.WoeTime, 1)
		end
	else
		return false
	end
	return true
end 	