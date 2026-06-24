function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
	local pos = {x = 33424, y = 32378, z = 12}
   		doTeleportThing(cid, pos)
   		doSendMagicEffect(pos, 10)
end