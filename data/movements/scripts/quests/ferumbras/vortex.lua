function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local Vortex = GlobalStorage.FerumbrasAscension.vortex
	local targetMonster = getCreatureName(cid)

	if targetMonster == "Ferumbras Essence" then
		doRemoveCreature(cid)
		doSendMagicEffect(toPosition, CONST_ME_ENERGYAREA)
		setGlobalStorageValue(Vortex, getGlobalStorageValue(Vortex) + 1)
		if getGlobalStorageValue(Vortex) >= 8 then
			doCreateMonster("Destabilized Ferumbras", {x = 33392, y = 31473, z = 14})
			for i = 1, 15 do
				local xrande = math.random(-5, 5)
				local yrande = math.random(-5, 5)
				doCreateMonster("Rift Fragment", {x = 33392 + xrande, y = 31473 + yrande, z = 14})
			end
		end
	end
	return true
end