function onKill(cid, target)
	if (not isPlayer(cid)) or (not isPlayer(target)) then
		return true
	end

	if (isPlayer(cid) and isPlayer(target)) then
		pid, pid2 = cid, getPlayerGUID(target)
		local result_plr = db.getResult("SELECT * FROM `bounty_hunters` WHERE `sp_id` = "..pid2.." AND `killed` = 0;");
		if(result_plr:getID() ~= -1) then
			prize = tonumber(result_plr:getDataInt("prize"))
			bid = tonumber(result_plr:getDataInt("id"))
			result_plr:free()
		else
			prize = 0
			bid = 0
		end
	 
		if (bid ~= 0 and prize ~= 0 and not(getTileInfo(getCreaturePosition(cid)).pvp)) then
			db.executeQuery("UPDATE `bounty_hunters` SET `killed` = 1, `k_id`="..getPlayerGUID(cid)..", `kill_time` = " .. os.time() .. " WHERE `id`  = "..bid..";");
			doPlayerAddMoney(cid, prize)
			doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,'[Hunted System] You killed hunted player, so you gained the reward!')
			doBroadcastMessage("[Hunted System]: "..getPlayerName(cid).." killed "..getPlayerName(target).." and gained the reward! ("..prize.." golds)", MESSAGE_EVENT_ADVANCE)
		end	
	end
	return true
end