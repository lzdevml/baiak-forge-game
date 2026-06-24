function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local pos = {x = 33237, y = 31477, z = 13}
   	if getPlayerStorageValue(cid, Storage.FerumbrasAscension.storageLiberaAtalho1) == 1 then
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
   	else
   		doPlayerSendTextMessage(cid, 22, "You do not have access to the shortcut, make your release.")
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end