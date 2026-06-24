function onStepIn(cid, item, pos)

local thrower = {x = 231, y = 720, z = 15}
local back = {x = 205, y = 418, z = 13}
local go = {x = 260, y = 705, z = 15}

    if item.actionid == 16773 then
		doTeleportThing(cid,thrower)
		else
	if item.actionid == 16774 then
		doTeleportThing(cid,back)
		else
		if item.actionid == 16772 then
		doTeleportThing(cid,go)
        end
    return 1
end 
end
end
