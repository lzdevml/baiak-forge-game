function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local pos = {x = 33615, y = 32619, z = 10}
	if getPlayerStorageValue(cid, 98022) == 7 or getPlayerStorageValue(cid, 98022) == 8 then
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
   	else
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end