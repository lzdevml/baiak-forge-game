local chests = {
--01
[6000] = {storage = 87878798798, item = 13377, amount = 1}, -- Triplo EXP
[6001] = {storage = 87878798799, item = 20811, amount = 1}, -- Triplo EXP
[6002] = {storage = 87878798800, item = 12944, amount = 1}, -- Triplo EXP
--02
[6003] = {storage = 87878798801, item = 2197, amount = 1}, -- Triplo EXP
[6004] = {storage = 87878798802, item = 2323, amount = 1}, -- Triplo EXP
[6005] = {storage = 87878798803, item = 2131, amount = 1}, -- Triplo EXP
--03
[6006] = {storage = 87878798804, item = 2645, amount = 1}, -- Triplo EXP
[6007] = {storage = 87878798805, item = 2520, amount = 1}, -- Triplo EXP
--04
[6008] = {storage = 87878798806, item = 2502, amount = 1}, -- Triplo EXP
[6009] = {storage = 87878798807, item = 2503, amount = 1}, -- Triplo EXP
[6010] = {storage = 87878798808, item = 2504, amount = 1}, -- Triplo EXP
--05
[6011] = {storage = 87878798809, item = 2494, amount = 1}, -- Triplo EXP
[6012] = {storage = 87878798809, item = 2400, amount = 1}, -- Triplo EXP
[6013] = {storage = 87878798809, item = 2431, amount = 1}, -- Triplo EXP
[6014] = {storage = 87878798809, item = 2421, amount = 1}, -- Triplo EXP
--6
[6015] = {storage = 87878798810, item = 7390, amount = 1}, -- Triplo EXP
[6016] = {storage = 87878798810, item = 2435, amount = 1}, -- Triplo EXP
[6017] = {storage = 87878798810, item = 2444, amount = 1}, -- Triplo EXP
[6018] = {storage = 87878798810, item = 6529, amount = 1}, -- Triplo EXP
[6019] = {storage = 87878798810, item = 12916, amount = 1}, -- Triplo EXP
[6020] = {storage = 87878798810, item = 12900, amount = 1}, -- Triplo EXP


}
function onUse(cid,item,fromPosition,itemEx,toPosition)
local v = chests[item.uid]
if getPlayerStorageValue(cid, v.storage) ~= -1 then
return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja concluiu essa quest")
elseif getPlayerFreeCap(cid) < (getItemWeightById(v.item)*v.amount) then
return doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You need " .. (getItemWeightById(v.item)*v.amount) .. " capacity in order to get the item")
end
if isItemStackable(v.item) or v.amount == 1 then
doPlayerAddItem(cid, v.item, v.amount) 
else
for i = 1, v.amount do 
doPlayerAddItem(cid, v.item, 1)  
end
end
setPlayerStorageValue(cid,v.storage,1)
return doPlayerSendTextMessage(cid,22,"Você recebeu " .. getItemNameById(v.item) .. ".")
end