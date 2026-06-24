function onAdvance(cid, skill, oldLevel, newLevel)

local config = {
[30] = {item = 2160, count = 3},
[50] = {item = 2160, count = 5},
[80] = {item = 2160, count = 7},
[100] = {item = 2160, count = 10},
[130] = {item = 2160, count = 12},
[150] = {item = 2160, count = 15},
[180] = {item = 2160, count = 20},
[200] = {item = 2160, count = 30},
[240] = {item = 2160, count = 50},
}

if skill == 8 then
for level, info in pairs(config) do
if newLevel >= level and (getPlayerStorageValue(cid, 307009) == -1 or not (string.find(getPlayerStorageValue(cid, 307009), "'" .. level .. "'"))) then
doPlayerAddItem(cid, info.item, info.count)
local itm = info.item == 2160 and info.count * 10 .. "k" or info.count.."kk" 
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Parabéns! Você atingiu o level "..newLevel.." e ganhou "..itm..".")
local sat = getPlayerStorageValue(cid, 307009) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 307009) .. ",'" .. level .. "'" 
setPlayerStorageValue(cid, 307009, sat)
end
end
end

if skill == SKILL__LEVEL then
local maxh = getCreatureMaxHealth(cid)
local maxm = getCreatureMaxMana(cid)
doCreatureAddHealth(cid, maxh)
doCreatureAddMana(cid, maxm)
end

return true
end