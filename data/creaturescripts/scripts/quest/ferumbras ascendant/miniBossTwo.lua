function onDeath(cid, corpse, deathList)
	local bosses = {
		[1] = {name = "The Lord of the Lice", storage = Storage.FerumbrasAscension.storageLiberaAtalho1},
		[2] = {name = "The Shatterer", storage = Storage.FerumbrasAscension.storageBoss8},
	}
	for k, l in pairs(bosses) do
		if getCreatureName(cid) == bosses[k].name then
			for j=1, #deathList do
				if getPlayerStorageValue(deathList[j], bosses[k].storage) == -1 then
		            setPlayerStorageValue(deathList[j], bosses[k].storage, 1)
		        end
			end
		end
	end
    return true
end