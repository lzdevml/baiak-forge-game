function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
   local posAtalho = {x = 33198, y = 31426, z = 11}
   	if getPlayerStorageValue(cid, 98009) == 1 then
   		doPlayerSendTextMessage(cid, 22, "Congratulations. You have now gained access to the shortcut.")
   		doTeleportThing(cid, posAtalho)
   		doSendMagicEffect(posAtalho, 10)
         if getPlayerStorageValue(cid, 1098015) == 2 then
            setPlayerStorageValue(cid, 1098015, 3)
         end
   	else
   		doPlayerSendTextMessage(cid, 22, "You have not made any boss attacks, so wait for the time to get kicked out of the room.")
   		doTeleportThing(cid,fromPosition)
   		doSendMagicEffect(fromPosition, 2)
   	end
end