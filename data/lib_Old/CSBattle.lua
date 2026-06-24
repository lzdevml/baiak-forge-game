_Lib_Battle_Info = {
	Reward = {exp = {true, 500000}, items = {true, 6527, 75}, premium_days = {false, 1}},
	TeamOne = {name = "Counter Terrorist", storage = 35085, pos = {x=2081,y=106,z=7}},
	TeamTwo = {name = "Terrorist",storage = 35086, pos = {x=2032,y=92,z=6}},
	storage_count = 35084,
	areaEvent = {{x=2028, y=72, z=6}, {x=2094, y=131, z=7}},
	tpPos = {x=151, y=43, z=7}, -- Onde o teleport vai aparecer
	limit_Time = 5 -- limite de tempo para entrar no evento
}

function resetBattle()
	setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
	setGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage, 0)
end

function OpenWallBattle()
local B = {
	{1544, {x=2077, y=103, z=7, stackpos = 1}},
	{1544, {x=2078, y=103, z=7, stackpos = 2}},
	{1544, {x=2079, y=103, z=7, stackpos = 2}},
	{1544, {x=2077, y=110, z=7, stackpos = 2}},
	{1544, {x=2078, y=110, z=7, stackpos = 1}},
	{1544, {x=2079, y=110, z=7, stackpos = 1}},
	{1544, {x=2031, y=89, z=6, stackpos = 1}},
	{1544, {x=2032, y=89, z=6, stackpos = 1}},
	{1544, {x=2033, y=89, z=6, stackpos = 1}},
	{1544, {x=2034, y=89, z=6, stackpos = 1}},
	{1544, {x=2035, y=89, z=6, stackpos = 2}},
	{1544, {x=2031, y=95, z=6, stackpos = 2}},
	{1544, {x=2032, y=95, z=6, stackpos = 1}},
	{1544, {x=2033, y=95, z=6, stackpos = 2}},
	{1544, {x=2034, y=95, z=6, stackpos = 1}},
	{1544, {x=2035, y=95, z=6, stackpos = 1}},
	{1544, {x=2036, y=95, z=6, stackpos = 2}}
}

	for i=1, #B do
		if getTileItemById(B[i][2], B[i][1]).uid == 0 then
			doCreateItem(B[i][1], 1, B[i][2])
		else
			doRemoveItem(getThingfromPos(B[i][2]).uid,1)
		end
	end
end

function doBroadCastBattle(type, msg)
	for _, cid in pairs(getPlayersOnline()) do
		if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(cid, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
			doPlayerSendTextMessage(cid,type,msg)
		end
	end
end

function removeBattleTp()
local t = getTileItemById(_Lib_Battle_Info.tpPos, 1387).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(_Lib_Battle_Info.tpPos, CONST_ME_POFF)
end

function getWinnersBattle(storage)
	local str, c = "" , 0
	local rem_ = getCreaturesFromArea(_Lib_Battle_Info.areaEvent[1], _Lib_Battle_Info.areaEvent[2], true)
	if (#rem_ > 0) then
		for i=1, #rem_ do
			pid = rem_[i]
			if getPlayerStorageValue(pid, storage) == 1 then
				if _Lib_Battle_Info.Reward.exp[1] == true then doPlayerAddExperience(pid, _Lib_Battle_Info.Reward.exp[2]) end
				if _Lib_Battle_Info.Reward.items[1] == true then doPlayerAddItem(pid, _Lib_Battle_Info.Reward.items[2], _Lib_Battle_Info.Reward.items[3]) end
				if _Lib_Battle_Info.Reward.premium_days[1] == true then doPlayerAddPremiumDays(pid, _Lib_Battle_Info.Reward.premium_days[2]) end	
				doRemoveCondition(pid, CONDITION_OUTFIT)			
				doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
				setPlayerStorageValue(pid, storage, -1)
				unregisterCreatureEvent(pid, "CSBattle_Combat")
				unregisterCreatureEvent(pid, "CSBattle_Death")
				c = c+1
			end
		end
	end

	str = str .. "[CS Battle Event] Evento finalizado! "..c.." Jogador"..(c > 1 and "es" or "").." do time "..(getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 and _Lib_Battle_Info.TeamTwo.name or _Lib_Battle_Info.TeamOne.name).." "..(c > 1 and "ganharam" or "ganhou").." o evento!"
	resetBattle()
	OpenWallBattle()
	return doBroadcastMessage(str)
end

function CheckEvent(delay)
	if delay > 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		doBroadcastMessage("[CS Battle Event] Faltam "..getGlobalStorageValue(_Lib_Battle_Info.storage_count).." players para dar início ao evento.")
	elseif delay == 0 and getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		local rem = getCreaturesFromArea(_Lib_Battle_Info.areaEvent[1], _Lib_Battle_Info.areaEvent[2], true)
		if (#rem > 0) then
			for i=1, #rem do
				pid_ = rem[i]
				if getPlayerStorageValue(pid_, _Lib_Battle_Info.TeamOne.storage) >= 1 or getPlayerStorageValue(pid_, _Lib_Battle_Info.TeamTwo.storage) >= 1 then
					doRemoveCondition(pid_, CONDITION_OUTFIT)
					doTeleportThing(pid_, getTownTemplePosition(getPlayerTown(pid_)))
					setPlayerStorageValue(pid_, _Lib_Battle_Info.TeamOne.storage, -1)
					setPlayerStorageValue(pid_, _Lib_Battle_Info.TeamTwo.storage, -1)
					unregisterCreatureEvent(pid_, "CSBattle_Combat")
					unregisterCreatureEvent(pid_, "CSBattle_Death")
				end
			end
		end

		doBroadcastMessage("[CS Battle Event] O evento não foi iniciado por falta de jogadores.")
		setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
		resetBattle()
		removeBattleTp()
	end

	addEvent(CheckEvent, 60000, delay-1)
end