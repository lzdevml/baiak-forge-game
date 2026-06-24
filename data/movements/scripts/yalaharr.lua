function onStepIn(cid, item, pos)

local thais = {x = 377, y = 540, z = 2}
local kurwa = {x = 376, y = 535, z = 3}
local kuzwa = {x = 337, y = 540, z = 3}

    if item.actionid == 9105 then
		doTeleportThing(cid,kurwa)
		doSendMagicEffect(getCreaturePosition(cid),17)
		else
	if item.actionid == 9106 then
		doTeleportThing(cid,thais)
		doSendMagicEffect(getCreaturePosition(cid),17)
		else
	if item.actionid == 24061 then
		doTeleportThing(cid,kuzwa)
		doSendMagicEffect(getCreaturePosition(cid),48)
        end
    return 1
end 
end
end

