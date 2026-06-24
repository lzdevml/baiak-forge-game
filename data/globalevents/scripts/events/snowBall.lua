local function isInWallArray(pos)
    for k = 0, table.getn(SBW_WALLSID) do
        if (getTileItemById(pos, SBW_WALLSID[k]).itemid == SBW_WALLSID[k]) then
			return true    
        end	
    end
	return false
end

local function endsnowball()
	local score = {}
	local rem_ = getCreaturesFromArea(SBW_AREA[1], SBW_AREA[2], true)
	for i=1, #rem_ do
		pid = rem_[i]
		if getPlayerStorageValue(pid, SBW_INEVENT) > 0 then
			table.insert(score, {getCreatureName(pid), getPlayerStorageValue(pid, SBW_SCORE)})
			doPlayerSetStorageValue(pid, SBW_INEVENT, 0)
			doPlayerSetStorageValue(pid, SBW_SCORE, 0)
			doPlayerSetStorageValue(pid, SBW_AMMO, 0)
			doTeleportThing(pid, SBW_TPEND)
		end
	end

	table.sort(score, function(a, b) return a[2] > b[2] end)
	local hora = os.date("%X")
	local data = os.date("%x")	
	if table.getn(score) > 0 then
		if SBW_ADDREWARD then
			for _, pid in ipairs(getPlayersOnline()) do
				if getCreatureName(pid) == score[1][1] then
					for op,ad in pairs(SBW_REWARDS) do
						doPlayerAddItem(pid, ad[1], ad[2])
					end
					break
                end
            end
        end

        doBroadcastMessage("[SNOWBALL WAR] Foi encerrado! Parabéns ao jogador "..score[1][1].." que vençeu o Evento SnowBall com "..score[1][2].." pontos.")
    end
	return true
end

local function moveToEvent()
	local moveP = getCreaturesFromArea(SBW_WAITROOM[1], SBW_WAITROOM[2], true)
	if (#moveP > 4) then
		for i=1, #moveP do
			pid = moveP[i]
			local posti = {}
			local isPossibleToTeleportPlayer = false
			while (isPossibleToTeleportPlayer == false) do
				posti = Position(math.random(SBW_AREA[1].x, SBW_AREA[2].x), math.random(SBW_AREA[1].y, SBW_AREA[2].y), 7)
				if (isInWallArray(posti) == FALSE) then
					isPossibleToTeleportPlayer = true
				end
			end

			doTeleportThing(pid, posti)
			doPlayerSetStorageValue(pid, SBW_INEVENT, 1)
			doPlayerSetStorageValue(pid, SBW_AMMO, SBW_MINAMMO)
			doPlayerSetStorageValue(pid, SBW_SCORE, 0)
			doPlayerSendTextMessage(pid, 27, "[SNOWBALL WAR] Seja bem vindo! Aqui estão os comandos que Você vai usar durante o evento:\n!snowball atirar -- Atira uma bola de neve.\n!snowball info -- Mostra seus pontos de jogos e a quantia de bolas de neve que você possui no momento. Também mostra o ranking de pontos do evento.\n Recarregue suas bolas de neve clicando na bola de neve em frente ao gerador no centro do campo.\nÉ recomendado adicionar estes comandos em sua hotkeys.")               														
		end
		
		doRemoveItem(getTileItemById(SBW_TP, 1387).uid)
		addEvent(endsnowball, SBW_DURATION*1000*60)
		doBroadcastMessage(SBW_MSGSTART)
	else
		for i=1, #moveP do
			pid = moveP[i]
			doTeleportThing(pid, getTownTemplePosition(getPlayerTown(pid)))
		end

		doRemoveItem(getTileItemById(SBW_TP, 1387).uid)
		doBroadcastMessage("[SNOWBALL WAR] Evento não foi iniciado por falta de jogadores. A quantidade mínma de jogadores para participar do evento é 5.")
	end
end

function onTime()
	local time = os.date("*t")
	local timeopen1 = math.ceil(SBW_TIMEWAIT / 4)
	local timeopen2 = math.ceil(SBW_TIMEWAIT / 2)
	if (SBW_STARTAUTO) and (isInArray(SBW_DAYS,time.wday)) then
		setGlobalStorageValue(45701, 1)
		doBroadcastMessage(SBW_MSGWARNING)
		addEvent(doBroadcastMessage, timeopen1*1000*60, "[SNOWBALL WAR] - Resta(m) ".. timeopen2 .." minuto(s) para iniciar o evento!")
		if (timeopen2 ~= timeopen1) then
			addEvent(doBroadcastMessage, timeopen2*1000*60, "[SNOWBALL WAR] - Resta(m) ".. timeopen1 .." minuto(s) para iniciar o evento!")
		end

		addEvent(moveToEvent, SBW_TIMEWAIT*1000*60)
		if SBW_TFS == "0.3" then
			doItemSetAttribute(doCreateItem(1387, SBW_TP), "aid", 35077)
		else
			doSetItemActionId(doCreateItem(1387, SBW_TP), 35077)
		end
	end
	return true
end