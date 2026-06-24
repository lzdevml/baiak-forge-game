Fire = {
	storages = {172354, 172355}, -- storage Count
	players = {min = 2, max = 30}, -- min, max players no evento
	minLevel = 80, -- level minimo para entrar no event
	rewards = {{8981, 5}, {6527, 75}}, -- premios que vai receber
	timeToStartEvent = 30, -- segundos para começar o evento
	CheckTime = 5, -- time to check event
	teleport = {{x=151, y=43, z=7}, {x=2070, y=173, z=7}}, -- posição do teleport, posição para onde o jogador vai
	arena = {{x=2055, y=160, z=7}, {x=2088, y=184, z=7}} -- posição começo e final da area
}

Fire_Days = {
	["Monday"] = {"11:00", "17:30", "23:30"}, -- Segunda-feira
	["Tuesday"] = {"11:00", "17:30", "23:30"}, -- Terça-feira
	["Wednesday"] = {"11:00", "17:30", "23:30"}, -- Quarta-feira
	["Thursday"] = {"11:00", "17:30", "23:30"}, -- Quinta-feira
	["Friday"] = {"11:00", "17:30", "23:30"}, -- Sexta-feira
	["Saturday"] = {"11:00", "17:30", "23:30"}, -- Sábado
	["Sunday"] = {"11:00", "17:30", "23:30"} -- Domingo
}

function removeFireTp()
	local t = getTileItemById(Fire.teleport[1], 1387).uid
	return t > 0 and doRemoveItem(t) and doSendMagicEffect(Fire.teleport[1], CONST_ME_POFF)
end

function ZerarStorFire()
	setGlobalStorageValue(Fire.storages[1], 0)
	setGlobalStorageValue(Fire.storages[2], 0)
end

function getPlayersInFireEvent()
	local t = {}
	for _, pid in pairs(getPlayersOnline()) do
		if isInRange(getPlayerPosition(pid), Fire.arena[1], Fire.arena[2]) then
			t[#t+1] = pid
		end
	end
	return t
end

function getFireRewards(cid, items)
	local backpack = doPlayerAddItem(cid, 1995, 1) -- backpackID
	for _, i_i in ipairs(items) do
		local item, amount = i_i[1],i_i[2]
		if isItemStackable(item) or amount == 1 then
			doAddContainerItem(backpack, item, amount)
		else
			for i = 1, amount do
				doAddContainerItem(backpack, item, 1)
			end
		end
	end
end

function doFireInArea(n)
	if #getPlayersInFireEvent() > 1 then
		for i = 1, n do
			local pos = {x=math.random(Fire.arena[1].x, Fire.arena[2].x), y=math.random(Fire.arena[1].y,Fire.arena[2].y), z=Fire.arena[1].z}
			local m = getTopCreature(pos).uid
			doSendDistanceShoot({x = pos.x - math.random(4, 6), y = pos.y - 5, z = pos.z}, pos, CONST_ANI_ICE)
			addEvent(doSendMagicEffect, 150, pos, CONST_ME_LOSEENERGY)
			if m ~= 0 and isPlayer(m) then
				doSendMagicEffect(getCreaturePosition(m), CONST_ME_WATERSPLASH)
				doCreatureSay(m, "Ooooh", TALKTYPE_ORANGE_1)
				local corpse = doCreateItem(3058, 1, getPlayerPosition(m))
				doItemSetAttribute(corpse, "description", "You recognize " .. getCreatureName(m) .. ". He was killed by Rain.")
				doSendMagicEffect(getPlayerPosition(m), CONST_ME_POFF)
				doTeleportThing(m, getTownTemplePosition(getPlayerTown(m)))
				doPlayerSendTextMessage(m, MESSAGE_EVENT_ADVANCE, "[The Rain Event] You died from the rain.")
			end
		end
		local x = 2700-(200*n)
		addEvent(doFireInArea, x <= 0 and 500 or x, n+1)
	elseif #getPlayersInFireEvent() == 1 then
		local cid = getPlayersInFireEvent()[1]
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		getFireRewards(cid, Fire.rewards)
		doBroadcastMessage("[The Rain Event] O evento terminou. O ganhador do evento foi: ".. getCreatureName(cid).. ". Congratulations!", MESSAGE_EVENT_ADVANCE)
		ZerarStorFire()
	else
		doBroadcastMessage("[The Rain Event] Não houve ganhadores no evento.", MESSAGE_EVENT_ADVANCE)
		ZerarStorFire()
	end
end

function CheckFireEvent(delay)
	if getGlobalStorageValue(Fire.storages[1]) ~= (Fire.players.max+1) then
		if delay > 0 and getGlobalStorageValue(Fire.storages[1]) < Fire.players.max then
			doBroadcastMessage("[The Rain Event] Vai começar em " .. delay .. " minutos! O teleporte está na sala de eventos e será fechado quando o evento começar!", MESSAGE_STATUS_WARNING)
		elseif delay == 0 and getGlobalStorageValue(Fire.storages[1]) < Fire.players.min then
			for _, cid in pairs(getPlayersInFireEvent()) do
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			end
			removeFireTp()
			doBroadcastMessage("[The Rain Event] O evento não pode começar devivo a poucos jogadores participantes.\n São necessários ao menos " .. Fire.players.min .. " players para iniciar o evento!", MESSAGE_STATUS_WARNING)
			ZerarStorFire()
		elseif delay == 0 and getGlobalStorageValue(Fire.storages[1]) >= Fire.players.min then
			removeFireTp()
			doBroadcastMessage("[The Rain Event] Boa Sorte! O evento vai começar em "..Fire.timeToStartEvent.." segundos. Prepare-se!")
			addEvent(doFireInArea, Fire.timeToStartEvent*1000, 1)
		end
		addEvent(CheckFireEvent, 60000, delay-1)
	end
end