-- ########################################################
-- #####       	  Name: Adriano Swatt'   	          #####
-- ##### 			  Version: 1.0                    #####
-- ########################################################
-- #####  		Developed by Adriano Swatt'			  #####
-- #####  	 Contact: adrianoswat@yahoo.com.br        #####
-- #####  	CASTLE WAR RANKING SYSTEM BY SWATT'       #####
-- ########################################################
local cfg = {
	maxPoints = 5, -- Máximo de Pontos para Resetar todos
}

-- doCastleWarAddWinner(getPlayerGuildId(cid))
-- sendGuildChannelMessage(guildId, type, message)
function doCastleWarAddWinner(guildId)
	local result = db.getResult("SELECT * FROM castlewar_ranking ORDER BY last_win DESC;")
	if (result:getID() ~= -1) then
		guild_id, points, last_win = result:getDataInt("guild_id"), result:getDataInt("points"), result:getDataInt("last_win")
		if guild_id == guildId then -- VENCEDOR CONSECUTIVO
			newPoints = points + 1			
			if newPoints >= cfg.maxPoints then -- Reseta Todos Pontos das Guilds
				db.executeQuery("UPDATE `castlewar_ranking` SET `points` = 0")
				sendGuildChannelMessage(guildId, TALKTYPE_CHANNEL_R1, 'Congratulations, your Guild was the First Guild to do 5 War Castle Points and have been WINNER of Castle War.')
			else
				db.executeQuery("UPDATE `castlewar_ranking` SET `points` = "..newPoints..", `last_win` = "..os.time().." WHERE `guild_id` = "..guildId..";")
				sendGuildChannelMessage(guildId, TALKTYPE_CHANNEL_R1, 'Congratulations, your Guild has '..newPoints..' points in the Castle War.')
			end
		else -- NÃO SENDO VENCEDOR CONSECUTIVO
			local res = db.getResult("SELECT * FROM castlewar_ranking WHERE guild_id = "..guildId..";")
			if (res:getID() == -1) then -- SE NOVO GANHADOR NÃO ESTÁ CADASTRADO
				db.executeQuery("UPDATE `castlewar_ranking` SET `points` = 0")
				db.executeQuery("INSERT INTO `castlewar_ranking` (`guild_id`, `points`, `last_win`) VALUES ('"..guildId.."', 1, " .. os.time() .. ");")
			else -- CASO NOVO GANHADOR JÁ TENHA CADASTRO
				db.executeQuery("UPDATE `castlewar_ranking` SET `points` = 0")
				db.executeQuery("UPDATE `castlewar_ranking` SET `points` = 1, `last_win` = "..os.time().." WHERE `guild_id` = "..guildId..";")
			end
			sendGuildChannelMessage(guildId, TALKTYPE_CHANNEL_R1, 'Congratulations, your Guild has 1 point in the Castle War.')
		end	
	else
		db.executeQuery("INSERT INTO `castlewar_ranking` (`guild_id`, `points`, `last_win`) VALUES ('"..guildId.."', 1, " .. os.time() .. ");")
		sendGuildChannelMessage(guildId, TALKTYPE_CHANNEL_R1, 'Congratulations, your Guild has 1 point in the Castle War.')
	end
return true
end