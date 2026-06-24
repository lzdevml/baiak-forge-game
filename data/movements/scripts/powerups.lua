local speed1 = createConditionObject(CONDITION_HASTE)
setConditionParam(speed1, CONDITION_PARAM_TICKS, 10*1000)
setConditionParam(speed1, CONDITION_PARAM_SPEED, 300)


local t = {
from = {x=840, y=1171, z=7},
to = {x=856, y=1183, z=7}, 
storage = {
max = 10002,
radius = 10003
}
}
function onStepIn(cid, item, pos, fromPos)
if isInRange(pos, t.from, t.to) then
if item.itemid == 8304 then
local n = getPlayerStorageValue(cid, t.storage.max)
if n < 3 then
setPlayerStorageValue(cid, t.storage.max, n + 1)
doRemoveItem(item.uid)
doSendMagicEffect(pos, CONST_ME_FIREATTACK)
end
elseif item.itemid == 2644 then
local n = getPlayerSlotItem(cid, CONST_SLOT_FEET)
if getPlayerLevel(cid) >=1 then
doAddCondition(cid, speed1)
doRemoveItem(item.uid)
doSendMagicEffect(pos, CONST_ME_ENERGYHIT)
end
elseif item.itemid == 8310 then
local n = getPlayerStorageValue(cid, t.storage.radius)
if n < 4 then
setPlayerStorageValue(cid, t.storage.radius, n + 1)
doRemoveItem(item.uid)
doSendMagicEffect(pos, CONST_ME_GROUNDSHAKER)
end
end
end
end