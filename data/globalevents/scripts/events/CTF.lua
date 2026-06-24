local daysOpen = {
	"Monday-18:00", -- Segunda-Feira
	"Tuesday-18:00", -- Terça-Feira
	"Wednesday-18:00", -- Quarta-Feira
	"Thursday-18:00", -- Quinta-Feira
	"Friday-18:00", -- Sexta-Feira
	"Saturday-18:00", -- Sábado
	"Sunday-18:00" -- Domingo
}

function onThink(interval)
	if table.find(daysOpen, os.date("%A-%H:%M")) then
		if getStorage(ctfConfig.eventStorage) ~= 1 then
			setGlobalStorageValue(45701, 1)
			openCtfEvent()
			doSetStorage(ctfConfig.eventStorage, 1)
		end
	end
	return true
end