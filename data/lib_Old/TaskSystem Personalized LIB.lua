-- ########################################################
-- #####       	  Name: Adriano Swatt'   	          #####
-- ##### 			  Version: 3.0                    #####
-- ########################################################
-- #####  		Developed by Adriano Swatt'			  #####
-- #####  	 Contact: adrianoswat@yahoo.com.br        #####
-- #####  	 PERSONALIZED TASK SYSTEM BY SWATT'    	  #####
-- ########################################################

-- [[ EXPLAIN // EXPLICAÇÃO // COMO CONFIGURAR ]] --
-- storage = Storage Que Salva: Task Ativa
		-- Storaged = Dia/Hora/Minute
-- countSto = Storage Que Salva Quantidade que Matou
-- count = Quantidade Total Que Precisará Matar
-- price = Preço da Task em Gold Coins
-- inDay = Day Value: Quantos dias para realizar // 0: se a task fica ativa até a conclusão
-- awards = [1] = {id = Premio, multiply = quantidade} // seguindo modelo // usar [1] = {id = "exp", multiply = QUANTIDADE}
-- DICA: Deixe sempre a Experiência por último

--StorageSave: 
-- storage = storage_status = key: 20001
-- storage_r = storage_repeat = key: 20001r
-- storage_d = storage_date = key: 20001d


-- 1 - O player terá que cumprir as tasks ordenadamente.
-- 2 - As tasks se dividirão em 4 fases: low, medium, high, especial.
-- 3 - O player poderá ter até 3 tasks abertas. 
-- 4 - Assim que o player termina uma Task que tem Boss, ele fala com o npc, hi, report, boss, e o npc joga ele automaticamente pra sala do boss. Assim que o player finaliza o boss, ele vai pro templo.


_SETTING_TASK_SYSTEM_CONFIG = {
	taskAtSameTime = 3, -- Quantas Tasks Ativas Ao Mesmo Tempo
	bossRoom = {
		ctrl_storage = "boss_ctrl", -- Nao Precisa Mexer
		bossPos = {x = 436, y = 31, z = 7}, -- Posição do Boss
		enterPos = {x = 436, y = 49, z = 7}, -- Posição do Player
		fromPos = {x = 420, y = 25, z = 7}, -- Topo da Sala
		toPos = {x = 449, y = 53, z = 7}, -- Término da Sala
	}
}

_MONSTERS_TASK_SYSTEM_CONFIG = { 	
    ["troll"] = {storage = 20001, countSto = 30001, count = 200, price = 0, inDay = 0, premmy = false,
		mlist = {"troll", "troll champion", "troll green"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = "exp", multiply = 50000}
			}
		},
	-- [[ SPACE ]] --
	["rotworm"] = {storage = 20002, countSto = 30002, count = 400, price = 0, inDay = 0, premmy = false,
		mlist = {"rotworm", "carrion worm"}, boss = "none",
		awards = {
				[1] = {id = 2160, multiply = 10},
				[2] = {id = 2480, multiply = 1}, -- legion helmet
				[3] = {id = "exp", multiply = 50000}
			}
		},
	
	-- [[ SPACE ]] --
	["crocodile"] = {storage = 20004, countSto = 30004, count = 200, price = 500, inDay = 0, premmy = false,
		mlist = {"crocodile"}, boss = "the snapper",
		awards = {
			[1] = {id = 2160, multiply = 20},			
			[2] = {id = "exp", multiply = 50000}
		}
	},
	-- [[ SPACE ]] --
	["dwarf"] = {storage = 20005, countSto = 30005, count = 600, price = 600, inDay = 0, premmy = false,
		mlist = {"dwarf", "dwarf guard", "dwarf soldier", "dwarf geomancer"}, boss = "dwarf geomancer",
		awards = {
			[1] = {id = 2160, multiply = 20},			
			[2] = {id = "exp", multiply = 70000}
		}
	},		
	-- [[ SPACE ]] --
	["elf"] = {storage = 20006, countSto = 30006, count = 700, price = 5000, inDay = 0, premmy = false,
		mlist = {"elf", "elf scout", "elf arcanist", "elf guard"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 20},
			[2] = {id = 5947, multiply = 1}, -- elanes crossbow			
			[3] = {id = "exp", multiply = 70000}
		}
	},		
	-- [[ SPACE ]] --
	["tarantula"] = {storage = 20007, countSto = 30007, count = 500, price = 0, inDay = 0, premmy = false,
		mlist = {"tarantula"}, boss = "hide",
		awards = {
			[1] = {id = 2160, multiply = 20},
			[2] = {id = "exp", multiply = 50000}
		}
	},	
	-- [[ SPACE ]] --
	["minotaur"] = {storage = 20008, countSto = 30008, count = 100, price = 0, inDay = 0, premmy = false,
		mlist = {"minotaur", "minotaur archer", "minotaur mage", "minotaur guard"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = 5804, multiply = 5}, -- nose ring		
			[3] = {id = "exp", multiply = 70000}
		}
	},			
	-- [[ SPACE ]] --
	["cyclops"] = {storage = 20009, countSto = 30009, count = 600, price = 0, inDay = 0, premmy = false,
		mlist = {"cyclops", "cyclops smith", "cyclops drone"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = 5939, multiply = 1},			
			[3] = {id = "exp", multiply = 40000}
		}
	},	
	-- [[ SPACE ]] --
	["wailing widow"] = {storage = 20010, countSto = 30010, count = 500, price = 0, inDay = 0, premmy = false,
		mlist = {"wailing widow"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = "exp", multiply = 50000}
		}
	},		
	-- [[ SPACE ]] --
	["bog raider"] = {storage = 20011, countSto = 30011, count = 600, price = 0, inDay = 0, premmy = false,
		mlist = {"werewolf"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},			
			[2] = {id = 8891, multiply = 1}, -- paladin armor		
			[3] = {id = "exp", multiply = 70000}
		}
	},				
	-- [[ SPACE ]] --
	["earth elemental"] = {storage = 20012, countSto = 30012, count = 500, price = 0, inDay = 0, premmy = false,
		mlist = {"earth elemental"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},			
			[2] = {id = "exp", multiply = 70000}
		}
	},					
	-- [[ SPACE ]] --
	["giant spider"] = {storage = 20013, countSto = 30013, count = 600, price = 0, inDay = 0, premmy = false,
		mlist = {"giant spider"}, boss = "the old widow",
		awards = {
			[1] = {id = 2160, multiply = 40},			
			[2] = {id = 5879, multiply = 10},			
			[3] = {id = "exp", multiply = 80000}
		}
	},			
	-- [[ SPACE ]] --
	["werewolf"] = {storage = 20014, countSto = 30014, count = 500, price = 0, inDay = 0, premmy = false,
		mlist = {"werewolf"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},				
			[2] = {id = 7383, multiply = 1}, -- relic sword				
			[3] = {id = "exp", multiply = 80000}
		}
	},			
	-- [[ SPACE ]] --
	["stone golem"] = {storage = 20015, countSto = 30015, count = 300, price = 0, inDay = 0, premmy = false,
		mlist = {"stone golem"}, boss = "none",
		awards = {					
			[1] = {id = 2160, multiply = 30},					
			[2] = {id = "exp", multiply = 80000}
		}
	},		
	-- [[ SPACE ]] --
	["kongra"] = {storage = 20016, countSto = 30016, count = 600, price = 0, inDay = 0, premmy = false,
		mlist = {"kongra", "sibang", "merklin"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},									
			[2] = {id = "exp", multiply = 30000}
		}
	},	
	-- [[ SPACE ]] --
	["tortoise"] = {storage = 20017, countSto = 30017, count = 500, price = 0, inDay = 0, premmy = false,
		mlist = {"thornback tortoise", "tortoise"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 20},
			[2] = {id = "exp", multiply = 60000}
		}
	},	
	-- [[ SPACE ]] --
	["crystal spider"] = {storage = 20018, countSto = 30018, count = 600, price = 0, inDay = 0, premmy = false,
		mlist = {"sea serpent"}, boss = "the old widow",
		awards = {
			[1] = {id = 2160, multiply = 30},	
			[2] = {id = 5801, multiply = 1}, -- jewelled backpack						
			[3] = {id = "exp", multiply = 30000}
		}
	},
	-- [[ SPACE ]] --
	["quara hydromancer"] = {storage = 20019, countSto = 30019, count = 700, price = 0, inDay = 0, premmy = false,
		mlist = {"quara predactor", "quara hydromancer", "quara constrictor", "quara mantassin", "quara pincher"}, boss = "thul",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = 5895, multiply = 25}, -- fish fin									
			[3] = {id = "exp", multiply = 50000}
		}
	},
	-- [[ SPACE ]] --
	["hellspawn"] = {storage = 20020, countSto = 30020, count = 400, price = 0, inDay = 0, premmy = false,
		mlist = {"hellspawn"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},	
			[2] = {id = 6500, multiply = 25}, -- demonic essence									
			[3] = {id = "exp", multiply = 80000}
		}
	},				
	-- [[ SPACE ]] --
	["hydra"] = {storage = 20021, countSto = 30021, count = 15000, price = 0, inDay = 0, premmy = false,
		mlist = {"hydra"}, boss = "the many",
		awards = {
			[1] = {id = 2160, multiply = 100},			
			[2] = {id = 10523, multiply = 1}, -- egg of the many									
			[3] = {id = "exp", multiply = 80000}
		}
	},					
	-- [[ SPACE ]] --
	["dragon"] = {storage = 20022, countSto = 30022, count = 9000, price = 0, inDay = 0, premmy = false,
		mlist = {"dragon"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 80},
			[2] = {id = 10020, multiply = 1}, -- dragon claw										
			[3] = {id = "exp", multiply = 100000}
		}
	},	
	-- [[ SPACE ]] --
	["dragon lord"] = {storage = 20023, countSto = 30023, count = 10000, price = 0, inDay = 0, premmy = false,
		mlist = {"dragon lord"}, boss = "demodras",
		awards = {
			[1] = {id = 2495, multiply = 100},
			[2] = {id = 5919, multiply = 1}, -- red dragon claw														
			[3] = {id = "exp", multiply = 100000}
		}
	},	
	
	-- [[ SPACE ]] --
	["lizard high guard"] = {storage = 20024, countSto = 30024, count = 5000, price = 10000, inDay = 0, premmy = false,
		mlist = {"lizard chosen", "lizard dragon priest", "lizard high guard", "lizard legionnaire"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 5804, multiply = 1}, -- nose ring		
			[3] = {id = "exp", multiply = 120000}
		}
	},

	-- [[ NOVAS ]] --
	["vampire"] = {storage = 20025, countSto = 30025, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"vampire"}, boss = "arachir the ancient one",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = "exp", multiply = 120000}
		}
	},	

	-- [[ NOVAS ]] --
	["frost dragon"] = {storage = 20025, countSto = 30025, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"frost dragon"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = "exp", multiply = 200000}
		}
	},	

	-- [[ NOVAS ]] --
	["nightmare"] = {storage = 20026, countSto = 30026, count = 2000, price = 10000, inDay = 0, premmy = false,
		mlist = {"nightmare"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 6524, multiply = 1}, -- skeleton decoration			
			[3] = {id = "exp", multiply = 200000}
		}
	},

	-- [[ NOVAS ]] --
	["blue djinn"] = {storage = 20027, countSto = 30027, count = 2000, price = 10000, inDay = 0, premmy = false,
		mlist = {"blue djinn", "green djinn", "marid"}, boss = "merikh the slaughterer",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = 5945, multiply = 1},			
			[3] = {id = "exp", multiply = 200000}
		}
	},	

	-- [[ NOVAS ]] --
	["serpent spawn"] = {storage = 20028, countSto = 30028, count = 5000, price = 10000, inDay = 0, premmy = false,
		mlist = {"serpent spawn"}, boss = "the noxious spawn",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = "exp", multiply = 200000}
		}
	},

	-- [[ NOVAS ]] --
	["wyrm"] = {storage = 20029, countSto = 30029, count = 2000, price = 10000, inDay = 0, premmy = false,
		mlist = {"wyrm"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = "exp", multiply = 200000}
		}
	},		

	-- [[ NOVAS ]] --
	["elder wyrm"] = {storage = 20030, countSto = 30030, count = 1500, price = 10000, inDay = 0, premmy = false,
		mlist = {"elder wyrm"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = "exp", multiply = 300000}
		}
	},	

	-- [[ NOVAS ]] --
	["medusa"] = {storage = 20031, countSto = 30031, count = 20000, price = 10000, inDay = 0, premmy = false,
		mlist = {"medusa"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 100},
			[1] = {id = 12324, multiply = 1}, -- snake crow
			[2] = {id = "exp", multiply = 300000}
		}
	},	

	-- [[ NOVAS ]] --
	["defiler"] = {storage = 20032, countSto = 30032, count = 5000, price = 10000, inDay = 0, premmy = false,
		mlist = {"defiler"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = "exp", multiply = 200000}
		}
	},

	-- [[ NOVAS ]] --
	["infernalist"] = {storage = 20033, countSto = 30033, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"infernalist"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = 5904, multiply = 50}, -- magic sulphur			
			[3] = {id = "exp", multiply = 210000}
		}
	},	

	-- [[ NOVAS ]] --
	["draken"] = {storage = 20034, countSto = 30034, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"draken", "draken abomination", "draken elite", "draken spellweaver", "draken warmaster"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = 12644, multiply = 1}, -- shield of corruption
			[3] = {id = "exp", multiply = 220000}
		}
	},

	-- [[ NOVAS ]] --
	["warlock"] = {storage = 20035, countSto = 30035, count = 14000, price = 10000, inDay = 0, premmy = false,
		mlist = {"warlock"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 13049, multiply = 1}, -- crude umbral spel
			[3] = {id = "exp", multiply = 230000}
		}
	},	

	-- [[ NOVAS ]] --
	["plaguesmith"] = {storage = 20036, countSto = 30036, count = 15000, price = 10000, inDay = 0, premmy = false,
		mlist = {"plaguesmith"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = 13393, multiply = 3}, -- silver token		
			[3] = {id = "exp", multiply = 240000}
		}
	},		

	-- [[ NOVAS ]] --
	["grim reaper"] = {storage = 20037, countSto = 30037, count = 25000, price = 10000, inDay = 0, premmy = false,
		mlist = {"grim reaper"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 11374, multiply = 1}, -- old neckace				
			[3] = {id = "exp", multiply = 300000}
		}
	},	
	
	-- [[ NOVAS ]] --
	["behemoth"] = {storage = 20038, countSto = 30038, count = 10000, price = 10000, inDay = 0, premmy = false,
		mlist = {"behemoth"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = 13394, multiply = 2}, -- gold token				
			[3] = {id = "exp", multiply = 200000}
		}
	},
	-- [[ NOVAS ]] --
	["ghastly dragon"] = {storage = 20039, countSto = 30039, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"ghastly dragon"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = "exp", multiply = 340000}
		}
	},	
	-- [[ NOVAS ]] --
	["sea serpent"] = {storage = 20040, countSto = 30040, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"sea serpent"}, boss = "leviathan",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = "exp", multiply = 200000}
		}
	},
	-- [[ NOVAS ]] --
	["hellhound"] = {storage = 20041, countSto = 30041, count = 700, price = 10000, inDay = 0, premmy = false,
		mlist = {"hellhound"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = "exp", multiply = 200000}
		}
	},	
	-- [[ NOVAS ]] --
	["hellfire fighter"] = {storage = 20042, countSto = 30042, count = 25000, price = 5000, inDay = 0, premmy = false,
		mlist = {"hellfire fighter"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 13394, multiply = 2}, -- gold token				
			[3] = {id = "exp", multiply = 400000}
		}
	},	
	-- [[ NOVAS ]] --
	["fury"] = {storage = 20043, countSto = 30043, count = 15000, price = 10000, inDay = 0, premmy = false,
		mlist = {"fury"}, boss = "furyosa",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[3] = {id = 7735, multiply = 1}, -- furiosa wand				
			[2] = {id = "exp", multiply = 250000}
		}
	},
	-- [[ NOVAS ]] --
	["frazzlemaw"] = {storage = 20044, countSto = 30044, count = 3000, price = 10000, inDay = 0, premmy = false,
		mlist = {"frazzlemaw"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 20},
			[2] = {id = 13354, multiply = 5}, -- cruster of solace			
			[3] = {id = "exp", multiply = 300000}
		}
	},	
	-- [[ NOVAS ]] --
	["grim reaper"] = {storage = 20045, countSto = 30045, count = 25000, price = 10000, inDay = 0, premmy = false,
		mlist = {"grim reaper"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 11374, multiply = 1}, -- old neckace				
			[3] = {id = "exp", multiply = 300000}
		}
	},	
	-- [[ NOVAS ]] --
	["guzzlemaw"] = {storage = 20046, countSto = 30046, count = 15000, price = 10000, inDay = 0, premmy = false,
		mlist = {"guzzlemaw"}, boss = "mawhawk",
		awards = {
			[1] = {id = 2160, multiply = 20},
			[2] = {id = 13353, multiply = 15}, -- dream matter			
			[3] = {id = "exp", multiply = 320000}
		}
	},
	-- [[ NOVAS ]] --
	["choking fear"] = {storage = 20047, countSto = 30047, count = 10000, price = 10000, inDay = 0, premmy = false,
		mlist = {"choking fear"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 30},
			[2] = {id = 13354, multiply = 5}, -- cruster of solace			
			[3] = {id = "exp", multiply = 350000}
		}
	},	
	-- [[ NOVAS ]] --
	["destroyer"] = {storage = 20048, countSto = 30048, count = 12000, price = 6000, inDay = 0, premmy = false,
		mlist = {"destroyer"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 7427, multiply = 5}, -- chaos mace			
			[3] = {id = "exp", multiply = 350000}
		}
	},
	-- [[ NOVAS ]] --
	["silencer"] = {storage = 20049, countSto = 30049, count = 10000, price = 10000, inDay = 0, premmy = false,
		mlist = {"silencer"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 60},
			[2] = {id = 13354, multiply = 10}, -- cruster of solace				
			[3] = {id = "exp", multiply = 400000}
		}
	},	
	-- [[ NOVAS ]] --
	["demon"] = {storage = 20050, countSto = 30050, count = 6666, price = 10000, inDay = 0, premmy = false,
		mlist = {"demon"}, boss = "orshabaal",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = 8293, multiply = 1}, -- hallowed axe			
			[3] = {id = "exp", multiply = 500000}
		}
	},	
	-- [[ NOVAS ]] --
	["dawnfire asura"] = {storage = 20051, countSto = 30051, count = 15000, price = 10000, inDay = 0, premmy = false,
		mlist = {"dawnfire asura", "midnight asura"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 40},
			[2] = {id = 13393, multiply = 5}, -- silver token	
			[3] = {id = "exp", multiply = 550000}
		}
	},	
	-- [[ NOVAS ]] --
	["energetic book"] = {storage = 20052, countSto = 30052, count = 15000, price = 10000, inDay = 0, premmy = false,
		mlist = {"energetic book", "burning book", "icecold book", "cursed book"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 50},
			[2] = {id = 12861, multiply = 1}, -- collar of blue plasma	
			[3] = {id = 12870, multiply = 1}, -- collar of green plasma	
			[4] = {id = 12871, multiply = 1}, -- collar of red plasma										
			[5] = {id = "exp", multiply = 1000000}
		}
	},	
	-- [[ NOVAS ]] --
	["distorted phantom"] = {storage = 20053, countSto = 30053, count = 5000, price = 10000, inDay = 15, premmy = false,
		mlist = {"distorted phantom"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 100},
			[2] = {id = 13394, multiply = 5}, -- gold token				
			[3] = {id = "exp", multiply = 1000000}
		}
	},		
	-- [[ NOVAS ]] --
	["many faces"] = {storage = 20054, countSto = 30054, count = 5000, price = 10000, inDay = 15, premmy = false,
		mlist = {"many faces"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 100},
			[2] = {id = 13394, multiply = 5}, -- gold token				
			[3] = {id = "exp", multiply = 1000000}
		}
	},	
	-- [[ NOVAS ]] --
	["cobra assassin"] = {storage = 20055, countSto = 30055, count = 25000, price = 10000, inDay = 10, premmy = false,
		mlist = {"cobra scout", "cobra assassin", "cobra vizier"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = 000, multiply = 1}, -- the cobra amulet			
			[3] = {id = "exp", multiply = 1000000}
		}
	},	
	-- [[ NOVAS ]] --
	["falcon paladin"] = {storage = 20056, countSto = 30056, count = 30000, price = 10000, inDay = 10, premmy = false,
		mlist = {"falcon paladin"}, boss = "grand commander soeren",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = 13086, multiply = 1}, -- falcon escutcheon				
			[3] = {id = "exp", multiply = 1000000}
		}
	},	
	
	-- [[ NOVAS ]] --
	["falcon knight"] = {storage = 20056, countSto = 30056, count = 30000, price = 10000, inDay = 10, premmy = false,
		mlist = {"falcon knight"}, boss = "grand canon dominus",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = 13083, multiply = 1}, -- falcon plate				
			[3] = {id = "exp", multiply = 1000000}
		}
	},		
	-- [[ NOVAS ]] --
	["pharaoh"] = {storage = 20057, countSto = 30057, count = 15000, price = 10000, inDay = 9, premmy = false,
		mlist = {"pharaoh", "orshid hamses", "mistic mummy", "master hamses"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 100},
			[2] = {id = 13238, multiply = 1}, -- mount pharaoth			
			[3] = {id = "exp", multiply = 500000}
		}
	},	
	-- [[ NOVAS ]] --
	["juggernaut"] = {storage = 20058, countSto = 30058, count = 1000, price = 10000, inDay = 0, premmy = false,
		mlist = {"massacre", "juggernaut"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 100},
			[2] = {id = "exp", multiply = 500000}
		}
	},	
	-- [[ NOVAS ]] --
	["burster spectre"] = {storage = 20059, countSto = 30059, count = 25000, price = 10000, inDay = 10, premmy = false,
		mlist = {"burster spectre", "gazer spectre", "ripper spectre"}, boss = "none",
		awards = {
			[1] = {id = 2160, multiply = 10},
			[2] = {id = 13086, multiply = 1}, -- falcon escutcheon				
			[3] = {id = "exp", multiply = 2000000}
		}
	},		
	
}


 -- [[ Storage: ativo (1) / Storage'd' Data de Prazo  ]] --
