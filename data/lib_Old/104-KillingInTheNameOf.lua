RANK_NONE = 0
RANK_JOIN = 1
RANK_HUNTSMAN = 2
RANK_RANGER = 3
RANK_BIGGAMEHUNTER = 4
RANK_TROPHYHUNTER = 5
RANK_ELITEHUNTER = 6
 
REWARD_MONEY = 1
REWARD_EXP = 2
REWARD_ACHIEVEMENT = 3
REWARD_STORAGE = 4
REWARD_POINT = 5
REWARD_ITEM = 6
 
QUESTSTORAGE_BASE = 1500
JOIN_STOR = 100157
KILLSSTORAGE_BASE = 65000
REPEATSTORAGE_BASE = 48950
POINTSSTORAGE = 2500
tasks =
{
	--Tasks for level 6 to 49.
    [1] = {killsRequired = 400, raceName = "Trolls", level = {1, 150}, norepeatable = true, premium = false, creatures = {"troll", "troll champion", "island troll", "swamp troll"}, rewards = {
																																		{type = "exp", value = {30000}},
																																		{type = "item", value = {11197, 2}},
																																		{type = "money", value = {30000}}
																																	}},
	[2] = {killsRequired = 550, raceName = "Goblins", level = {1, 105}, norepeatable = true, premium = false, creatures = {"goblin", "goblin assassin", "goblin leader"}, rewards = {
																																		{type = "exp", value = {35000}},
																																		{type = "item", value = {11197, 2}},
																																		{type = "money", value = {35000}}
																																	}},
	[3] = {killsRequired = 300, raceName = "Rotworms", level = {1, 150}, norepeatable = true, premium = false, creatures = {"rotworm", "rotworm queen"}, rewards = {
																																		{type = "exp", value = {40000}},
																																		{type = "item", value = {11197, 1}},
																																		{type = "money", value = {40000}}
																																	}},	
	[4] = {killsRequired = 700, raceName = "Cyclops", level = {1, 150}, norepeatable = true, premium = false, creatures = {"cyclops", "cyclops smith", "cyclops smith"}, rewards = {
																																		{type = "exp", value = {50000}},
																																	    {type = "item", value = {11197, 2}},
																																		{type = "money", value = {50000}}
																																	}},																																		
	[5] = {killsRequired = 3000, raceName = "Bog Raiders", level = {1, 150}, norepeatable = true, premium = false, creatures = {"bog raider"}, rewards = {
																																		{type = "exp", value = {50000}},
																																		{type = "money", value = {50000}},
																																		{type = "achievement", value = {"Novato"}},
																																		{type = "item", value = {11198, 3}}, -- Reward -- 15 boss points
																																		{type = "storage", value = {35000, 1}},
																																		{type = "points", value = {1}}
																																	}},
	[6] = {killsRequired = 600, raceName = "Tarantulas", level = {1, 150}, norepeatable = true, premium = false, creatures = {"tarantula"}, rewards = {
																																		{type = "exp", value = {60000}}, -- Encontram-se em Amenofis
																																		{type = "money", value = {60000}},
																																		{type = "achievement", value = {"Welcome!"}},
																																		{type = "item", value = {5879, 5}}, -- Reward -- 5 spider silk
																																		{type = "storage", value = {35001, 1}},
																																		{type = "points", value = {2}}
																																	}},
	[7] = {killsRequired = 4000, raceName = "Carniphilas", level = {1, 150}, norepeatable = true, premium = false, creatures = {"carniphila"}, rewards = {
																																		{type = "exp", value = {200000}}, --  encontra-se em materos
																																		{type = "money", value = {200000}},
																																		{type = "achievement", value = {"Recruta"}},
																																		{type = "item", value = {5015, 1}}, -- Reward -- mandrake
																																		{type = "storage", value = {35002, 1}},
																																		{type = "points", value = {3}}
																																	}},
	[8] = {killsRequired = 500, raceName = "Stone Golems", level = {1, 150}, norepeatable = true, premium = false, creatures = {"stone golem"}, rewards = {
																																		{type = "exp", value = {70000}},
																																		{type = "money", value = {70000}},
																																		{type = "item", value = {11197, 2}},
																																		{type = "points", value = {2}}
																																	}},
	[9] = {killsRequired = 3000, raceName = "Kongras", level = {1, 150}, norepeatable = true, premium = false, creatures = {"sibang", "kongra", "merlkin"}, rewards = {
																																		{type = "exp", value = {150000}},																																		
																																		{type = "item", value = {5810, 1}}, -- Reward -- Pirate Voodoo Doll - addon druid
																																		{type = "money", value = {170000}},																								
																																		{type = "storage", value = {35003, 1}},
																																		{type = "points", value = {2}}
																																	}},

	[10] = {killsRequired = 700, raceName = " Tortoises", level = {1, 150}, norepeatable = true, premium = false, creatures = {"thornback tortoise", "tortoise"}, rewards = {
																																		{type = "exp", value = {80000}},
																																		{type = "money", value = {90000}},
																																		{type = "item", value = {11197, 5}},
																																		{type = "points", value = {2}}
																																	}},
 
	--Tasks for level 50 to 79.
 
	[11] = {killsRequired = 2000, raceName = "Ice Golems", level = {1, 150}, norepeatable = true, premium = false, creatures = {"ice golem"}, rewards = {
																																		{type = "exp", value = {120000}},
																																		{type = "item", value = {11197, 5}},
																																		{type = "achievement", value = {"Melhorando"}}, 
																																		{type = "storage", value = {35004, 1}},
																																		{type = "money", value = {100000}}, 
																																		{type = "points", value = {2}}
																																	}},
	[12] = {killsRequired = 800, raceName = "Mutated Rats", level = {1, 150}, norepeatable = true, premium = false, creatures = {"mutated rat"}, rewards = {
																																		{type = "exp", value = {100000}}, 
																																		{type = "achievement", value = {"Twisted Mutation"}},
																																		{type = "money", value = {100000}},
																																		{type = "item", value = {7884, 1}}, -- Reward -- Terra mantle
																																		{type = "storage", value = {35005, 1}},
																																		{type = "points", value = {2}}
																																	}},																																																																				
	[13] = {killsRequired = 1200, raceName = "Wailing Widows", level = {1, 150}, norepeatable = true, premium = false, creatures = {"wailing widow"}, rewards = {
																																		{type = "exp", value = {150000}},
																																		{type = "money", value = {160000}}, 
																																		{type = "item", value = {11198, 10}}, -- Reward -- 10 boss points
																																		{type = "points", value = {3}}
																																	}},		
	[14] = {killsRequired = 1500, raceName = "Crystal Spiders", level = {1, 150}, norepeatable = true, creatures = {"crystal spider"}, premium = false, rewards = {
																																		{type = "exp", value = {150000}},
																																		{type = "achievement", value = {"Arachnoise"}},
																																		{type = "money", value = {180000}}, -- adicionar site
																																		{type = "item", value = {5801, 1}}, -- Reward -- Jewered Backpack
																																		{type = "storage", value = {35007, 1}},
																																		{type = "points", value = {3}}
																																	}},	
 
	--Taks for level 80 to 129.
 
	[15] = {killsRequired = 5000, raceName = "Underwater Quara", level = {151, 999}, premium = false, norepeatable = true, creatures = {"quara hydromancer", "quara predator", "quara constrictor", "quara mantassin", "quara pincher"}, rewards = {
																																		{type = "exp", value = {250000}},
																																		{type = "money", value = {250000}}, -- adicionar site
																																		{type = "item", value = {5895, 100}}, -- 100 fish fin addon oriental
																																		{type = "achievement", value = {"Back into the Abyss"}},
																																		{type = "storage", value = {35008, 1}},
																																		{type = "points", value = {3}}
																																	}},	
 
	[16] = {killsRequired = 6000, raceName = "Giant Spiders", level = {151, 999}, premium = false, norepeatable = true, creatures = {"giant spider"}, rewards = {
																																		{type = "exp", value = {30000}},
																																		{type = "money", value = {400000}}, -- adicionar site
																																		{type = "achievement", value = {"Choking on Her Venom"}},
																																		{type = "item", value = {5886, 10}}, -- Reward -- 10 spool of yarn
																																		{type = "storage", value = {35009, 1}},
																																		{type = "points", value = {3}}
																																	}},	
 
	[17] = {killsRequired = 5000, raceName = "Werewolves", level = {151, 999}, premium = false, norepeatable = true, creatures = {"werewolf"}, rewards = {
																																		{type = "exp", value = {620000}},
																																		{type = "money", value = {650000}}, -- adicionar site
																																		{type = "item", value = {5953, 2}}, -- Reward -- voodoo skull
																																		{type = "achievement", value = {"Howly Silence"}},
																																		{type = "storage", value = {35010, 1}},
																																		{type = "points", value = {4}}
																																	}},
 
	[18] = {killsRequired = 5000, raceName = "Nightmares", level = {151, 999}, premium = false, norepeatable = true, creatures = {"nightmare", "nightmare scion"}, rewards = {
																																		{type = "exp", value = {300000}},
																																		{type = "money", value = {320000}},
																																		{type = "achievement", value = {"Dream is Over"}},
																																		{type = "storage", value = {35011, 1}},
																																		{type = "points", value = {3}}
																																	}},		
 
	[19] = {killsRequired = 10000, raceName = "Hellspawns", level = {151, 999}, premium = false, norepeatable = true, creatures = {"hellspawn"}, rewards = {
																																		{type = "exp", value = {350000}},
																																		{type = "item", value = {5953, 2}}, -- voodoo doolll addon druid
																																		{type = "money", value = {400000}},
																																		{type = "achievement", value = {"Scorched Flames"}},
																																		{type = "storage", value = {35012, 1}}
																																	}},
 
	[20] = {killsRequired = 10000, raceName = "High Class Lizards", level = {151, 999}, norepeatable = true, premium = false, creatures = {"lizard chosen", "lizard dragon priest", "lizard high guard", "lizard legionnaire"}, rewards = {
																																		{type = "exp", value = {600000}},
																																		{type = "achievement", value = {"Zzztill Zzztanding!"}},
																																		{type = "item", value = {11198, 50}}, -- Reward -- 50 boss points
																																		{type = "money", value = {600000}},
																																		{type = "storage", value = {35013, 1}},
																																		{type = "points", value = {3}}
																																	}},									
	--Tasks for level 130+																									
	[21] = {killsRequired = 35000, raceName = "Hydras", level = {151, 999}, premium = false, norepeatable = true, creatures = {"hydra"}, rewards = {
																																		{type = "exp", value = {5500000}},
																																		{type = "money", value = {1000000}}, -- adicionar site
																																		{type = "achievement", value = {"One Less"}},
																																	    {type = "item", value = {10523, 1}}, -- Reward -- egg of manny
																																		{type = "storage", value = {35015, 1}},
																																		{type = "points", value = {3}}
																																	}},	
 
	[22] = {killsRequired = 29000, raceName = "Serpent Spawns", level = {151, 999}, norepeatable = true, premium = false, creatures = {"serpent spawn"}, rewards = {
																																		{type = "exp", value = {600000}},
																																		{type = "achievement", value = {"Hissing Downfall"}},
																																		{type = "storage", value = {35016, 1}},
																																		{type = "item", value = {10309, 1}}, -- Reward -- voodoo skull
																																		{type = "money", value = {600000}}, -- adicionar site
																																		{type = "points", value = {4}}
																																	}},		
 
	[23] = {killsRequired = 20000, raceName = "Medusas", level = {151, 999}, premium = false, norepeatable = true, creatures = {"medusa"}, rewards = {
																																		{type = "exp", value = {8000000}},
																																		{type = "achievement", value = {"The Serpent's Bride"}},
																																		{type = "money", value = {800000}},
																																		{type = "storage", value = {35017, 1}},
																																	    {type = "item", value = {12324, 1}}, -- Reward -- Snake Crow
																																		{type = "points", value = {5}}
																																	}},	
 
	[24] = {killsRequired = 45000, raceName = "Behemoths", level = {151, 999}, premium = false, creatures = {"behemoth"}, rewards = {
																																		{type = "exp", value = {1000000}},
																																		{type = "achievement", value = {"Just Cracked Me Up!"}},
																																		{type = "money", value = {500000}},
																																		{type = "storage", value = {35018, 1}},
																																	    {type = "item", value = {5953, 1}}, -- Reward -- addon oriental pente
																																		{type = "points", value = {4}}
																																	}},	
 
	[25] = {killsRequired = 6000, raceName = "Sea Serpents", level = {151, 999}, premium = false, norepeatable = true, creatures = {"sea serpent", "young sea serpent"}, rewards = {
																																		{type = "exp", value = {350000}},
																																		{type = "money", value = {400000}},
																																		{type = "achievement", value = {"The Drowned Sea God"}},
																																		{type = "item", value = {8887, 1}}, -- Reward -- frozen plate
																																		{type = "storage", value = {35019, 1}},
																																		{type = "points", value = {3}}
																																	}},		
 
	[26] = {killsRequired = 500, raceName = "Hellhounds", level = {151, 999}, premium = false, norepeatable = true, creatures = {"hellhound"}, rewards = {
																																		{type = "exp", value = {600000}},
																																		{type = "money", value = {700000}},
																																		{type = "achievement", value = {"The Gates of Hell"}},
																																		{type = "item", value = {11198, 45}}, -- Reward -- 50 boss points
																																		{type = "storage", value = {35020, 1}},
																																		{type = "points", value = {5}}
																																	}},		
 
	[27] = {killsRequired = 666, raceName = "Ghastly Dragons", level = {151, 999}, premium = false, norepeatable = true, creatures = {"ghastly dragon"}, rewards = {
																																		{type = "exp", value = {666000}},
																																		{type = "money", value = {666000}},
																																		{type = "item", value = {9955, 1}}, -- item que completa addon yalaharian
																																		{type = "achievement", value = {"Beautiful Agony"}},
																																		{type = "storage", value = {35021, 1}},
																																		{type = "points", value = {5}}
																																	}},		
 
	[28] = {killsRequired = 15000, raceName = "Drakens", level = {151, 999}, premium = false, norepeatable = true, creatures = {"draken spellweaver", "draken warmaster", "draken abomination", "draken elite"} , rewards = {
																																		{type = "exp", value = {1000000}},
																																		{type = "money", value = {1000000}},
																																		{type = "achievement", value = {"Enter zze Draken!"}},
																																		{type = "item", value = {12649, 1}}, -- Reward -- blade of corrupt
																																		{type = "storage", value = {35022, 1}},
																																		{type = "points", value = {3}}
																																	}},	
 
	[29] = {killsRequired = 1000, raceName = "Destroyers", level = {151, 999}, premium = false, norepeatable = true, creatures = {"destroyer"}, rewards = {
																																		{type = "exp", value = {400000}},
																																		{type = "money", value = {500000}},
																																		{type = "achievement", value = {"Best there was!"}},
																																		{type = "storage", value = {35023, 1}},
																																		{type = "points", value = {4}}
																																	}},			
 
	[30] = {killsRequired = 500, raceName = "Undead Dragons", level = {151, 999}, premium = false, norepeatable = true, creatures = {"undead dragon"}, rewards = {
																																		{type = "exp", value = {500000}},
																																		{type = "money", value = {500000}},
																																		{type = "item", value = {8885, 1}},
																																		{type = "achievement", value = {"Back from the Dead"}},
																																		{type = "storage", value = {35024, 1}},
																																		{type = "points", value = {6}}
																																	}},	
 
	--Special tasks.
 

 
	[31] = {killsRequired = 6000, raceName = "Green Djinns", level = {151, 999}, rank = RANK_JOIN, norepeatable = true, premium = false, creatures = {"green djinn", "efreet"}, rewards = { --Requires an storage (Gained on The Djinn War - Marid Faction)
																																		{type = "exp", value = {300000}},
																																		{type = "money", value = {32000}},
																																		{type = "item", value = {5809, 1}}, -- Reward -- 10 ankh
																																		{type = "storage", value = {35025, 1}}
																																	}},
 
	[32] = {killsRequired = 8000, raceName = "Blue Djinns", level = {151, 999}, rank = RANK_JOIN, norepeatable = true, premium = false, creatures = {"blue djinn", "marid"}, rewards = { --Requires an storage (Gained on The Djinn War - Efreet Faction)
																																		{type = "exp", value = {300000}},
																																		{type = "item", value = {5809, 1}}, -- Reward -- 10 ankh
																																		{type = "money", value = {320000}},
																																		{type = "storage", value = {35026, 1}}
																																	}},		
 
	[33] = {killsRequired = 1400, raceName = "Defiler", level = {151, 999}, norepeatable = true, rank = RANK_JOIN, premium = false, creatures = {"defiler"}, rewards = { --Requires an storage (Gained on The Shattered Isles Quest)
																																		{type = "exp", value = {600000}},
																																		{type = "money", value = {700000}},
																																		{type = "item", value = {5924, 1}}, -- Reward -- damaged skull helmet
																																		{type = "storage", value = {35027, 1}}
																																	}},	
																																	
	[34] = {killsRequired = 5000, raceName = "Minotaurs", level = {151, 999}, rank = RANK_JOIN, premium = false, creatures = {"minotaur", "minotaur mage", "minotaur archer"}, rewards = { --Requires an storage (Gained on The Djinn War - Marid Faction)
																																		{type = "storage", value = {35028, 1}},
																																		{type = "exp", value = {500000}},
																																		{type = "money", value = {500000}},
																																	    {type = "item", value = {5804, 1}}, -- Recompensa - nose ring
																																		{type = "money", value = {80000}}
																																		
																																	}},																																
 
	[35] = {killsRequired = 10000, raceName = "Necromancers", level = {151, 999}, norepeatable = true, premium = false, creatures = {"necromancer", "priestess"}, rewards = { --Requires an storage (Gained on To Outfox a Fox Quest)
																																		{type = "storage", value = {35029, 1}},
																																		{type = "exp", value = {450000}},
																																		{type = "money", value = {500000}},
																																		{type = "item", value = {5809, 1}}, --- recompensa soul stone
																																		{type = "money", value = {500000}}
																																	}},	

																																	
	[36] = {killsRequired = 25000, raceName = "Dragons", level = {151, 999}, norepeatable = true, premium = false, creatures = {"dragon", "dragon lord", "frost dragon"}, rewards = { 
																																		{type = "exp", value = {1000000}},
																																		{type = "money", value = {2000000}},
																																		{type = "item", value =  {10559,5}}, --- recompensa dragon claw + dragon scale legs
																																		{type = "storage", value = {35030, 1}}
																																	}},	
	[37] = {killsRequired = 3000, raceName = "Elfs", level = {1, 150}, norepeatable = true, premium = false, creatures = {"elf", "elf scout", "elf arcanist", "elf guard"}, rewards = { 
																																		{type = "exp", value = {200000}},
																																		{type = "money", value = {300000}},
																																		{type = "item", value = {5947, 1}}, -- Recompensa - Elanes Crossbow
																																		{type = "storage", value = {35031, 1}}
																																	}},	

	[38] = {killsRequired = 38000, raceName = "Grim Reapers", level = {151, 999}, norepeatable = true, premium = false, creatures = {"grim reaper"}, rewards = { 
																																		{type = "exp", value = {7000000}},
																																		{type = "money", value = {800000}},
																																		{type = "item", value = {11374, 1}}, -- Old Neckale
																																		{type = "storage", value = {35032, 1}}
																																	}},		
	[39] = {killsRequired = 6666, raceName = "Demons", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"demon"}, rewards = {
																																		{type = "storage", value = {3503, 1}}, --Storage that let's you to start Demon Oak
																																		{type = "item", value = {8293, 1}}, -- hall axe
																																		{type = "exp", value = {6666000}},
																																		{type = "money", value = {666000}}
																																	}},
	[40] = {killsRequired = 200000, raceName = "Warlocks", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"warlock"}, rewards = {
																																		{type = "storage", value = {3504, 1}}, --Storage that let's you to start Demon Oak
																																		{type = "item", value = {5903, 1}}, -- Recompensa - 100 Talons + holy icon
																																		{type = "exp", value = {20000000}},
																																		{type = "money", value = {1500000}}
																																	}},
	[41] = {killsRequired = 50000, raceName = "Furys", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"fury"}, rewards = {
																																		{type = "storage", value = {3505, 1}}, --Storage that let's you to start Demon Oak
																																		{type = "item", value = {10224, 1}}, -- Recompensa - 100 Talons + holy icon
																																		{type = "exp", value = {20000000}},
																																		{type = "money", value = {1500000}}
																																	}},
	[42] = {killsRequired = 150000, raceName = "Infernalists", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"infernalist"}, rewards = {
																																		{type = "storage", value = {3506, 1}}, --Storage that let's you to start Demon Oak
																																		{type = "item", value = {8905, 1}}, -- Recompensa - 100 Talons + holy icon
																																		{type = "exp", value = {50000000}},
																																		{type = "money", value = {1500000}}
																																	}},
	[43] = {killsRequired = 100000, raceName = "Guzzlemaws", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"guzzlemaw", "frazzlemaw", "silencer", "retching horror"}, rewards = {
																																		{type = "storage", value = {3507, 1}}, --Storage that let's you to start Demon Oak
																																		{type = "item", value = {12816, 1}}, -- Recompensa - 100 Talons + holy icon
																																		{type = "exp", value = {50000000}},
																																		{type = "money", value = {5000000}}
																																	}},
																																	
	[44] = {killsRequired = 100000, raceName = "Pharaohs", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"pharaoh", "mistic mummy", "orshid hamses", "quara mantassin", "quara pincher"}, 
	                                                                                                                                                                  rewards = {
																																
																																		{type = "exp", value = {250000}},
																																		{type = "money", value = {250000}}, -- adicionar site
																																		{type = "item", value = {5895, 100}}, -- 100 fish fin addon oriental
																																		{type = "storage", value = {3508, 1}},
																																		{type = "points", value = {3}}
																																	}},
																																	
	[45] = {killsRequired = 25000, raceName = "Bosses", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"apocalypse", "ghazbaran", "hellgorak", "morgaroth"}, 
	                                                                                                                                                                  rewards = {
																																
																																		{type = "exp", value = {250000}},
																																		{type = "money", value = {250000}}, -- adicionar site
																																		{type = "item", value = {12797, 1}}, -- 100 fish fin addon oriental
																																		{type = "storage", value = {3509}},
																																		{type = "points", value = {3}}
																																	}},
																																	
	[46] = {killsRequired = 10, raceName = "Ferumbras", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"Ferumbras"}, 
	                                                                                                                                                                  rewards = {
																																
																																		{type = "exp", value = {250000}},
																																		{type = "money", value = {250000}}, -- adicionar site
																																		{type = "item", value = {12804, 1}}, -- 100 fish fin addon oriental
																																		{type = "storage", value = {3510}},
																																		{type = "points", value = {3}}
																																	}},
	[47] = {killsRequired = 90000, raceName = "Bosses", level = {151, 999}, norepeatable = true, rank = RANK_ELITEHUNTER, premium = false, creatures = {"icecold human", "burning human", "cursed human", "biting human"}, 
	                                                                                                                                                                  rewards = {
																																
																																		{type = "exp", value = {250000}},
																																		{type = "money", value = {250000}}, -- adicionar site
																																		{type = "item", value = {12814, 1}}, -- 100 fish fin addon oriental
																																		{type = "storage", value = {3511}},
																																		{type = "points", value = {3}}
																																	}},																														
																																	
																																																														
																																	
}
 
