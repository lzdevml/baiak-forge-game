local aids = {	
	[61520] = 1,
	[61521] = 2,
	[61522] = 3,
	[61523] = 4
}

local magiaAtk = createConditionObject(CONDITION_EXHAUST)
setConditionParam(magiaAtk, CONDITION_PARAM_SUBID, 2)
setConditionParam(magiaAtk, CONDITION_PARAM_TICKS, -1)

local magiaSupport = createConditionObject(CONDITION_EXHAUST)
setConditionParam(magiaSupport, CONDITION_PARAM_SUBID, 4)
setConditionParam(magiaSupport, CONDITION_PARAM_TICKS, -1)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if tonumber(os.date("%H")) ~= 16 then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O horário de bomberman já terminou.")
		doTeleportThing(cid, getTownTemplePosition(1))
		return true
	end

	local arenaNumber = aids[item.actionid]
	if arenaNumber then
		if bomberman.isArenaFree(arenaNumber) then
			local arena = bomberman.arenas[arenaNumber]
			local players = getCreaturesFromArea(arena.fromPosLeaver, arena.toPosLeaver, true)
			if (#players == 4) then
				local corner, ips  = 1, {}
				for i=1, #players do
					pid = players[i]
					if (getPlayerLevel(pid) < 80) then
						doSendMagicEffect(getCreaturePosition(pid), CONST_ME_TUTORIALARROW)
						doCreatureSay(pid, "Este jogador é inferior ao level 80.", TALKTYPE_MONSTER, false, 0, getCreaturePosition(pid))
						return true
					end

					local ip = getPlayerIp(pid)
					if bomberman.ips[ip] then
						if bomberman.ips[ip] >= os.time() then
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "O IP de "..getCreatureName(pid).." já foi usado para jogar nos últimos 10 minutos. Ele deve aguardar "..convertTimeString(bomberman.ips[ip] - os.time()).." para jogar novamente.")
							doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_ORANGE, "Seu IP já foi usado para jogar nos últimos 10 minutos. Você deve esperar "..convertTimeString(bomberman.ips[ip] - os.time()).." para jogar novamente.")
							return true
						end
					end

					if isInArray(ips, ip) then
						doPlayerSendCancel(cid, "jogadores com o mesmo IP não podem participar juntos.")
						return true
					end

					table.insert(ips, ip)
				end
				for v=1, #players do
					pid_ = players[v]
					local ip = getPlayerIp(pid_)
					bomberman.ips[ip] = (os.time() + (10*60))
					if corner == 1 then
						doTeleportThing(pid_, arena.fromPos)
					elseif corner == 2 then
						doTeleportThing(pid_, arena.rightTopCorner)
					elseif corner == 3 then
						doTeleportThing(pid_, arena.toPos)
					elseif corner == 4 then
						doTeleportThing(pid_, arena.leftBottomCorner)
					end

					doCreatureSetStorage(pid_, bomberman.oldSpeedStorage, getCreatureSpeed(pid_))
					doCreatureSetStorage(pid_, bomberman.bombLimitStorage, 1)
					doCreatureSetStorage(pid_, bomberman.bombStorage, 1000)
					doCreatureSetStorage(pid_, bomberman.radiusStorage, 1)
					doCreatureSetStorage(pid_, bomberman.inGameStorage, arenaNumber)
					if getCreatureConditionInfo(pid_, CONDITION_HASTE) then
						doRemoveCondition(pid_, CONDITION_HASTE)
					end
					if getCreatureConditionInfo(pid_, CONDITION_INVISIBLE) then
						doRemoveCondition(pid_, CONDITION_INVISIBLE)
					end
					doChangeSpeed(pid_, 220 - getCreatureSpeed(pid_))
					registerCreatureEvent(pid_, "Bomberman_AntiPush")
					doAddCondition(pid_, magiaAtk)
					doAddCondition(pid_, magiaSupport)
					doPlayerSendTextMessage(pid_, MESSAGE_INFO_DESCR, "Você entrou no bomberman. Use !bomb para colocar bombas e não seja explodido rs")
					corner = corner + 1
				end

				setGlobalStorageValue(arena.storage, 1)
				local currentPosition
				local create = true
				local unavailables = {{x = arena.fromPos.x, y = arena.fromPos.y}, {x = arena.rightTopCorner.x, y = arena.rightTopCorner.y}, {x = arena.leftBottomCorner.x, y = arena.leftBottomCorner.y}, {x = arena.toPos.x, y = arena.toPos.y}, {x = arena.fromPos.x + 1, y = arena.fromPos.y}, {x = arena.fromPos.x, y = arena.fromPos.y + 1}, {x = arena.rightTopCorner.x - 1, y = arena.rightTopCorner.y}, {x = arena.rightTopCorner.x, y = arena.rightTopCorner.y + 1}, {x = arena.toPos.x - 1, y = arena.toPos.y}, {x = arena.toPos.x, y = arena.toPos.y - 1}, {x = arena.leftBottomCorner.x + 1, y = arena.leftBottomCorner.y}, {x = arena.leftBottomCorner.x, y = arena.leftBottomCorner.y - 1}}
				for xx = arena.fromPos.x, arena.toPos.x do
					for yy = arena.fromPos.y, arena.toPos.y do
						create = true
						currentPosition = {x = xx, y = yy, z = arena.fromPos.z}
						for _, pair in next, unavailables do
							if pair.x == xx and pair.y == yy then
								create = false
								break;
							end
						end
						if create then
							local block = getTileItemById(currentPosition, bomberman.blockId)
							if block and block.uid and block.uid > 0 then
								create = false
							end
							if create then
								local stone = getTileItemById(currentPosition, bomberman.stoneId)
								if stone and stone.uid and stone.uid > 0 then
									create = false
								end
								if create then
									if math.random(100) < 70 then
										doCreateItem(bomberman.stoneId, 1, currentPosition)
									end
								end
							end
						end
					end
				end
			else
				doPlayerSendCancel(cid, "São necessários 4 jogadores para iniciar o bomberman.")
			end
		else
			doPlayerSendCancel(cid, "Esta arena já está ocupada. Aguarde até que o jogo termine.")
		end
	end
	return true
end