function onDeath(cid, corpse, deathList)
	local bosses = {
		[1] = {name = "Shulgrax", storage = Storage.FerumbrasAscension.storageBoss1},
		[2] = {name = "Plagirath", storage = Storage.FerumbrasAscension.storageBoss2},
		[3] = {name = "Zamulosh", storage = Storage.FerumbrasAscension.storageBoss3},
		[4] = {name = "Mazoran", storage = Storage.FerumbrasAscension.storageBoss4},
		[5] = {name = "Tarbaz", storage = Storage.FerumbrasAscension.storageBoss5},
		[6] = {name = "Ragiaz", storage = Storage.FerumbrasAscension.storageBoss6},
		[7] = {name = "Razzagorn", storage = Storage.FerumbrasAscension.storageBoss7},
		[8] = {name = "Ferumbras Mortal Shell", storage = Storage.FerumbrasAscension.storageFerumbrasFinal}
	}
	for k, l in pairs(bosses) do
		if getCreatureName(cid) == bosses[k].name then
			for j=1, #deathList do
				if getPlayerStorageValue(deathList[j], bosses[k].storage) == -1 then
		            setPlayerStorageValue(deathList[j], bosses[k].storage, 1)
		            doPlayerAddItem(deathList[j], 25172, 1)
		        elseif getPlayerStorageValue(deathList[j], bosses[k].storage) >= 1 then
		        	doPlayerAddItem(deathList[j], 25172, 1)
		        end
			end
		end
	end
    return true
end