function getReportByGuid(guid)
local shop = db.getResult("SELECT * FROM `report` WHERE `id` = ".. guid ..";")
return shop:getDataString("report")
end

function doPlayerAddReport(cid, report)
db.executeQuery("INSERT INTO `report` (`id`, `report`, `level`) VALUES (" .. getPlayerGUID(cid) .. ", '" .. report .. "', " .. getPlayerLevel(cid) .. ");")
return true
end

function showReports(cid)
local rep = db.getResult("SELECT * FROM `report` WHERE `id` ORDER BY `level`")
str = "Reports Ativos:\n\n"
if rep:getID() == -1 then
doShowTextDialog(cid, 1387, "Não ha reports disponiveis!")
return true
end
while true do
local list = rep:getDataString("report")
local players = rep:getDataInt("id")
local name = getPlayerNameByGUID(players)
str = str .. list .. " -("..players..")- Name ("..name..")]\n\n"
db.executeQuery("DELETE FROM `report` WHERE `id` = ".. players.." and `report` = '".. list .."';")
if not rep:next() then
doShowTextDialog(cid, 1397, str)
break
end
end
end