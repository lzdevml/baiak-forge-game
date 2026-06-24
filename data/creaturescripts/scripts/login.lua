local rnd = {"Donate"}
local rate = 1.20 -- 30%
local accepted_ip_list = {"189.15.79.111", "201.21.62.111"} -- Lista dos players permitidos a usar MC, exemplo: {"200.85.3.60", "201.36.5.222"}
local freeBlessMaxLevel = 120
local temple = { x = 154, y = 55, z = 7}
local save = {}

local config = {
	loginMessage = getConfigValue('loginMessage'),
	vip = "Você tem "..((rate - 1)*100).."% de exp a mais agora!",
	notvip = "Tornesse vip e ganhe "..((rate - 1)*100).."% a mais de experiencia!",
	max = 4, -- N?mero de players e acc manager permitido com o mesmo IP.
	group_id = 1, -- Kikar apenas player com o group id 1.
    acc_name = "Account Manager", -- Nome do account manager
    ip_banishment = "false", -- Se logar mais acc manager do que o permitido, leva ban? "true" ou "false"
    banishment_length = 2 -- Quantos dias o ip fica banido?
}

function saveRepeat(cid)
	if not isPlayer(cid) then return true end
	doPlayerSave(cid)
	doPlayerSendTextMessage(cid,19, 'Your character\'s progress is saved.')
	doSendMagicEffect(getThingPos(cid), 11)
	save[cid] = addEvent(saveRepeat, math.random(30,43) *30*1000, cid)
end

