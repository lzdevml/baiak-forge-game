local SafeZoneDays = {1, 2, 3, 4, 5, 6, 7} -- dias de semana que vai abrir

function onTime()
	local time = os.date("*t")
	if (isInArray(SafeZoneDays, time.wday)) then
		setGlobalStorageValue(45701, 1)
		doSetItemActionId(doCreateItem(1387, SafeZone.teleportPosition), 35087)
		setGlobalStorageValue(SafeZone.storages.open, 1)
		SafeZone.announce(SafeZone.waitingTime)
		addEvent(SafeZone.start, SafeZone.waitingTime*1000*60)
	end
	return true
end