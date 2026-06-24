-- The OTX Server Config

	-- Owner Data
	ownerName = "Styller-OTs"
	ownerEmail = "mohamed97felipe@gmail.com"
	url = "https://www.NewStyller.com.br.com"
	location = "Brasil"

	-- Messages
	motd = "Seja bem vindo ao Styller-OTs "
	serverName = "NewStyller 8.6"
	loginMessage = "Bem vindo ao NewStyller 8.6"
	displayGamemastersWithOnlineCommand = false
-- Channels CUSTOM
	lootChannelId = 7

	-- MySql
	--// encryptionType can be (plain, md5, sha1, sha256 or sha512).
	sqlType = "mysql"
	sqlHost = "localhost"
	sqlPort = 3306
	sqlUser = "root"
	sqlPass = ""
	sqlDatabase = "styller"
	sqlFile = ""
	sqlKeepAlive = 0
	mysqlReadTimeout = 10
	mysqlWriteTimeout = 10
	mysqlReconnectionAttempts = 5
	passwordType = "sha1"
	encryptionType = "sha1"

	-- World / Ip / Port
	worldId = 0
	ip = "127.0.0.1"
    worldType = "open"
	bindOnlyGlobalAddress = false
	loginPort = 7171
	gamePort = "7172"
	statusPort = 7171
	loginOnlyWithLoginServer = false

	-- Account manager
    accountManager = false
	namelockManager = true
	newPlayerChooseVoc = true
	newPlayerSpawnPosX = 160
	newPlayerSpawnPosY = 51
	newPlayerSpawnPosZ = 7
	newPlayerTownId = 1
	newPlayerLevel = 10
	newPlayerMagicLevel = 0
	generateAccountNumber = false
	generateAccountSalt = true

	fragsLimit = 24 * 60 * 60
	fragsSecondLimit = 1 * 24 * 60 * 60
	fragsThirdLimit = 1 * 24 * 60 * 60

	fragsToRedSkull = 15
	fragsSecondToRedSkull = 100
	fragsThirdToRedSkull = 400
	redSkullLength = 1 * 24 * 60 * 60

	fragsToBlackSkull = 30
	fragsSecondToBlackSkull = 200
	fragsThirdToBlackSkull = 300
	blackSkulledDeathHealth = 40
	blackSkulledDeathMana = 0
	blackSkullLength = 1 * 24 * 60 * 60
	useBlackSkull = true

	-- Banishment Config
	-- killsBanLength works only if useBlackSkull option is disabled.
	notationsToBan = 3
	warningsToFinalBan = 4
	warningsToDeletion = 5
	banLength = 12 * 60 * 60
	killsBanLength = 7 * 24 * 60 * 60
	finalBanLength = 30 * 24 * 60 * 60
	ipBanLength = 1 * 24 * 60 * 60
	fragsToBanishment = 7
	fragsSecondToBanishment = 21
	fragsThirdToBanishment = 41

	-- Battle
	-- NOTE: showHealth/ManaChangeForMonsters inherites from showHealth/ManaChange.
	protectionLevel = 50
	pvpTileIgnoreLevelAndVocationProtection = true
	pzLocked = 30 * 1000
	huntingDuration = 30 * 1000
	criticalHitMultiplier = 1
	displayCriticalHitNotify = true
	removeWeaponAmmunition = true
	removeWeaponCharges = true
	removeRuneCharges = true
	whiteSkullTime = 3 * 60 * 1000
	advancedFragList = false
	useFragHandler = true
	noDamageToSameLookfeet = false
	showHealthChange = true
	showManaChange = true
	showHealthChangeForMonsters = false
	showManaChangeForMonsters = false
	fieldOwnershipDuration = 5 * 1000
	stopAttackingAtExit = true
	loginProtectionPeriod = 1 * 1000
	deathLostPercent = 10
	PushCruzado = true
	stairhopDelay = 0 * 400
	pushCreatureDelay = 900
	deathContainerId = 1987
	gainExperienceColor = 210
	addManaSpentInPvPZone = true
	recoverManaAfterDeathInPvPZone = false
	squareColor = 0
	broadcastBanishments = false
	maxViolationCommentSize = 60
	violationNameReportActionType = 2

	-- OTX Server Extras Features (CUSTOM SCRIPTS)
		-- Corpse Block
		-- If set to true, players won't be able to immediately throw fields on top of corpses after killing the monster
		allowCorpseBlock = false

		-- Push creatures
		-- If set to false, players won't be able to push creatures while other actions are exhausted(for example potions)
		allowIndependentCreaturePush = true

		-- If set to true, players gain battle if attack a player with skull
		pzlockOnAttackSkulledPlayers = true

		-- Diagonal Push is Push Cruzado
		-- If set to true, players can push creatures without exhaust. They can pull even in motion.
		diagonalPush = true

		-- Push in PZ
		-- If set to false, players won't push creatures in Protect Zone.
		pushInProtectZone = false

		-- Party Multiplier Experience
		enablePartyVocationBonus = true
		twoVocationExpMultiplier = 1.5
		threeVocationExpMultiplier = 1.75
		fourVocationExpMultiplier = 2.0

		-- Battle
		optionalWarAttackableAlly = true
		fistBaseAttack = 7
		criticalHitChance = 0
		noDamageToGuildMates = false
			-- if true then no damage, if false then damage
		noDamageToPartyMembers = false
			-- if true then no damage, if false then damage

		-- Rook System
		rookLevelTo = 5
		rookLevelToLeaveRook = 8
		rookTownId = 2
		useRookSystem = false
        advertisingBlock = "baiak;really;,com;net;servegame;no-ip,.net;.com;.com.br;.org;.cf;.net;.biz;.ml;.online;.CF;BAIAK;EVIL;.COM;,COM;.ML;,ML;ABRIU AGORA;HOST BR;host br;baiak-evel;BAIAK-EVIL;adm,;ADM;ot lixo;OT LIXO;reset;RESET;resetar;RESETAR;editado;EDITADO;free items;FREE ITEMS;ot bugado;OT BUGADO"		
		
		-- Monsters Attack Config
		-- set monsterAttacksOnlyDamagePlayers to false if you want monster's attacks to damage other nearby monsters
		monsterAttacksOnlyDamagePlayers = true

		-- Paralyze delay
		paralyzeDelay = 600

		-- GUI
		premiumDaysToAddByGui = 0

		-- Depot and Miscellaneous
		-- set playerFollowExhaust to 2000 if someone causes lags and kicks by following unreachable creatures too often
		useCapacity = true
		defaultDepotSize = 1000
		MaxIpConnections = 100
		defaultDepotSizePremium = 2000
		enableProtectionQuestForGM = false
		cleanItemsInMap = false
		playerFollowExhaust = 2000

		-- 8.7x + config
		monsterSpawnWalkback = true
		allowBlockSpawn = true
		classicEquipmentSlots = true

		-- Summons and monsters
		NoShareExpSummonMonster = false

		-- Others
		enableLootBagDisplay = false
		highscoreDisplayPlayers = 10
		updateHighscoresAfterMinutes = 60
		attackImmediatelyAfterLoggingIn = false
		exhaustionNPC = true
		exhaustionInSecondsNPC = 0.2
		delayLastPushStep = true
		optionalProtection = false

		-- Advanced Version
		-- Note: If you use another protocol than the one we set as you will have functional failures.
		-- Supported (860) = 8.60
		manualVersionConfig = false
		versionMin = 860
		versionMax = 860
		versionMsg = "Only clients with protocol 8.60 allowed!"

		-- ConfigSpells
		-- Note: set noAttackHealingSimultaneus to true if you want the attack and healing spells to have the same exhausted
		noAttackHealingSimultaneus = false

	-- Connection config
	loginTries = 10
	retryTimeout = 5 * 1000
	loginTimeout = 60 * 1000
	maxPlayers = 1000
	displayOnOrOffAtCharlist = false
	onePlayerOnlinePerAccount = false
	allowClones = 0
	statusTimeout = 1000
	replaceKickOnLogin = true
	forceSlowConnectionsToDisconnect = false
	premiumPlayerSkipWaitList = true
	packetsPerSecond = 700
	loginProtectionTime = 2

	-- Death List and Blessings
	-- Function retroPVP true change it:
	-- deathAssistCount to 1
	-- useFairfightReduction to false
	-- fairFightTimeRange = 30
	deathListEnabled = true
	deathListRequiredTime = 1 * 60 * 1000
	maxDeathRecords = 5
	multipleNames = false
		-- Retro PVP
		retroPVP = true
		deathAssistCount = 0
		-- Blessings
		blessings = true
		blessingOnlyPremium = false
		blessingReductionBase = 30
		blessingReductionDecrement = 5
		eachBlessReduction = 8
		useFairfightReduction = false
		fairFightTimeRange = 30
		pvpBlessingThreshold = 40

	-- Guilds
	-- NOTE: externalGuildWarsManagement supports Automatic Account Creator(webpage or whatever you want)
	externalGuildWarsManagement = false
	ingameGuildManagement = false
	levelToFormGuild = 8
	premiumDaysToFormGuild = 0
	guildNameMinLength = 4
	guildNameMaxLength = 20

	-- Houses
	buyableAndSellableHouses = true
	houseNeedPremium = false
	bedsRequirePremium = false
	levelToBuyHouse = 100
	housesPerAccount = 1
	houseRentAsPrice = true
	housePriceAsRent = true
	housePriceEachSquare = 8500
	houseRentPeriod = "monthly"
	houseCleanOld = 15 * 24 * 60 * 60
	guildHalls = true
	houseSkipInitialRent = true
	houseProtection = true
	houseOwnedByAccount = true

	-- Item usage
	-- exhaustToUseItemsWithAction, CUSTOM function to exhaust in AID/UID items. (protect to loop for longer scripts)
	timeBetweenActions = 200
	timeBetweenExActions = 500
	timeBetweenCustomActions = 0
	exhaustToUseItemsWithAction = 0
	checkCorpseOwner = true
	hotkeyAimbotEnabled = true
	maximumDoorLevel = 999
	tradeLimit = 100
	canOnlyRopePlayers = false

	-- Map
	-- NOTE: storeTrash costs more memory, but will perform alot faster cleaning.
	-- houseDataStorage usage may be found at how-use-internal-functions.log
	mapAuthor = "Mohamed"
	randomizeTiles = true
	houseDataStorage = "binary-tilebased"
	storeTrash = true
	cleanProtectedZones = true
	mapName = "Styller.otbm"
		-- For Windows(compiled with MSVC) and Linux use:
		-- OTX Server use default GroundCache
		-- GroundCache mode save memory: __GROUND_CACHE__
			-- forgotten map on normal mode use memory: 361,512 KB
			-- forgotten map with groundCache mode use memory: 334,124 KB

	-- Mailbox
	mailMaxAttempts = 5
	mailBlockPeriod = 30 * 60 * 1000
	mailAttemptsFadeTime = 5 * 60 * 1000
	mailboxDisabledTowns = "2"
		-- Example disable rook depot (temple) "4"
		-- mailboxDisabledTowns = "4"

	-- Startup
	-- For Linux, use "-1" is default
	-- ("0, 1, 2, 3") -- For QuadCore, ONLY Windows
	-- daemonize works only on *nix, same as niceLevel
	daemonize = false
	defaultPriority = "higher"
	niceLevel = 5
	coresUsed = "-1"
	startupDatabaseOptimization = true
	removePremiumOnInit = true
	confirmOutdatedVersion = false
	skipItemsVersionCheck = true

	-- Muted buffer
	maxMessageBuffer = 4

	-- Miscellaneous
	dataDirectory = "data/"
	logsDirectory = "data/logs/"
	disableOutfitsForPrivilegedPlayers = false
	bankSystem = true
	spellNameInsteadOfWords = false
	emoteSpells = true
	unifiedSpells = false
	promptExceptionTracerErrorBox = true
	storePlayerDirection = false
	savePlayerData = true
	monsterLootMessage = 3
	monsterLootMessageType = 25
	separateViplistPerCharacter = false
	vipListDefaultLimit = 20
	vipListDefaultPremiumLimit = 100

	-- Outfits
	allowChangeOutfit = true
	allowChangeColors = true
	allowChangeAddons = true
	addonsOnlyPremium = false

	-- Ghost mode
	ghostModeInvisibleEffect = true
	ghostModeSpellEffects = true

	-- Limits
	-- Tile Limits set to 0 for prevent crash
	idleWarningTime = 14 * 60 * 1000
	idleKickTime = 15 * 60 * 1000
	expireReportsAfterReads = 1
	playerQueryDeepness = -1
	protectionTileLimit = 30
	houseTileLimit = 10
	tileLimit = 10

	-- Premium-related
	freePremium = false
	premiumForPromotion = false
	updatePremiumStateAtStartup = true

	-- Rates
	-- rateExperienceForMission is for missions in NPCS or events or task or systems, etc...
	--// For rateExperienceForMission, use in script:  (* getConfigValue('rateExperienceForMission'))
	experienceStages = true
	rateExperience = 1
	rateExperienceFromPlayers = 0.5
	levelToOfflineTraining = 1
	rateSkill = 16
	rateSkillOffline = 0.5
	rateMagic =6
	rateMagicOffline = 0.5
	rateLoot = 4
	rateSpawnMin = 2
	rateSpawnMax = 4
	formulaLevel = 5.0
	formulaMagic = 1.0
			-- Monster rates
		rateMonsterHealth = 0.7
		rateMonsterMana = 0.7
		rateMonsterAttack = 0.7
		rateMonsterDefense = 0.7

	-- Experience from players
	minLevelThresholdForKilledPlayer = 0.7
	maxLevelThresholdForKilledPlayer = 1.1

	-- Stamina System
	-- NOTE: The Stamina gain will only start counting after 10 minutes of being offline
	-- rateStaminaLoss = The amount of Stamina(in minutes) a player will loose after 1 minute of hunting
	-- rateStaminaGain = The amount of time(in minutes) a player will need to be offline to get 1 minute of Stamina(from 0 stamina to 'staminaRatingLimitTop')
	-- rateStaminaThresholdGain = The amount of time(in minutes) a player will need to be offline to get 1 minute of Stamina(from 'staminaRatingLimitTop' to full stamina)
	-- staminaRatingLimitTop = Above this Stamina players will receive 'rateStaminaAboveNormal' times the amount of the exp
	-- staminaRatingLimitBottom = Below this Stamina players will receive 'rateStaminaUnderNormal' times the amount of the exp
	-- staminaLootLimit = Below this Stamina players will no longer receive any loot
	-- rateStaminaAboveNormal = The experience multiplier for players above 'staminaRatingLimitTop' Stamina(1.5 means the player will receive 50% extra experience)
	-- rateStaminaUnderNormal = The experience multiplier for players below 'staminaRatingLimitBottom' Stamina(0.5 means the player will receive only half the experience)
	rateStaminaLoss = 1
	rateStaminaGain = 1
	rateStaminaThresholdGain = 12
	staminaRatingLimitTop = 40 * 60
	staminaRatingLimitBottom = 2 * 60
	staminaLootLimit = 14 * 60
	rateStaminaAboveNormal = 1.2
	rateStaminaUnderNormal = 0.2
	staminaThresholdOnlyPremium = false

	-- Party System
	experienceShareRadiusX = 30
	experienceShareRadiusY = 30
	experienceShareRadiusZ = 1
	experienceShareLevelDifference = 2 / 3
	extraPartyExperienceLimit = 20
	extraPartyExperiencePercent = 5
	experienceShareActivity = 10 * 60 * 1000

	-- Global save
	globalSaveEnabled = false
	globalSaveHour = 1
	globalSaveMinute = 0
	shutdownAtGlobalSave = true
	cleanMapAtGlobalSave = false

	-- Spawns
	minRateSpawn = 1
	maxRateSpawn = 3
	deSpawnRange = 2
	deSpawnRadius = 50

	-- Summons
	maxPlayerSummons = 2
	teleportAllSummons = false
	teleportPlayerSummons = false

	-- Logs
	disableLuaErrors = false
	adminLogs = false
	displayPlayersLogging = false
	prefixChannelLogs = ""
	runFile = "server/run.log"
	outputLog = "server/out.log"
	truncateLogOnStartup = false
	logPlayersStatements = false

	-- Manager
	-- NOTE: managerPassword left blank disables manager.
	managerPort = 7171
	managerLogs = false
	managerPassword = ""
	managerLocalhostOnly = true
	managerConnectionsLimit = 1

	-- Admin
	-- NOTE: adminPassword left blank disables manager.
	-- Set to anything if you set adminRequireLogin to false.
	-- adminEncryption available options: rsa1024xtea;
	-- remember to set correct data!
	adminPort = 7171
	adminPassword = ""
	adminLocalhostOnly = true
	adminConnectionsLimit = 1
	adminRequireLogin = true
	adminEncryption = ""
	adminEncryptionData = ""

	-- Don't edit use at your own risk
	saveGlobalStorage = true
	bufferMutedOnSpellFailure = false