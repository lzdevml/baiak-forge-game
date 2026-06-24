
local pos1 = {x=224, y=678, z=7, stackpos = 1}
local pos2 = {x=228, y=699, z=7, stackpos = 1}
local pos3 = {x=229, y=699, z=7, stackpos = 1}
local pos4 = {x=230, y=699, z=7, stackpos = 1}
local pos5 = {x=231, y=699, z=7, stackpos = 1}

function onTime()
doBroadcastMessage("[Castle War] The castle is open to new wars! [OPEN:12:00 CLOSED: 00:00]")
doRemoveItem(getThingfromPos(pos1).uid, 1)
doRemoveItem(getThingfromPos(pos2).uid, 1)
doRemoveItem(getThingfromPos(pos3).uid, 1)
doRemoveItem(getThingfromPos(pos4).uid, 1)
doRemoveItem(getThingfromPos(pos5).uid, 1)

return true
end