function checkPlayerIsInTask(cid) -- RETURN: True if he can do some task // MonsterName if he can't
	getSto = doOrganizeTaskSto(_MONSTERS_TASK_SYSTEM_CONFIG)
	if isPlayer(cid) then
		pTaskTab = {}
		for a = getSto[1], getSto[#getSto] do
			local g = getPlayerStorageValue(cid, a)
			if g == 1 then
				mName = whatTaskIsActive(cid, a)
				table.insert(pTaskTab, mName)
			end		
		end
		return pTaskTab
	end
return true
end

function checkPlayerBossAvaliable(cid) -- RETURN: Boss Name or False
	local b = {}
	local tab = _MONSTERS_TASK_SYSTEM_CONFIG
	getSto = doOrganizeTaskSto(tab)
	if isPlayer(cid) then
		for a = getSto[1], getSto[#getSto] do
			local g = getPlayerStorageValue(cid, a)
			if g == 2 then
				mName = whatTaskIsActive(cid, a)
				c = tab[mName]
				if c then
					b["name"] = c.boss
					b["storage"] = c.storage
					return b
				end
			end		
		end
	end
return false
end

function getTheNextTask(cid) -- RETURN: monsterName OR false if already done all tasks
	getSto = doOrganizeTaskSto(_MONSTERS_TASK_SYSTEM_CONFIG)
	if isPlayer(cid) then
		for a = getSto[1], getSto[#getSto] do
			local g = getPlayerStorageValue(cid, a)
			if not isNumber(g) then
				g = -1
				setPlayerStorageValue(cid, a, -1)
			end
			if g <= 0 then -- 0 or -1 inative, 1 is active and 2 done
				mName = whatTaskIsActive(cid, a)
				return mName
			end		
		end
		return false
	end
return false
end

function checkAlreadyDoingThisTask(cid, name, list) -- Return Monster Name if Can Do, or false if can't
	cfg = _MONSTERS_TASK_SYSTEM_CONFIG
	for i = 1, #list do
		getArray = cfg[list[i]].mlist
		if getArray then
			if isInArray(getArray, name) then
				return list[i]
			end
		end
	end
return false
end

function checkPlayerDoneTask(cid) -- RETURN: List of Tasks Finisheds
	getSto = doOrganizeTaskSto(_MONSTERS_TASK_SYSTEM_CONFIG)
	if isPlayer(cid) then
		pTaskTab = {}
		for a = getSto[1], getSto[#getSto] do
			if getPlayerStorageValue(cid, a) == 2 then
				mName = whatTaskIsActive(cid, a)
				table.insert(pTaskTab, mName)
			end		
		end
		return pTaskTab
	end
return true
end

function getInfoPlayerTask(cid, mName) -- Returns: [1] full date from Especific Task.
local infoTab = {}
	getList = _MONSTERS_TASK_SYSTEM_CONFIG
	if isPlayer(cid) then
		getInfo = getList[mName:lower()]
		if getInfo then
			if getPlayerStorageValue(cid, getInfo.storage) ~= -1 then
				getDate = getPlayerStorageValue(cid, ""..getInfo.storage.."d")
				table.insert(infoTab, getDate)
				return infoTab
			else
				return false
			end
		end
	end
end

function whatTaskIsActive(cid, stoKey) -- Retorna Nome da Task Ativa
	taskList = _MONSTERS_TASK_SYSTEM_CONFIG
	for index, result in pairs(taskList) do
		if result.storage == stoKey then
			return index
		end
	end
end

function getAwardsList(cid, list) -- Retorna Lista de Premiação
	local awardList = ''
	get = list
	for a = 1, #list do
		if isNumber(list[a].id) then
			if list[a].multiply <= 1 then
				awardList = awardList.."{"..list[a].multiply.."x "..getItemNameById(list[a].id).."}, "
			else
				awardList = awardList.."{"..list[a].multiply.."x "..getItemPluralNameById(list[a].id).."}, "
			end
		elseif list[a].id == "exp" then
			cawardList = awardList:sub(1, (#awardList-2))
			if a == #list then
				awardList = cawardList.." and {"..list[a].multiply.." experience points}"
			else
				awardList = cawardList..", {"..list[a].multiply.." experience points}"
			end
		elseif list[a].id == "premmy" then
			awardList = awardList.." and {"..list[a].multiply.." premium day(s)}"
		end
	end
return awardList
end

function doGiveTaskAwards(cid, list) -- Entrega Lista de Prêmios
	if isPlayer(cid) then
		for a = 1, #list do
			if isNumber(list[a].id) then
				doPlayerAddItem(cid, list[a].id, list[a].multiply)
			elseif list[a].id == "exp" then
				doPlayerAddExp(cid, list[a].multiply)
			elseif list[a].id == "premmy" then
				doPlayerAddPremiumDays(cid, list[a].multiply)
			end
		end
	end
return true
end

function doGiveTaskMonsterList(cid, list) -- Retorna Lista de Task Ativas [Tabela Monster Names]
	if isPlayer(cid) then
		name = ""
		for a = 1, #list do
			if a == 1 then
				name = "{"..list[a].."}"
			elseif a > 1 and a < #list then
				name = ""..name..", {"..list[a].."}"
			else
				name = ""..name.." and {"..list[a].."}"
			end
		end
	end
return name
end

function doCloseTimedTask(cid, monster)
	getInfo = getInfoPlayerTask(cid, monster)
	taskList = _MONSTERS_TASK_SYSTEM_CONFIG
	getM = taskList[monster]
	if getM then
		if getInfo then
			setPlayerStorageValue(cid, getM.storage, 0) 			-- Task Status
			setPlayerStorageValue(cid, ""..getM.storage.."d", 0) 	-- Task Date
			setPlayerStorageValue(cid, getM.countSto, 0)
		end
	end
end

function doPlayerDonePersoTask(cid)
	taskList = checkPlayerIsInTask(cid)
	if #taskList > 0 then
		mList = _MONSTERS_TASK_SYSTEM_CONFIG
		for i = 1, #taskList do
			task = mList[taskList[i]]
			if task then
				killeds = getPlayerStorageValue(cid, task.countSto)
				if killeds >= task.count then
					return taskList[i]
				end
			end
		end
	else
		return false
	end	
end

function doOrganizeTaskSto(taskList) -- Retorna Primeira e Última Storage de Todas Tasks
local tabSto = {}
	taskList = _MONSTERS_TASK_SYSTEM_CONFIG
	for index, result in pairs(taskList) do
		if result.storage then
			table.insert(tabSto, result.storage)
		end
	end
	table.sort(tabSto, function(a, b) return a < b end)
return tabSto
end

-- Retorna a quantidade de players em uma área
function getBossRoomPlayersInArea(frompos, topos)  -- Checa quantos players na área
	local ptab = {}
	for xx = frompos.x, topos.x do
		for yy = frompos.y, topos.y do
			for zz = frompos.z, topos.z do
				get_top = getTopCreature({x=xx, y=yy, z=zz}).uid
				if get_top > 0 then
					if isPlayer(get_top) then
						table.insert(ptab, get_top)
					end
				end
			end
		end
	end
return #ptab
end

function prepareBossRoom(frompos, topos)  -- Checa quantos players na área
	local ptab = {}
	for xx = frompos.x, topos.x do
		for yy = frompos.y, topos.y do
			for zz = frompos.z, topos.z do
				get_top = getTopCreature({x=xx, y=yy, z=zz}).uid
				if get_top > 0 then
					if isPlayer(get_top) then
						local destiny = getTownTemplePosition(getPlayerTown(get_top))
						doTeleportThing(get_top, destiny)
					else
						doRemoveCreature(get_top)
					end
				end
			end
		end
	end
return true
end

-- Converte Número para Casas Milhar [1200000 to 1.200.000]
function milharFormat(valor)
	local formatado = valor
	while true do  -- O "." entre "%1" e "%2" é o separador
		formatado, n = string.gsub(formatado, "^(-?%d+)(%d%d%d)", '%1.%2') 
		if (n == 0) then
			break
		end
	end
	return formatado
end

function doRegisterInFile(cid, diretory, fileName, extension, msg, delFile)
-- diretory: "data/lib/" // delFile, Ex: "data/lib/ind.xml" // 
OfflineMessagesConfig = {
	messageSavingDirectory = ''..diretory..'', -- dir with saved messages (folder must exist!)
	messages = {
		messageType = MESSAGE_STATUS_CONSOLE_BLUE,
		['cantSendMessage'] = "Error: Can't save message. Try it later.",
		['messageSent'] = 'Ok, yours message has been sent to player %s.'
	},
	messageFormatString = '%s',
}
	if delFile == "" then
		local file = io.open(diretory .. fileName .. '.'..extension..'', 'a+')
		if(not file) then
			-- print('[cantSendMessage]')
			return true
		end
		file:write(OfflineMessagesConfig.messageFormatString:format(msg) .. '\n')
		file:close()
		-- print('[messageSent]:format(destiny)')
	else
		os.remove(delFile)
	end
	return true
end