function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local pos = {x = 33321, y = 32319, z = 13}
	if getPlayerStorageValue(cid, 98013) == 1 then
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
   	else
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end