local crystals = {
	[1] = {fromPosition = {x = 290, y = 602, z = 5}, toPosition = {x = 292, y = 604, z = 5}, crystalPosition = {x = 291, y = 603, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal1},
	[2] = {fromPosition = {x = 294, y = 602, z = 5}, toPosition = {x = 296, y = 604, z = 5}, crystalPosition = {x = 295, y = 603, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal2},
	[3] = {fromPosition = {x = 297, y = 605, z = 5}, toPosition = {x = 299, y = 607, z = 5}, crystalPosition = {x = 298, y = 606, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal3},
	[4] = {fromPosition = {x = 297, y = 609, z = 5}, toPosition = {x = 299, y = 611, z = 5}, crystalPosition = {x = 298, y = 610, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal4},
	[5] = {fromPosition = {x = 294, y = 612, z = 5}, toPosition = {x = 296, y = 614, z = 5}, crystalPosition = {x = 295, y = 613, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal5},
	[6] = {fromPosition = {x = 290, y = 612, z = 5}, toPosition = {x = 292, y = 614, z = 5}, crystalPosition = {x = 291, y = 613, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal6},
	[7] = {fromPosition = {x = 287, y = 609, z = 5}, toPosition = {x = 289, y = 611, z = 5}, crystalPosition = {x = 288, y = 610, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal7},
	[8] = {fromPosition = {x = 287, y = 605, z = 5}, toPosition = {x = 289, y = 607, z = 5}, crystalPosition = {x = 288, y = 606, z = 5, stackpos = 1} , globalStorage = GlobalStorage.FerumbrasAscension.crystal8}
}


local AllCrystals = GlobalStorage.FerumbrasAscension.allCrystals

function onDeath(cid, corpse, deathList)
	local xrand = math.random(-10, 10)
	local yrand = math.random(-10, 10)
	local pos = {x = 293 + xrand, y = 608 + yrand, z = 5}

	doCreateMonster("Rift Invader", pos)

	for i = 1, #crystals do
		local crystal = crystals[i]
		if isInRange(getCreaturePosition(cid), crystal.fromPosition, crystal.toPosition) and getThingfromPos(crystal.crystalPosition).itemid == 9789 then
			if getGlobalStorageValue(crystal.globalStorage) > 8 then
				local item = crystal.crystalPosition
				if not item then
					return true
				end
				doTransformItem(getThingfromPos(item).uid, 9788)
				setGlobalStorageValue(AllCrystals, (getGlobalStorageValue(AllCrystals) + 1))
			end
			if getGlobalStorageValue(AllCrystals) == 8 then
				doCreatureSay(cid, "NOOOOOOOOOOO!", TALKTYPE_MONSTER_SAY, nil, nil, {x = 293, y = 608, z = 5})
				doCreatureSay(cid, "FERUMBRAS BURSTS INTO SOUL SPLINTERS!", TALKTYPE_MONSTER_SAY, nil, nil, {x = 293, y = 608, z = 5})
				doRemoveCreature(getThingFromPos({x = 293, y = 608, z = 5, stackpos = 253}).uid)
				for a = 1, #crystals do
					local crystalEffect = crystals[i]
					doSendMagicEffect(crystalEffect.crystalPosition, CONST_ME_ENERGYAREA)
					local xrande = math.random(-5, 5)
					local yrande = math.random(-5, 5)
					doCreateMonster("Ferumbras Soul Splinter", {x = 293 + xrande, y = 608 + yrande, z = 5})
				end
				setGlobalStorageValue(AllCrystals, 0)
			end
			setGlobalStorageValue(crystal.globalStorage, getGlobalStorageValue(crystal.globalStorage) + 1)
			doCreatureSay(cid, "The negative energy of the rift creature is absorbed by the crystal!", TALKTYPE_MONSTER_SAY, nil, nil, crystal.crystalPosition)
			doCreatureSay(cid, "ARGH!", TALKTYPE_MONSTER_SAY, nil, nil, {x = 293, y = 608, z = 5})
		end
	end
	return true
end