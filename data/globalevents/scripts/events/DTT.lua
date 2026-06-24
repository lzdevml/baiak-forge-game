local DTT_Days = {1, 2, 3, 4, 5, 6, 7} -- dias de semana que vai abrir

function onTime()
	local time = os.date("*t")
	local timeopen1_ = math.ceil(dtt.wait_time / 4)
	local timeopen2_ = math.ceil(dtt.wait_time / 2)
	if (isInArray(DTT_Days, time.wday)) then	
		setGlobalStorageValue(45701, 1)
		local tp = doCreateItem(1387, dtt.pos.tp_create)
        doItemSetAttribute(tp, "aid", 9801)
		dtt.resetGlobalStorages()
		dtt.trucatePlayersInEvent()
		dtt.removeItemsTower()
		doBroadcastMessage(dtt.msg.warning)
		addEvent(doBroadcastMessage, timeopen1_*1000*60, "[Defend The Tower] - Resta(m) ".. timeopen2_ .." minuto(s) para iniciar o evento!")
		if (timeopen2_ ~= timeopen1_) then
			addEvent(doBroadcastMessage, timeopen2_*1000*60, "[Defend The Tower] - Resta(m) ".. timeopen1_ .." minuto(s) para iniciar o evento!")
		end
		addEvent(dtt.start, dtt.wait_time*1000*60,nil)
	end
    return true
end