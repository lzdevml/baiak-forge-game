function onStepIn(cid, item, fromPosition)
	local pos1 = {x = 33275, y = 32391, z = 9}
	local pos2 = {x = 33275, y = 32391, z = 8}
	if getPlayerStorageValue(cid, 98012) == 1 then
   		doTeleportThing(cid, pos1)
   		doSendMagicEffect(pos1, 10)
   	else
   		doTeleportThing(cid, pos2)
   		doSendMagicEffect(pos2, 10)
   	end
end