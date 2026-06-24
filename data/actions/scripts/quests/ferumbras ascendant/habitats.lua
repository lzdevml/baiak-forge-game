local habitats = {
	[1] = {aid = 35001, monsterCreate = "Lovely Deer", 			monsterReceive = "Lovely Frazzlemaw",	posBixo = {x = 33619, y = 32666, z = 12},	posInicial = {x = 33611, y = 32658, z = 12}, posFinal = {x = 33626, y = 32674, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatDeer},
	[2] = {aid = 35002, monsterCreate = "Lovely Frazzlemaw", 	monsterReceive = "Lovely Deer", 		posBixo = {x = 33642, y = 32666, z = 12},	posInicial = {x = 33633, y = 32658, z = 12}, posFinal = {x = 33648, y = 32673, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatFrazzlemaw},

	[3] = {aid = 35003, monsterCreate = "Lovely Scorpion", 		monsterReceive = "Lovely Rotworm", 		posBixo = {x = 33618, y = 32683, z = 12},	posInicial = {x = 33611, y = 32676, z = 12}, posFinal = {x = 33626, y = 32691, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatScorpion},
	[4] = {aid = 35004, monsterCreate = "Lovely Rotworm", 		monsterReceive = "Lovely Scorpion", 	posBixo = {x = 33642, y = 32684, z = 12},	posInicial = {x = 33633, y = 32675, z = 12}, posFinal = {x = 33648, y = 32691, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatRotworm},

	[5] = {aid = 35005, monsterCreate = "Lovely Polar Bear", 	monsterReceive = "Lovely Snake", 		posBixo = {x = 33617, y = 32701, z = 12},	posInicial = {x = 33611, y = 32694, z = 12}, posFinal = {x = 33626, y = 32709, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatPolarBear},
	[6] = {aid = 35006, monsterCreate = "Lovely Snake", 		monsterReceive = "Lovely Polar Bear", 	posBixo = {x = 33642, y = 32702, z = 12},	posInicial = {x = 33633, y = 32694, z = 12}, posFinal = {x = 33648, y = 32709, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatSnake},

	[7] = {aid = 35007, monsterCreate = "Lovely Yielothax", 	monsterReceive = "Lovely Souleater", 	posBixo = {x = 33617, y = 32718, z = 12},	posInicial = {x = 33611, y = 32712, z = 12}, posFinal = {x = 33626, y = 32724, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatYielothax},
	[8] = {aid = 35008, monsterCreate = "Lovely Souleater", 	monsterReceive = "Lovely Yielothax", 	posBixo = {x = 33642, y = 32716, z = 12},	posInicial = {x = 33633, y = 32712, z = 12}, posFinal = {x = 33648, y = 32724, z = 12}, pair = Storage.FerumbrasAscension.storageHabitatSouleater},
}

local storageAccessBasir = Storage.FerumbrasAscension.storageAccessBasir
local time = 1

function verifyMonsterInArea(monsterName, posInicio, posFim)
	for x = posInicio.x, posFim.x do
		for y = posInicio.y, posFim.y do
			posAtual = {x = x, y = y, z = posInicio.z, stackpos = 253}
			if isMonster(getThingFromPos(posAtual).uid) then
				if getCreatureName(getThingFromPos(posAtual).uid) == monsterName then
					return true	
				end
			end
		end
	end
end

function removeCreatureInArea(monsterName, posInicio, posFim)
	for x = posInicio.x, posFim.x do
		for y = posInicio.y, posFim.y do
			posAtual = {x = x, y = y, z = posInicio.z, stackpos = 253}
			if isMonster(getThingFromPos(posAtual).uid) then
				if getCreatureName(getThingFromPos(posAtual).uid) == monsterName then
					doRemoveCreature(getThingFromPos(posAtual).uid)
					return true	
				end
			end
		end
	end
end


function onUse(cid, item, fromPosition, itemEx, toPosition, target)
---- EXHAUST -------------------------------------------------------
        if(getPlayerStorageValue(cid,storage) >= os.time()) then
                doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
                return TRUE
        end
        doPlayerSetStorageValue(cid, storage, os.time() + time)
---- -------- -------------------------------------------------------

	for i,v in pairs(habitats) do
		local LeverAid = habitats[i].aid
		local monsterCreate = habitats[i].monsterCreate
		local posBixo = habitats[i].posBixo
		local monsterReceive = habitats[i].monsterReceive
		local posInicial = habitats[i].posInicial
		local posFinal = habitats[i].posFinal
		local PairHabitat = habitats[i].pair


		if item.aid == LeverAid then
			if verifyMonsterInArea(monsterReceive, posInicial, posFinal) then
				if getPlayerStorageValue(cid, PairHabitat) == -1 then
					doCreatureSay(cid, "Congratulations.", TALKTYPE_MONSTER_SAY)
					setPlayerStorageValue(cid,PairHabitat,1)
					setGlobalStorageValue(PairHabitat,-1)
					removeCreatureInArea(monsterReceive, posInicial, posFinal)
					doSendMagicEffect(getPlayerPosition(cid), 14)
					
					-- Storage Bazir:
					if getPlayerStorageValue(cid, storageAccessBasir) == -1 then
						setPlayerStorageValue(cid, storageAccessBasir,1)
					else
						setPlayerStorageValue(cid, storageAccessBasir, getPlayerStorageValue(cid, storageAccessBasir)+1)
					end

					return false
				else
					if getPlayerStorageValue(cid, LeverAid) == -1 then
						doCreatureSay(cid, "The room should not contain monsters for another summon!", TALKTYPE_MONSTER_SAY)
					else
						doCreatureSay(cid, "Already Completed!", TALKTYPE_MONSTER_SAY)
						doSendMagicEffect(getThingPos(item.uid), 2)
					end
					return true
				end

				
			end
			if getPlayerStorageValue(cid,LeverAid) == -1 then
				if getGlobalStorageValue(LeverAid) == -1 then
					doCreateMonster(monsterCreate, posBixo)
					doCreatureSay(cid, "Lure ".. monsterCreate .." for your natural habitat.", TALKTYPE_MONSTER_SAY)					
					setGlobalStorageValue(LeverAid,1)
					doSendMagicEffect(getThingPos(item.uid), 62)
				else
					doCreatureSay(cid, "The ".. monsterCreate .." is already summoned. Lure it for your natural habitat.", TALKTYPE_MONSTER_SAY)
					doSendMagicEffect(getThingPos(item.uid), 2)
					return true
				end
			else
				if getPlayerStorageValue(cid, PairHabitat) == -1 then
					doCreatureSay(cid, "You must bring a monster here...", TALKTYPE_MONSTER_SAY)					
				else
					doCreatureSay(cid, "Completed.", TALKTYPE_MONSTER_SAY)
					doSendMagicEffect(getThingPos(item.uid), 2)
				end
				return true
			end
		end
		
	end
	return false
end
