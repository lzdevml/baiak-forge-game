function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local pos = {x = 33630, y = 32650, z = 12}
   	if getPlayerStorageValue(cid, 98011) == 1 then
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
   	else
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end