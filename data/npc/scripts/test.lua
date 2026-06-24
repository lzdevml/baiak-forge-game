local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)						 npcHandler:onCreatureAppear(cid)					 end
function onCreatureDisappear(cid)					 npcHandler:onCreatureDisappear(cid)					 end
function onCreatureSay(cid, type, msg)				 npcHandler:onCreatureSay(cid, type, msg)			 end
function onThink()									 npcHandler:onThink()								 end
function creatureSayCallback(cid, type, msg)
	 if(not npcHandler:isFocused(cid)) then
			 return false
	 end
	 local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local config = {
   npcstorage = 18687,
   killstorage = 19001,
   amountkills = 10,
   rewarditem = 2160,
   rewardexp = 12000
}



	 if msgcontains(msg, 'hi') then
					 if getPlayerLevel(cid) > 800 then
							 selfSay('Hello '..getPlayerName(cid)..', i need you to give me a {mission}, send me souls and Ill give you a reward!', cid)
					 else
							 selfSay('You must be level 80 or higher.', cid)
end

	 end

	 if msgcontains(msg, 'mission') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") <= 0  then
							 selfSay('Sua guild foi registrada, chame sua guild para começar a batalha!', cid)
							 db.executeQuery("UPDATE `islewars` SET `guild_id` = " .. guild .. " WHERE `islewars`.`id` =1;")
							 doPlayerSetTown(cid, townda)
							 setPlayerStorageValue(uid, 01057, 1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					 else
							 selfSay('Erro, esse mapa já está em uso, volte mais tarde!', cid)
end

	 end

	 if msgcontains(msg, 'desertodois') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") <= 0  then
							 selfSay('Sua guild foi registrada, chame sua guild para começar a batalha!', cid)
							 db.executeQuery("UPDATE `islewars` SET `guild_id` = " .. guild .. " WHERE `islewars`.`id` =2;")
							 doPlayerSetTown(cid, towndb)
							 setPlayerStorageValue(uid, 01057, 1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					 else
							 selfSay('Erro, esse mapa já está em uso, volte mais tarde!', cid)
end

	 end

	 if msgcontains(msg, 'florestaum') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") <= 0  then
							 selfSay('Sua guild foi registrada, chame sua guild para começar a batalha!', cid)
							 db.executeQuery("UPDATE `islewars` SET `guild_id` = " .. guild .. " WHERE `islewars`.`id` =3;")
							 doPlayerSetTown(cid, townfa)
							 setPlayerStorageValue(uid, 01057, 1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					 else
							 selfSay('Erro, esse mapa já está em uso, volte mais tarde!', cid)
end

	 end

	 if msgcontains(msg, 'florestadois') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") <= 0  then
							 selfSay('Sua guild foi registrada, chame sua guild para começar a batalha!', cid)
							 db.executeQuery("UPDATE `islewars` SET `guild_id` = " .. guild .. " WHERE `islewars`.`id` =4;")
							 doPlayerSetTown(cid, townfb)
							 setPlayerStorageValue(uid, 01057, 1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
					 else
							 selfSay('Erro, esse mapa já está em uso, volte mais tarde!', cid)
end

	 end

	 if msgcontains(msg, 'joinwar') then
					 if getPlayerGuildLevel(cid) <= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 doPlayerSetTown(cid, townda)
							 setPlayerStorageValue(uid, 01057, 1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

end

	 end
	 if msgcontains(msg, 'joinwar') then
	 if getPlayerGuildLevel(cid) <= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checardb:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 doPlayerSetTown(cid, towndb)
							 setPlayerStorageValue(uid, 01057, 1)
							 setPlayerStorageValue(cid,0201,1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

end

	 end
	 if msgcontains(msg, 'joinwar') then
	 if getPlayerGuildLevel(cid) <= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarfa:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 doPlayerSetTown(cid, townfa)
							 setPlayerStorageValue(uid, 01057, 1)
							 setPlayerStorageValue(cid,0201,1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

end

	 end
	 if msgcontains(msg, 'joinwar') then
	 if getPlayerGuildLevel(cid) <= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarfb:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 doPlayerSetTown(cid, townfb)
							 setPlayerStorageValue(uid, 01057, 1)
							 setPlayerStorageValue(cid,0201,1)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))

end

	 end

	 if msgcontains(msg, 'dgdgdgdgdgdg') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") == guild  then
							 selfSay('Erro, você não pode usar esse comando!', cid)

end

	 end
	 if msgcontains(msg, 'dfdfdfdfdf') then
	 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checardb:getDataInt("guild_id") == guild  then
							 selfSay('Erro, você não pode usar esse comando!', cid)
end

	 end
	 if msgcontains(msg, 'sfsfsfsfsf') then
	 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarfa:getDataInt("guild_id") == guild  then
							 selfSay('Erro, você não pode usar esse comando!', cid)

end

	 end
	 if msgcontains(msg, 'dfdfdgfg') then
	 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarfb:getDataInt("guild_id") == guild  then
							 selfSay('Erro, você não pode usar esse comando!', cid)

end

	 end



	 if msgcontains(msg, 'sgfgdgdgd') then
					 if getPlayerGuildLevel(cid) <= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 then
							 selfSay('Erro, você não pode usar esse comando!', cid)

					 else
							 selfSay('Erro, somente o lider da guild pode sair do modo de guerra, para sair da war diga {leave} !', cid)
end

	 end




	 if msgcontains(msg, 'xxxxxx') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 999 then
							 selfSay('Sua guild foi registrada chame sua guild {war desert a}', cid)
							 doTeleportThing(cid, deserta, TRUE)
					 else
							 selfSay('Erro ao registrar sua guild, você precisa ser lider da guild com level 160', cid)
end
	 elseif talkState[talkUser] == 2 then
			 if msgcontains(msg, 'ye') then
							 selfSay('Great. Later report me asking missionggggggggg.', cid)
							 setPlayerStorageValue(cid,30013,9)
							 talkState[talkUser] = 0
			 else
							 selfSay('You don\'t have nothinggggggg!', cid)
			 end
	 end
	 return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())