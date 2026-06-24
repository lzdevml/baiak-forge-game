terra = {65783}
 levels = {
[-1] = 2149, -- Small Emerald
[5] = 2146, -- Small Sapphire
[10] = 2145, -- Small Diamond
[15] = 2150, -- Small Amethyst
[20] = 2147, -- Small Ruby
[25] = 7761, -- small enchanted emerald
[30] = 7759, -- Small Enchanted Sapphiire
[35] = 7762, -- Small Enchanted Amethyst
[40] = 7760, -- Small Enchanted Ruby
[45] = 2156, --- red gem
[50] = 2158, -- blue gem
[55] = 2155, -- green gem 
[60] = 2153, -- violet gem  
[65] = 2154, -- yellow gem
[70] = 6527, -- eventcoins
[999] = 7760 -- Small EnchanRuby
} 

local config = {
storage = 19333,
chance = 10, --- chance de achar um item ou não
k = 1000, --- constante de level.. quanto maior, mais fácil é upar. (a fórmula é level ao quadrado dividido pela constante)
experience = 19334
}


function onUse(cid, item, fromPosition, itemEx, toPosition)


local drops = {}


function getDrops(cid)
for i= -1,getPlayerStorageValue(cid, config.storage) do
if levels[i] then
table.insert(drops, levels[i])
end
end
return true
end


if isInArray(terra, itemEx.uid) then
getDrops(cid)
doPlayerSetStorageValue(cid, config.experience, getPlayerStorageValue(cid, config.experience)+1)
local experience = getPlayerStorageValue(cid, config.experience)
if experience >= (8+(getPlayerStorageValue(cid, config.storage)^7))/config.k then
doPlayerSetStorageValue(cid, config.storage, getPlayerStorageValue(cid, config.storage)+1)
doPlayerSendTextMessage(cid, 27, "Congratulations, you have leveled! Your currect level is "..getPlayerStorageValue(cid, config.storage) ..".")
doBroadcastMessage("[MiningSystem]  Congratulations, "..getCreatureName(cid).." have leveled! Your currect level is "..getPlayerStorageValue(cid, config.storage) .."! ", MESSAGE_STATUS_WARNING)
if getPlayerStorageValue(cid, config.storage) == 50 then
doPlayerSendTextMessage(cid, 20, "For reaching level "..getPlayerStorageValue(cid, config.storage) .." you have been awarded with Mining Helmet.")
doPlayerAddItem(cid, 7497, 1, true)
end
end
if config.chance >= math.random(1,100) then
if #drops >= 1 then
local item = drops[math.random(1,#drops)]
doPlayerSendTextMessage(cid, 27, "You have found a "..getItemNameById(item)..".")
doPlayerAddItem(cid, item, 1, true)
end
doSendMagicEffect(toPosition, 3)
else
doSendMagicEffect(toPosition, 2)
return true
end
elseif itemEx.itemid == item.itemid then
doPlayerSendTextMessage(cid, 27, "You're currenctly level "..getPlayerStorageValue(cid, config.storage)..".")
else
return false
end
return true
end