function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local posPrimeira = {x = 33614, y = 32676, z = 14}
	local posSegunda = {x = 33308, y = 32378, z = 12}
	if getPlayerStorageValue(cid, 98040) == 1 then
   		doTeleportThing(cid, posPrimeira)
   		doSendMagicEffect(posPrimeira, 10)
   	elseif getPlayerStorageValue(cid, 98040) == 2 or getPlayerStorageValue(cid, 98040) < 1 then
   		doTeleportThing(cid,posSegunda)
   		doSendMagicEffect(posPrimeira, 10)
   	end
end