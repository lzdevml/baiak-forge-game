function onDeath(cid, corpse, killer)
function doReturnDeath()
	setGlobalStorageValue(24688, 0)
	setGlobalStorageValue(24686, none)
	setPlayerStorageValue(cid, 28680, 0)
end
	if getPlayerStorageValue(cid, 28680) == 1 then
		doReturnDeath()
	end

	if (getPlayerSlotItem(cid, 2).itemid == 7889) then
		doCreatureSetDropLoot(cid, false)
	end
    return TRUE
end