tasksByPlayer = 3
repeatTimes = 3
 
function getPlayerRank(cid)
	return (getPlayerStorageValue(cid, POINTSSTORAGE) >= 100 and RANK_ELITEHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 70 and RANK_TROPHYHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 40 and RANK_BIGGAMEHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 20 and RANK_RANGER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 10 and RANK_HUNTSMAN or getPlayerStorageValue(cid, JOIN_STOR) == 1 and RANK_JOIN or RANK_NONE)
end
 
function getTaskByName(name, table)
	local t = (table and table or tasks)
	for k, v in pairs(t) do
		if v.name then
			if v.name:lower() == name:lower() then
				return k
			end
		else
			if v.raceName:lower() == name:lower() then
				return k
			end
		end
	end
	return false
end
 
function getTasksByPlayer(cid)
	local canmake = {}
	local able = {}
	for k, v in pairs(tasks) do
		if getCreatureStorage(cid, QUESTSTORAGE_BASE + k) < 1 and getCreatureStorage(cid, REPEATSTORAGE_BASE + k) < repeatTimes then
			able[k] = true
			if getPlayerLevel(cid) < v.level[1] or getPlayerLevel(cid) > v.level[2] then
				able[k] = false
			end
			if v.storage and getCreatureStorage(cid, v.storage[1]) < v.storage[2] then
				able[k] = false
			end
 
			if v.rank then
				if getPlayerRank(cid) < v.rank then
					able[k] = false
				end
			end
 
			if v.premium then
				if not isPremium(cid) then
					able[k] = false
				end
			end
 
			if able[k] then
				table.insert(canmake, k)
			end
		end
	end
	return canmake
