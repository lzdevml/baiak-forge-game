function onThink(interval, lastExecution, thinkInterval)
local total,minutes = 151200000,3900000
local query = db.getResult("SELECT `id`, `stamina` FROM `players` WHERE `id` > 6 AND `group_id` < 3;")
if (query:getID() ~= -1) then
while true do
local id, stamina_now = query:getDataInt("id"), query:getDataInt("stamina")
if stamina_now < (total-minutes) then
db.executeQuery("UPDATE `players` SET `stamina` = "..stamina_now+minutes.." WHERE `id` = "..id)
end
if not(query:next()) then
break
end
end
query:free()
end
return true
end