function sendEffect(cid)
	if isCreature(cid) then
		if vip.hasVip(cid) == true then
		pos = getThingPos(cid)
		doSendAnimatedText(pos, rnd[math.random(#rnd)], 251)
		addEvent(sendEffect, 5200,cid)
		end
	end
end

local function antiMC(p)
	if not isPlayer(cid) then return true end
	if #getPlayersByIp(getPlayerIp(p.pid)) >= p.max then
		if not isPlayer(cid) then return true end
		doRemoveCreature(p.pid)
	end
	return true
end

local function effectAnel(cid)
	if isPlayer(cid) then
		if getPlayerSlotItem(cid,9) and getPlayerSlotItem(cid,9).uid > 0 and getPlayerSlotItem(cid,9).itemid == 7697 then
			doSendMagicEffect(getThingPos(cid), 36)
		end
		addEvent(effectAnel, 3000, cid)
	end
	return true
end

function onLogin(cid)
	if getCreatureOutfit(cid).lookType == 306 and getPlayerStorageValue(cid, 121219) ~= 1 then
		doCreatureChangeOutfit(cid, getPlayerSex(cid) == 0 and {lookType = 136} or {lookType = 128})
	end
	
	if(getBooleanFromString(getConfigValue('accountManager')) == false) then
		if (getCreatureName(cid) == "Account Manager") then
			return doRemoveCreature(cid, true)
		end
	end
	
	if getPlayerSlotItem(cid,9) and getPlayerSlotItem(cid,9).uid > 0 and getPlayerSlotItem(cid,9).itemid == 7697 then
		effectAnel(cid)
	end

	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	if getPlayerStorageValue(cid, 54304) > 0 then
     	doPlayerSetStorageValue(cid, 54304, 0)
 	end
	
    if (InitArenaScript ~= 0) then
    InitArenaScript = 1
    -- make arena rooms free
        for i = 42300, 42309 do
            setGlobalStorageValue(i, 0)
            setGlobalStorageValue(i+100, 0)
        end
    end
	
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end
                            
	if getPlayerStorageValue(cid, 48902) == -1 then
        setPlayerStorageValue(cid, 48902, 0) 
    end

	if getPlayerName(cid) == "Account Manager" and #getPlayersByIp(getPlayerIp(cid)) > 10 then
		return false
	end

	-- AddBlessingSkullAmulet
	if getPlayerSlotItem(cid, 2).itemid == 7889 then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 49)
	else
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)	
	end
	
	if getPlayerStorageValue(cid, 48903) == -1 and getPlayerStorageValue(cid, 48902) == -1 then
		setPlayerStorageValue(cid, 48903, 0) 
		setPlayerStorageValue(cid, 48902, 0) 
	end
	
	-- CheckGems
	local gemid = getPlayerStorageValue(cid, 71473)
	if (getPlayerStorageValue(cid, 45783) > 0) and (checkGemTimeFinish(cid, gemid)) then
		deAtiveGem(cid, gemid)
	end
	
	if (gemid > 0) and (not checkGemTimeFinish(cid, gemid)) then
		local pedra = pedras_add[gemid]

		if not (pedra) then
			return true  
		end
  
		local skills = pedra.skills
		doAddCondition(cid, pedras_add_c[gemid])      
		doPlayerSendTextMessage(cid, 27, "O efeito da gema mágica foi retomado.")
		doPlayerSetExperienceRate(cid, pedra.xp)     
		sendGemEffect(cid, gemid)
	end   
   
	-- CheckMultiClient
	if getPlayerGroupId(cid) <= config.group_id then
		if not isPlayer(cid) then return true end
		if isInArray(accepted_ip_list,doConvertIntegerToIp(getPlayerIp(cid))) == false then
			addEvent(antiMC, 1000, {pid = cid, max = config.max+1})
			if not isPlayer(cid) then return true end
		end
	end
	
    if getPlayerName(cid) == config.acc_name then
        if isInArray(accepted_ip_list, doConvertIntegerToIp(getPlayerIp(cid))) then
            return true
        end
        if #getPlayersByIp(getPlayerIp(cid)) >= config.max then
            if config.ip_banishment == "true" then
                doAddIpBanishment(doConvertIntegerToIp(getPlayerIp(cid)), banishment_length * 24 * 60 * 60)
            end
            return false
        end
    end
	
	-- CheckVip
	if vip.hasVip(cid) == FALSE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.notvip)
		if getPlayerStorageValue(cid,55555) == 1 then
			doTeleportThing(cid, temple)
			doPlayerSendTextMessage(cid, 22, "Your VIP Time over!")
			db.executeQuery("UPDATE `accounts` SET `vip_time` = 0 WHERE `id` = ".. getAccountIdByName(getPlayerName(cid)) ..";")
			setPlayerPromotionLevel(cid, 1)
			setPlayerStorageValue(cid, 55555, 0)
		end
	else
		if getPlayerStorageValue(cid,55555) ~= 1 then
			setPlayerStorageValue(cid,55555,1)
		end
		doPlayerSetExperienceRate(cid, rate)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.vip)
		pos = getThingPos(cid)
		doSendAnimatedText(pos, rnd[math.random(#rnd)], 251)
		addEvent(sendEffect, 5200,cid)
	end
	
	-- CheckBlessing
	if(getPlayerLevel(cid) <= freeBlessMaxLevel and not getPlayerBlessing(cid,1)) then
		for b=1, 5 do
			doPlayerAddBlessing(cid, b)
		end
		doCreatureSay(cid, 'Voce tem bless gratuita, porque seu level é menor que 120', TALKTYPE_ORANGE_1)
		doSendMagicEffect(getThingPosition(cid), CONST_ME_HOLYDAMAGE)
	elseif(getPlayerBlessing(cid,1)) then
		doCreatureSay(cid, 'Você já tem bless!', TALKTYPE_ORANGE_1)
	else
		doCreatureSay(cid, 'Você não tem bless. Digite !bless cuidado pode dar exausted', TALKTYPE_ORANGE_1)
	end
	

	-- StaminaTrainer
	if getPlayerStorageValue(cid, 19387) ~= 0 then
        	setPlayerStorageValue(cid, 19387, 0) 
	end

	-- SaveCharacterSystem
	save[cid] = addEvent(saveRepeat, math.random(30,43)*30*1000, cid)

	-- MutePlayer
	if getPlayerStorageValue(cid, 179990) >= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "[ATENÇÃO] Voccê foi mutado por divulgaçõo, caso tenha sido injustamente, entre em contato via ticket em nosso website!")
		doMutePlayer(cid, -1)
	end

	-- Others
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "[Promoção] Double Points para todas as doaçãoes!")
	setPlayerStorageValue(cid, 25950, -1)
	
	registerCreatureEvent(cid, "showKD")
	registerCreatureEvent(cid, "Kills")
	registerCreatureEvent(cid, "Thinks")
	registerCreatureEvent(cid, "PlayerLogin")
	registerCreatureEvent(cid, "citywar")
	registerCreatureEvent(cid, "dttDeath")
	registerCreatureEvent(cid, "dttPrepare")
	registerCreatureEvent(cid, "dttStats")
	registerCreatureEvent(cid, "dttOutfit")
	registerCreatureEvent(cid, "rewardBoss")
	registerCreatureEvent(cid, "dttLogin")
	registerCreatureEvent(cid, "dttKill")
	registerCreatureEvent(cid, "entrosaLogout")
	registerCreatureEvent(cid, "dttCombat")
	registerCreatureEvent(cid, "TeleportQuest")
	registerCreatureEvent(cid, "TeleportArena")
	registerCreatureEvent(cid, "FireStorm")
	registerCreatureEvent(cid, "FireStorm")
	registerCreatureEvent(cid, "DesertDeath")
	registerCreatureEvent(cid, "DesertCombat")
	registerCreatureEvent(cid, "Ctf")
	registerCreatureEvent(cid, "BattleDeath")
	registerCreatureEvent(cid, "BattleCombat")
	registerCreatureEvent(cid, "FullHpMana")
	registerCreatureEvent(cid, "recompensa")
	registerCreatureEvent(cid, "huntdeath")
	registerCreatureEvent(cid, "staminafiller")
	registerCreatureEvent(cid, "taskbk")
	registerCreatureEvent(cid, "Logout")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "SaveReportBug")
	registerCreatureEvent(cid, "teleportmonster")
	registerCreatureEvent(cid, "attackguild")
	registerCreatureEvent(cid, "CombatDodge")
	registerCreatureEvent(cid, "critical")
	registerCreatureEvent(cid, "BossKill")
	registerCreatureEvent(cid, "ResetLogin")



	
  return true
end