--local messages = {
--	"Please report bugs and missing creatures/npcs/quests on website with images and description.",
--	"Follow the rules to avoid a banishment."
--}

local messages = db.getResult("SELECT `post_topic` FROM `z_forum` ORDER BY `post_date` DESC LIMIT 1")
--SELECT `r`.*, `p`.`name` AS `player_name` FROM `server_reports` r LEFT JOIN `players` p ON `r`.`player_id` = `p`.`id` WHERE `r`.`id` = " .. reportId

local i = 0
function onSay(cid, words, param, channel)
	--doPlayerBroadcastMessage(cid, "teste")
	--if(messages:getID() == -1)
		--return false
	--end
	
	--local message = messages[(i % #messages) + 1]
	--local message = messages:getDataInt("id")
	--Tiedot:getDataInt("id")
	doPlayerBroadcastMessage(cid, "Novidades globalwar.com.br: " .. tostring(messages:getDataString("post_topic")) .. "", MESSAGE_STATUS_CONSOLE_ORANGE)
	-- tostring(result_plr:getDataString("param5"))
	i = i + 1	
	return true
end
