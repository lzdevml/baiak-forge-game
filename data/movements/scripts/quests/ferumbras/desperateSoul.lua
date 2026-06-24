function onStepIn(cid, item, position, fromPosition)
	local monster = getCreatureName(cid)
	local pos = {x = 33454, y = 32810, z = 11}
	local storageGlobalSoul = 98007

	if not monster or monster ~= "Desperate Soul" then
		return true
	end
	doRemoveCreature(cid)
	doSendMagicEffect(pos, CONST_ME_POFF)
	setGlobalStorageValue(storageGlobalSoul, 1)
	addEvent(function()
		setGlobalStorageValue(storageGlobalSoul, 0)
	end, 120000)
	return true
end
