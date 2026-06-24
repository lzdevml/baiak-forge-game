function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local posPrimeira = {x = 33466, y = 32389, z = 13}
	local posSegunda = {x = 33308, y = 32378, z = 12}
	if getPlayerStorageValue(cid, 98042) == 1 then
   		doTeleportThing(cid, posPrimeira)
   		doSendMagicEffect(posPrimeira, 10)
   	elseif getPlayerStorageValue(cid, 98042) == 2 or getPlayerStorageValue(cid, 98042) < 1 then
   		doTeleportThing(cid,posSegunda)
   		doSendMagicEffect(posSegunda, 10)
   	end
end