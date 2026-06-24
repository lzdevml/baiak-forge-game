function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local posPrimeira = {x = 33427, y = 32850, z = 12}
	local posSegunda = {x = 33308, y = 32378, z = 12}
	if getPlayerStorageValue(cid, 98041) == 1 then
   		doTeleportThing(cid, posPrimeira)
   		doSendMagicEffect(posPrimeira, 10)
   	elseif getPlayerStorageValue(cid, 98041) == 2 or getPlayerStorageValue(cid, 98041) < 1 then
   		doTeleportThing(cid,posSegunda)
   		doSendMagicEffect(posSegunda, 10)
   	end
end