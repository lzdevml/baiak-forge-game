function onThink(interval, lastExecution)
	if Fire_Days[os.date("%A")] then
		local hrs = tostring(os.date("%X")):sub(1, 5)
		if isInArray(Fire_Days[os.date("%A")], hrs) and getGlobalStorageValue(Fire.storages[2]) <= 0 then	
			setGlobalStorageValue(45701, 1)
			local tp = doCreateItem(1387, 1, Fire.teleport[1])
			doItemSetAttribute(tp, "aid", 45111)
			CheckFireEvent(Fire.CheckTime)
			setGlobalStorageValue(Fire.storages[1], 0) 
		end
	end
	return true
end