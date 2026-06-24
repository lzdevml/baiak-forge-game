local conditionBlack = {}
local conditionRed = {}

function onStepIn(cid, item, position, fromPosition)
	if (not isPlayer(cid)) then return true end
	if getPlayerSex(cid) == 0 then
		conditionBlack = {lookType = 142, lookHead = 114, lookBody = 114, lookLegs = 49, lookFeet = 114, lookTypeEx = 0, lookAddons = 0}
	else
		conditionBlack = {lookType = 134, lookHead = 114, lookBody = 114, lookLegs = 49, lookFeet = 114, lookTypeEx = 0, lookAddons = 0}
	end

	if getPlayerSex(cid) == 0 then
		conditionRed = {lookType = 136, lookHead = 114, lookBody = 97, lookLegs = 30, lookFeet = 76, lookTypeEx = 0, lookAddons = 0}
	else
		conditionRed = {lookType = 128, lookHead = 114, lookBody = 97, lookLegs = 30, lookFeet = 76, lookTypeEx = 0, lookAddons = 0}
	end

	if getPlayerAccess(cid) > 3 then
		return doTeleportThing(cid, _Lib_Battle_Info.TeamOne.pos)
	end

	if getPlayerLevel(cid) < 80 then
		doCreatureSay(cid, "Only for level 80+", TALKTYPE_ORANGE_1, false, 0, position)
		doTeleportThing(cid, fromPosition, true)
		return true
	end

	local checkPlayers = getCreaturesFromArea(_Lib_Battle_Info.areaEvent[1], _Lib_Battle_Info.areaEvent[2], true)
	if (#checkPlayers > 0) then
		for i=1, #checkPlayers do
			pid = checkPlayers[i]
			if (getPlayerIp(pid) == getPlayerIp(cid)) then
				doTeleportThing(cid, fromPosition, false)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
				doPlayerSendCancel(cid, "[CS Battle Event] Só é permitido 1 jogador por IP dentro do evento.")
				return true
			end
		end
	end

	if getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
		local getMyTeam = getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) < getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage) and {_Lib_Battle_Info.TeamOne.storage, _Lib_Battle_Info.TeamOne.pos, _Lib_Battle_Info.TeamOne.name, conditionBlack} or {_Lib_Battle_Info.TeamTwo.storage, _Lib_Battle_Info.TeamTwo.pos, _Lib_Battle_Info.TeamTwo.name, conditionRed}
		doSetCreatureOutfit(cid, getMyTeam[4], -1)
		setPlayerStorageValue(cid,getMyTeam[1], 1)
		setGlobalStorageValue(getMyTeam[1], getGlobalStorageValue(getMyTeam[1])+1)
		doTeleportThing(cid, getMyTeam[2])
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[CS Battle Event] Você entrou no time: " .. getMyTeam[3] .. "!")
		setGlobalStorageValue(_Lib_Battle_Info.storage_count, getGlobalStorageValue(_Lib_Battle_Info.storage_count)-1)
		registerCreatureEvent(cid, "CSBattle_Combat")
		registerCreatureEvent(cid, "CSBattle_Death")
	end

	if getGlobalStorageValue(_Lib_Battle_Info.storage_count) == 0 then
		removeBattleTp()
		doBroadcastMessage("[CS Battle Event] Evento vai começar em 2 minutos! Monte sua estratégia e boa sorte!")
		addEvent(doBroadcastMessage, 2*60*1000-500, "[CS Battle Event] O Evento começou!")
		addEvent(OpenWallBattle, 2*60*1000)
	end
	return true
end