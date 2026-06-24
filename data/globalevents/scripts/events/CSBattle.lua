function onThink(interval, lastExecution)
	_Lib_Battle_Days = {
		["Monday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}},
		
		["Tuesday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}},
		
		["Wednesday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}},

		["Thursday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}},	
		
		["Friday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}},	
		
		["Saturday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}},	
		
		["Sunday"] = {
		["12:00"] = {players = 10},
		["14:00"] = {players = 10},
		["23:57"] = {players = 10}}	
	}

	if _Lib_Battle_Days[os.date("%A")] then
		hours = tostring(os.date("%X")):sub(1, 5)
		tb = _Lib_Battle_Days[os.date("%A")][hours]
		if tb and (tb.players % 2 == 0) then		
			setGlobalStorageValue(45701, 1)
			doSetItemActionId(doCreateItem(1387, _Lib_Battle_Info.tpPos), 35083)
			CheckEvent(_Lib_Battle_Info.limit_Time)
			doBroadcastMessage("[CS Battle Event] O teleport para o evento foi aberto! Vão ser "..tb.players.." jogadores divididos entre: "..((tb.players)/2).." VS "..((tb.players)/2))
			return setGlobalStorageValue(_Lib_Battle_Info.storage_count, tb.players)
		end
	end
	return true
end