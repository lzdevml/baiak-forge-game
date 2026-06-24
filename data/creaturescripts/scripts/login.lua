local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	-- Checar se AccManager ta liberado, se não, ele não deixa logar
	if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return false
		end
	end
	
	local rate = 1
	
		if realCastle.isDominating(cid) then 
	local rates = getPlayerRates(cid) 

		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE,"[Styller - Castle]: Sua Guild Dominou o , por isso você vai receber 40% a mais de EXP.")
			doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]+0.4)
	end

	doPlayerOpenChannel(cid, 11)
	
	doPlayerOpenChannel(cid, 7)
	
	doPlayerOpenChannel(cid, 6)		
	
	-- Aumenta o LossPercent em 3%
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	--[ACCOUNT MANAGER - INICIO]--
	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."

		end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end
	--[ACCOUNT MANAGER - FIM]--

	-- Se o jogador logar e não for um GM por exemplo, vai aparecer o efeito de Login
	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")
	
	-- Não acho necessário, mas vou manter
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	-- changeElement (important)
	if (getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6) and getPlayerStorageValue(cid, 19203) <= 0 then
		setPlayerStorageValue(cid, 19203, 1)
	elseif (getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7) and getPlayerStorageValue(cid, 19204) <= 0 then -- paladin
		setPlayerStorageValue(cid, 19204, 1)
	end

	-- DEBUG: Monster Hunter
	if getPlayerStorageValue(cid, 35075) == -1 then
		setPlayerStorageValue(cid, 35075, 0)
	end
	
	-- FREE BLESS (max: lvl 50)
	if(getPlayerLevel(cid) <= 50 and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		
		doPlayerSendTextMessage(cid, 27, "Fique tranquilo! Você possui bless gratuita até o level 50.")
	elseif(getPlayerBlessing(cid,1)) then
		doPlayerSendTextMessage(cid, 27, "Você já possui Bless!")
	else
		doPlayerSendTextMessage(cid, 27, "Você não possui bless. Use !bless agora mesmo.")
	end	

	-- DEBUG: SnowBall WAR
	if (getPlayerStorageValue(cid, SBW_INEVENT) > 0) then
		doPlayerSetStorageValue(cid, SBW_INEVENT, 0)
		doPlayerSetStorageValue(cid, SBW_SCORE, 0)
		doPlayerSetStorageValue(cid, SBW_AMMO, 0)
	end
	
	-- Anti-Entrosa
	if getPlayerStorageValue(cid, 84654) > 0 then
        doPlayerAddExperience(cid, -getPlayerExperience(cid)+getPlayerStorageValue(cid, 84654))
        setPlayerStorageValue(cid,84654,-1)
    end
    

    setPlayerStorageValue(cid, 823505, -1) -- Reset storage Potion
	setPlayerStorageValue(cid, 13184, os.time() + 4)
    setPlayerStorageValue(cid, 65484, -1)
	setPlayerStorageValue(cid, 98478, -1)
	setPlayerStorageValue(cid, 5454, 1)
	setPlayerStorageValue(cid, 9755, 0)
	setPlayerStorageValue(cid, 101010, 5)

    if getPlayerStorageValue(cid, 458781) == 1 then
    	setPlayerStorageValue(cid, 458781,-1) -- CastleHunting
    	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
    end

    if getPlayerStorageValue(cid, 6519999) == -1 then
    	setPlayerStorageValue(cid, 6519999,0) -- bestiary
    end

    -- IP History
    if getPlayerAccountId(cid) ~= 1 then
	    local stoLastIp = 541471
	    local last_Ip = getPlayerStorageValue(cid, stoLastIp)
	    local actual_Ip = getPlayerIp(cid)

	    local time = (os.date("%d/%b/%Y (%X)", os.time()))
	   	if (last_Ip) ~= "&"..actual_Ip then
	    	setPlayerStorageValue(cid, stoLastIp, "&"..actual_Ip) 
	    	-- verifica IP 	
	    	local query = db.getResult("SELECT `ip`, 'account_id' FROM ip_history WHERE `ip` = ".. actual_Ip .. ";")
	    	if query:getID() == -1 then -- Verifica se aquele ip já foi usado em algum lugar.
	    		db.executeQuery("INSERT INTO `ip_history` (`account_id`, `ip`, `character`, `data`) VALUES (" .. getPlayerAccountId(cid) .. "," .. actual_Ip .. ", '" .. getCreatureName(cid) .."', '" .. time .."');")
	    	elseif query:getDataString("ip") ~= actual_Ip then
	    		db.executeQuery("INSERT INTO `ip_history` (`account_id`, `ip`, `character`, `data`) VALUES (" .. getPlayerAccountId(cid) .. "," .. actual_Ip .. ", '" .. getCreatureName(cid) .."', '" .. time .."');")
	    	end

	    	-- verifica Account 	
	    	local query = db.getResult("SELECT `account_id` FROM ip_history WHERE `account_id` = "..  getPlayerAccountId(cid) .. ";")
	    	if query:getID() == -1 then -- Verifica se aquele ip já foi usado em algum lugar.
	    		db.executeQuery("INSERT INTO `ip_history` (`account_id`, `ip`, `character`, `data`) VALUES (" .. getPlayerAccountId(cid) .. "," .. actual_Ip .. ", '" .. getCreatureName(cid) .. "', '".. time .."');")
	    	end

	    	local query = db.getResult("SELECT `account_id` FROM ip_history WHERE `account_id` = "..  getPlayerAccountId(cid) .. ";")
	    	if query:getID() == -1 then -- Verifica se aquele ip já foi usado em algum lugar.
	    		db.executeQuery("INSERT INTO `ip_history` (`account_id`, `ip`, `character`, `data`) VALUES (" .. getPlayerAccountId(cid) .. "," .. actual_Ip .. ", '" .. getCreatureName(cid) .. "', '".. time .."');")
	    	end
	    end
	end

	-- DEBUG: SafeZone Event
	SafeZone.checkLogin(cid)

	-- DEBUG: CTF Event
	if getCreatureStorage(cid, ctfConfig.blue.storage) == 1 then
		doCreatureSetStorage(cid, ctfConfig.blue.storage, -1)
		doPlayerSetGroupId(cid, math.max(1, getCreatureStorage(cid, ctfConfig.groupStorage)))
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), true)
		doRemoveCondition(cid, CONDITION_OUTFIT)
	elseif getCreatureStorage(cid, ctfConfig.red.storage) == 1 then
		doCreatureSetStorage(cid, ctfConfig.red.storage, -1)
		doPlayerSetGroupId(cid, math.max(1, getCreatureStorage(cid, ctfConfig.groupStorage)))
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), true)
		doRemoveCondition(cid, CONDITION_OUTFIT)
	end

	if getCreatureStorage(cid, ctfConfig.flag.storage) > 0 then
		doCreatureSetStorage(cid, ctfConfig.flag.storage, -1)
	end

	if getCreatureStorage(cid, ctfConfig.deathStorage) > 0 then
		doCreatureSetStorage(cid, ctfConfig.deathStorage, -1)
	end
	
	if getPlayerStorageValue(cid, zombieEvent.storages.playerState) > 1 then
		setPlayerStorageValue(cid, zombieEvent.storages.zombieScore)
	end

	setPlayerStorageValue(cid, zombieEvent.storages.playerState)

	local guildId = getPlayerGuildId(cid)
	local rates = getPlayerRates(cid)
	if (guildId > 0) then -- Guild Check
		if (guildId == Castle48h.dominant) then -- Castle48Hrs
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[CASTLE 21H] Sua Guild recebe +15% EXP enquanto estiver no poder.")
			doPlayerSetExperienceRate(cid, rates[SKILL__LEVEL]+0.15)
		end
	end

	-- by Swatt'
	--unregisterCreatureEvent(cid, "GuildTourney")
	
	local inTask = checkPlayerIsInTask(cid)
	if #inTask >= 1 then
		registerCreatureEvent(cid, 'PersonalizedTaskSystem')
	end


	registerCreatureEvent(cid,"spreadLoot")	
	--registerCreatureEvent(cid, "Parry")
	registerCreatureEvent(cid, "deathchannel")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "AdvanceSave")
		registerCreatureEvent(cid, "AdvanceUP")
	registerCreatureEvent(cid, "recordIp")
	registerCreatureEvent(cid, "imbuimentLook")
	registerCreatureEvent(cid, "DesertDeath")
	registerCreatureEvent(cid, "DesertCombat")
	registerCreatureEvent(cid, "partyAndGuildProtection")
	registerCreatureEvent(cid, "ProtectLevel")
	registerCreatureEvent(cid, "monsterBoostKill")
	registerCreatureEvent(cid, "fraglook")
	--registerCreatureEvent(cid, "Critical")
	--registerCreatureEvent(cid, "_Critical")
	--registerCreatureEvent(cid, "Dodge")
	registerCreatureEvent(cid, "imbuimentLook")
	registerCreatureEvent(cid, "lookEvents")
	registerCreatureEvent(cid, "Addons")
	registerCreatureEvent(cid, "KillWote")
	registerCreatureEvent(cid, "KillWote1")
	registerCreatureEvent(cid, "Wote1")
	registerCreatureEvent(cid, "Wote01")
	registerCreatureEvent(cid, "ExpGuild")
	registerCreatureEvent(cid, "ExpGuild_out")
	registerCreatureEvent(cid, "FimVip")
	registerCreatureEvent(cid, "StaminaPz")
	registerCreatureEvent(cid, "RunesLook")
	registerCreatureEvent( cid, "NpcAttack")
	registerCreatureEvent(cid, "Topfrags")
	--registerCreatureEvent(cid, "StaminaPzLogin")
	registerCreatureEvent(cid, "VipReceive")
	registerCreatureEvent(cid, "autoloot")
	registerCreatureEvent(cid, "Auto Loot")	
	registerCreatureEvent(cid, "recompensa")
	registerCreatureEvent(cid, "PlayerKill")
	registerCreatureEvent(cid, "pushPzHenrique")
	registerCreatureEvent(cid, "LevelRecompense")
	registerCreatureEvent(cid, "FullHpMana")
	--registerCreatureEvent(cid, "BattleDeath")
	--registerCreatureEvent(cid, "BattleCombat") 
	registerCreatureEvent(cid, "War_Cytis_Login")
	registerCreatureEvent(cid, "War_Cytis_Logout")	
	registerCreatureEvent(cid, "Security")
	registerCreatureEvent(cid, "armyLogin")
	registerCreatureEvent(cid, "MonsterHunter_Login")
	registerCreatureEvent(cid, "CSBattle_Login")
	registerCreatureEvent(cid, "Bomberman_Login")
	registerCreatureEvent(cid, "RecompensaLevel")
	registerCreatureEvent(cid, "dttLogin")
	registerCreatureEvent(cid, "throwDummy")
	registerCreatureEvent(cid, "Inquisition")
	registerCreatureEvent(cid, "MCBlock")
	registerCreatureEvent(cid, "ga1")
	registerCreatureEvent(cid, "ga2")
	registerCreatureEvent(cid, "ga3")
	registerCreatureEvent(cid, "gv1")
	registerCreatureEvent(cid, "gv2")
	registerCreatureEvent(cid, "gv3")	
	registerCreatureEvent(cid, "Castle48hLogin")
	registerCreatureEvent(cid, "roleta")

if getPlayerGuildId(cid) > 0 then
             local guild = getPlayerGuildId(cid)
            doGuildAddEnemy(guild, enemy, 0, WAR_GUILD)  -- Uma função ai
        else  -- se não tiver guild
        end


	if getPlayerStorageValue(cid, 48913) == -1 then
        setPlayerStorageValue(cid, 48913, 0) 
    end 
	local temporary_level = getPlayerStorageValue(cid, ARMY_LEVEL) 
	local temporary_exp = getPlayerStorageValue(cid, ARMY_EXPERIENCE)
	if (temporary_level < #ARMY) then
		if (tonumber(temporary_exp) == -1) or (tonumber(temporary_level)  == -1) then
			setPlayerStorageValue(cid, ARMY_LEVEL, 1)
			setPlayerStorageValue(cid, ARMY_EXPERIENCE, 0)
		end
	end
	return true
end

