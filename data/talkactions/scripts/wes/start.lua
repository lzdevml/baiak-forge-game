function onSay(cid, words, param, channel)
local area = {{x = 19985, y = 20155, z = 7},{x = 20062, y = 20204, z = 2}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
RemoverSpaw1()
RemoverSpaw2()
RemoverSpaw3()
RemoverSpaw4()
RemoverSpaw5()
RemoverSpaw6()
RemoverSpaw7()
RemoverSpaw8()
RemoverSpaw9()
end
end
return true
end

function RemoverSpaw9()
local area = {{x = 20006, y = 20041, z = 9},{x = 20137, y = 20155, z = 4}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end 

function RemoverSpaw8()
local area = {{x = 20174, y = 20232, z = 7},{x = 20280, y = 20350, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end 

function RemoverSpaw1()
local area = {{x = 19970, y = 20244, z = 7},{x = 20144, y = 20350, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end


function RemoverSpaw2()
local area = {{x = 19937, y = 20351, z = 7},{x = 20126, y = 20468, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end

function RemoverSpaw3()
local area = {{x = 19750, y = 20237, z = 7},{x = 19833, y = 20340, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end


function RemoverSpaw4()
local area = {{x = 19918, y = 19999, z = 7},{x = 19991, y = 20075, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end


function RemoverSpaw5()
local area = {{x = 19847, y = 20233, z = 7},{x = 19955, y = 20346, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end

function RemoverSpaw6()
local area = {{x = 19751, y = 20237, z = 7},{x = 19835, y = 20339, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end

function RemoverSpaw7()
local area = {{x = 19918, y = 19996, z = 7},{x = 19992, y = 20073, z = 7}}
local topos = {x=160, y=51, z=7}
local remove, clean = true, true
for x = area[1].x - 1, area[2].x + 1 do
for y = area[1].y - 1, area[2].y + 1 do
local pos = {x=x, y=y, z=area[1].z}
local m = getTopCreature(pos).uid
if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
if clean ~= false then doCleanTile(pos, false) end
if m ~= 0 and isPlayer(m) then doTeleportThing(m, topos) end
end
end
return true
end