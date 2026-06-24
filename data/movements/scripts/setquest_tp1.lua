local config = {
	pos = {x = 974, y = 2454, z = 8} -- para onde o tp vai levar
}

function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
        return false
    end
	
	if item.itemid == 12818 then
		if getGlobalStorageValue(cid, 30079) - os.time() > 0 then
			doTeleportThing(cid, config.pos)
			doSendMagicEffect(getCreaturePosition(cid), 10)
		else
			doTeleportThing(cid, fromPosition)
			doSendMagicEffect(getCreaturePosition(cid), 10)
		end
	end
   return true
end