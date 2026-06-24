local config = {
	pos = {x = 5374, y = 316, z = 5} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12829 then
		doTeleportThing(cid, config.pos)
		doSendMagicEffect(getCreaturePosition(cid), 10)
		doPlayerPopupFYI(cid, "A desgraça apenas começou.")
	end
   return true
end