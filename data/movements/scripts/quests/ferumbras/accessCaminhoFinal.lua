function onStepIn(cid, item, fromPosition)
	local pos = {x = 33630, y = 32650, z = 12}
   	if getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageAcessoFinalFerumbras) == 1 then
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
   	else
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end