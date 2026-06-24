function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local escada1 = {x = 33271, y = 32396, z = 8}
	local escada2 = {x = 33271, y = 32396, z = 9}
   	if getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss1) == 2 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss2) == 2 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss3) == 2 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss4) == 2 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss5) == 2 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss6) == 2 and getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageBoss7) == 2 then
   		if item.itemid == 1387 then
   			doTeleportThing(cid, {x = 33275, y = 32391, z = 9})
   			doSendMagicEffect(getPlayerPosition(cid), 10)
   		else
   			doTeleportThing(cid, escada2)
   		end
   	else
   		if item.itemid == 1387 then
   			doTeleportThing(cid, {x = 33275, y = 32391, z = 8})
   			doSendMagicEffect(getPlayerPosition(cid), 10)
   		else
            if getPlayerStorageValue(cid, 1098012) < 1 then
               setPlayerStorageValue(cid, 1098012, 1)
               if getPlayerStorageValue(cid, 98013) < 0 then
                  setPlayerStorageValue(cid, 98013, 0)
               end
            end
   			doTeleportThing(cid, escada1)
   		end
   	end
end