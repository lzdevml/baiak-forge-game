--[[	

			Real Team Battle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

function onTime()
	if getGlobalStorageValue("MEU_OVO5") - os.time() <= 0 then
		countDownTeleport({x = 154, y = 48, z = 7}, 300)
		setGlobalStorageValue("MEU_OVO5", os.time()+25*60)
	end
	realTeamBattle.open(4)
	return true
end