end
 
 
function canStartTask(cid, name, table)
	local v = ""
	local id = 0
	local t = (table and table or tasks)
	for k, i in pairs(t) do
		if i.name then
			if i.name:lower() == name:lower() then
				v = i
				id = k
				break
			end
		else
			if i.raceName:lower() == name:lower() then
				v = i
				id = k
				break
			end
		end
	end
	if v == "" then
		return false
	end
	if getCreatureStorage(cid, QUESTSTORAGE_BASE + id) > 0 then
		return false
	end
	if (getCreatureStorage(cid, REPEATSTORAGE_BASE +  id) >= repeatTimes) or (v.norepeatable and getCreatureStorage(cid, REPEATSTORAGE_BASE +  id) > 0) then
		return false
	end
	if getPlayerLevel(cid) >= v.level[1] and getPlayerLevel(cid) <= v.level[2] then
		if v.premium then
			if isPremium(cid) then
				if v.rank then
					if getPlayerRank(cid) >= v.rank then
						if v.storage then 
							if getCreatureStorage(cid, v.storage[1]) >= v.storage[2] then
								return true
							end
						else
							return true
						end
					end
				else
					return true
				end
			end
		else
			return true
		end
	end
	return false
end
 
function getPlayerStartedTasks(cid)
 
	local tmp = {}
	for k, v in pairs(tasks) do
		if getCreatureStorage(cid, QUESTSTORAGE_BASE + k) > 0 and getCreatureStorage(cid, QUESTSTORAGE_BASE + k) < 2 then
			table.insert(tmp, k) 
		end
	end
	return tmp
end
 
function isSummon(cid)
	return getCreatureMaster(cid) ~= nil or false
end