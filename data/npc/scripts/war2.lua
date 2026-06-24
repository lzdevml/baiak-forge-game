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
	local guild = getPlayerGuildId(cid)
	local guildenable = 0
	local checarda = db.getResult("SELECT `guild_id` FROM `islewars` WHERE `id` =1;")
	local checardb = db.getResult("SELECT `guild_id` FROM `islewars` WHERE `id` =2;")
	local checarfa = db.getResult("SELECT `guild_id` FROM `islewars` WHERE `id` =3;")
	local checarfb = db.getResult("SELECT `guild_id` FROM `islewars` WHERE `id` =4;")
	local townc = 1
	local townda = 18
	local towndb = 19
	local townfa = 20
	local townfb = 21


	 if msgcontains(msg, 'disbandguild') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarda:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 db.executeQuery("UPDATE `war`.`islewars` SET `guild_id` = '0' WHERE `islewars`.`id` =1;")
							 doPlayerSetTown(cid, townc)
							 doTeleportThing(uid, getTownTemplePosition(getPlayerStorageValue(uid, 01057)))
							 setPlayerStorageValue(uid, 01057, -1)

					 else
							 selfSay('Erro, somente membros da guild pode usar esse comando, para sair da war diga {disbandguild} !', cid)
end

	 end

	 if msgcontains(msg, 'disbandguild') then
	 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checardb:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 db.executeQuery("UPDATE `war`.`islewars` SET `guild_id` = '0' WHERE `islewars`.`id` =2;")
							 doPlayerSetTown(cid, townc)
							 doTeleportThing(uid, getTownTemplePosition(getPlayerStorageValue(uid, 01057)))
							 setPlayerStorageValue(uid, 01057, -1)

					 else
							 selfSay('Erro, somente o lider da guild pode usar esse comando, para sair da war diga {leave} !', cid)
end

	 end

	 if msgcontains(msg, 'disbandguild') then
	 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarfa:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 db.executeQuery("UPDATE `war`.`islewars` SET `guild_id` = '0' WHERE `islewars`.`id` =3;")
							 doPlayerSetTown(cid, townc)
							 doTeleportThing(uid, getTownTemplePosition(getPlayerStorageValue(uid, 01057)))
							 setPlayerStorageValue(uid, 01057, -1)

					 else
							 selfSay('Erro, somente o lider da guild pode usar esse comando, para sair da war diga {leave} !', cid)
end

	 end

	 if msgcontains(msg, 'disbandguild') then
	 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 and checarfb:getDataInt("guild_id") == guild  then
							 selfSay('Sua guild saiu do modo de guerra!', cid)
							 db.executeQuery("UPDATE `war`.`islewars` SET `guild_id` = '0' WHERE `islewars`.`id` =4;")
							 doPlayerSetTown(cid, townc)
							 doTeleportThing(uid, getTownTemplePosition(getPlayerStorageValue(uid, 01057)))
							 setPlayerStorageValue(uid, 01057, -1)

					 else
							 selfSay('Erro, somente o lider da guild pode usar esse comando, para sair da war diga {leave} !', cid)
end

	 end



	 if msgcontains(msg, 'leave') then
					 if getPlayerGuildLevel(cid) <= GUILDLEVEL_VICE and getPlayerLevel(cid) > 159 then
							 selfSay('Leave!', cid)
							 doPlayerSetTown(cid, townc)
							 doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
							 setPlayerStorageValue(uid, 01057, -1)
					 else
							 selfSay('Erro, somente o lider da guild pode usar esse comando, para sair da war diga {leave} !', cid)
end

	 end




	 if msgcontains(msg, 'efldshfjkhdsjfh') then
					 if getPlayerGuildLevel(cid) >= GUILDLEVEL_VICE and getPlayerLevel(cid) > 999 then
							 selfSay('Sua guild foi registrada chame sua guild {war desert a}', cid)
					 else
							 selfSay('Erro ao registrar sua guild, você precisa ser lider da guild com level 160', cid)
end
	 elseif talkState[talkUser] == 2 then
			 if msgcontains(msg, 'ye') then
							 selfSay('Great. Later report me asking mission.', cid)
							 setPlayerStorageValue(cid,30013,9)
							 talkState[talkUser] = 0
			 else
							 selfSay('You don\'t have nothin!', cid)
			 end
	 end
	 return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())