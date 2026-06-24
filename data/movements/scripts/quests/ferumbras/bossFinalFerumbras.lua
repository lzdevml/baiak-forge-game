function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local reward = {x = 333, y = 608, z = 5}
	local posSaida = {x = 249, y = 612, z = 5}
	if getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageFerumbrasFinal) == 1 then
   		doTeleportThing(cid, reward)
   		doSendMagicEffect(getPlayerPosition(cid), 10)
   		if getPlayerStorageValue(cid, 1098021) == 1 then
   			setPlayerStorageValue(cid, 1098021, 2)
   		end
   	elseif getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageFerumbrasFinal) >= 1 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageReward) >= 1 then
   		doTeleportThing(cid,posSaida)
   		doSendMagicEffect(getPlayerPosition(cid), 10)
   	end
end