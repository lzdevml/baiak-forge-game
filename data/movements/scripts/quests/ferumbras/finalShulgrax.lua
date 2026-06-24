function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local posPrimeira = {x = 33459, y = 32817, z = 13}
	local posSegunda = {x = 33308, y = 32378, z = 12}
	if getPlayerStorageValue(cid, 98037) == 1 then
   		doTeleportThing(cid, posPrimeira)
   		doSendMagicEffect(posPrimeira, 10)
   	elseif getPlayerStorageValue(cid, 98037) == 2 or getPlayerStorageValue(cid, 98037) < 1 then
   		doTeleportThing(cid,posSegunda)
   		doSendMagicEffect(fromPosition, 2)
   	end
end