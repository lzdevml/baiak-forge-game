function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local exit = {x = 312, y = 86, z = 7}
   
    if(not isPlayer(cid)) then
        return true
    end


	local castle_one_name = "Castle24Hr"   -- Nome do castelo 1
	local storages = {154154,54321,123123}    -- Storages ( se vc eh iniciante, deixe como est&#225;...)

	local delaytime = 10 -- (Exhaust In Seconds.)
	local delay1 = 15414
	local delay2 = 15415


	local sto_ativ = getGlobalStorageValue(storages[2])
	position = getCreaturePosition(cid)


	if isPlayerGuild(cid) == TRUE and getPlayerGroupId(cid) < 3 then
		if sto_ativ == 1 or sto_ativ == -1 then
			guildname = getPlayerGuildName(cid) 
			guild = getPlayerGuildId(cid) 
			guild_sto = getGlobalStorageValue(storages[3])
			if guild ~= guild_sto then 
				if item.actionid == 9998 then
					if (getPlayerStorageValue(cid, delay1) <= os.time()) then
						setPlayerStorageValue(cid,delay1,os.time()+60)
						doBroadcastMessage("O Castle 24H está sendo invadido! Player: "..getCreatureName(cid).." | Guild: "..guildname..".", 18) 
					end
				elseif item.actionid == 9997 then
					if (getGlobalStorageValue(cid, delay2) <= os.time()) then
						if (getPlayerStorageValue(cid, 15416) <= os.time()) then
							setPlayerStorageValue(cid,15416,os.time()+60)
							setGlobalStorageValue(cid,delay2,os.time()+delaytime)
							doBroadcastMessage("O jogador "..getCreatureName(cid).." da guild "..guildname.." está muito próxima de dominar o castelo!", 18) 

						end
					end
				end
			end
	 	end 
	end
    
    if item.actionid == 4541 then
    	if getPlayerGuildId(cid) == getGlobalStorageValue(123123) and getGlobalStorageValue(123124) >= os.time() or getPlayerGroupId(cid) > 4 then
    		doSendMagicEffect(getPlayerPosition(cid), 14)
    	else
	        doTeleportThing(cid, fromPosition, true)
	        doSendMagicEffect(getPlayerPosition(cid), 13)
	        doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT , "Esse castelo nao pertence a sua guild!")
		end     
	    return true
	end

	return true
end

function isPlayerGuild(cid)
if getPlayerGuildName(cid) ~= "" then
return TRUE
else
return FALSE
end
end