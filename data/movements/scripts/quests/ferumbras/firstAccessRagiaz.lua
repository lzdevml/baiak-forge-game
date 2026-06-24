function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local pos = {x = 33415, y = 32379, z = 13}
   	if getPlayerStorageValue(cid, 98036) == 5 then
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
   	else
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end