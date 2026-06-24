function getDistanceBetween(fromPosition, toPosition)
local x, y = math.abs(fromPosition.x - toPosition.x), math.abs(fromPosition.y - toPosition.y)
local diff = math.max(x, y)
if(fromPosition.z ~= toPosition.z) then
diff = diff + 9 + 6
end
return diff
end

local minDist = 3

function onTarget(cid, target)
if (isNpc(target) and getDistanceBetween(getThingPos(cid), getThingPos(target)) <= minDist) then
doCreatureSay(cid, "hi", TALKTYPE_PRIVATE_PN, false, target)
doCreatureSay(cid, "trade", TALKTYPE_PRIVATE_PN, false, target)
doCreatureSay(cid, "travel", TALKTYPE_PRIVATE_PN, false, target)
end
return not (isNpc(target))
end