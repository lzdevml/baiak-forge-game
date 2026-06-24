function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local posPrimeira = {x = 33399, y = 32406, z = 15}
	if getPlayerStorageValue(cid, 98044) == 1 then
   		doTeleportThing(cid, posPrimeira)
   		doSendMagicEffect(pos, 10)
   	else
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end