-- ########################################################
-- #####       	  Name: Adriano Swatt'   	          #####
-- ##### 			  Version: 3.0                    #####
-- ########################################################
-- #####  		Developed by Adriano Swatt'			  #####
-- #####  	 Contact: adrianoswat@yahoo.com.br        #####
-- #####  	 PERSONALIZED TASK SYSTEM BY SWATT'    	  #####
-- ########################################################

-- [[ EXPLAIN // EXPLICAÇÃO // COMO CONFIGURAR ]] --
-- storage = Storage Que Salva: Task Ativa/Repetição/Dia/Hora/Minute
-- countSto = Storage Que Salva Quantidade que Matou
-- count = Quantidade Total Que Precisará Matar
-- price = Preço da Task em Gold Coins
-- repeated = Quantas Vezes Pode Realizar a Task
-- inDay = Day Value: Quantos dias para realizar // false: se a task fica ativa até a conclusão
-- awards = [1] = {id = Premio, multiply = quantidade} // seguindo modelo // usar [1] = {id = "exp", multiply = QUANTIDADE}
-- DICA: Deixe sempre a Experiência por último
_SETTING_TASK_SYSTEM_CONFIG = {
	taskAtSameTime = 3, -- Quantas Tasks Ativas Ao Mesmo Tempo
}

_MONSTERS_TASK_SYSTEM_CONFIG = {
	-- Low:
		["cyclops"] = {class = "low", storage = 28701, countSto = 38801, count = 10, price = 0, repeated = 3, inDay = false, waitDaysToRepeat = 7,
			mlist = {"cyclops", "cyclops drone", "cyclops smith"},
			awards = {
				{id = 2519, multiply = 1}, -- Crown Shield
				{id = 2195, multiply = 1}, -- BOH
				{id = 2160, multiply = 2}, -- 20k
				{id = "exp", multiply = 40000}, --
			}
		},
		-- [[ SPACE ]] --
		["dragon"] = {class = "low", storage = 28702, countSto = 38802, count = 300, price = 10000, repeated = 3, inDay = false, waitDaysToRepeat = 7,
			mlist = {"dragon", "dragon hatchling"},
			awards = {
				{id = 2520, multiply = 1}, -- demon shield
				{id = 2160, multiply = 3}, -- 30k
				{id = "exp", multiply = 60000},
				{id = "premmy", multiply = 1},
			}
		},
		-- [[ SPACE ]] --
		["bog raider"] = {class = "low", storage = 28703, countSto = 38803, count = 450, price = 1000, repeated = 3, inDay = false, waitDaysToRepeat = 7,
			mlist = {"bog raider"},
			awards = {
				{id = 8849, multiply = 1}, -- modified crossbow
				{id = 2160, multiply = 3}, -- 30k
				{id = "exp", multiply = 60000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["wyrm"] = {class = "low", storage = 28704, countSto = 38804, count = 1100, price = 2000, repeated = 3, inDay = false, waitDaysToRepeat = 7,
			mlist = {"wyrm", "elder wyrm"},
			awards = {
				{id = 8902, multiply = 1}, -- Spellbook Of Mind Control
				{id = 2160, multiply = 5}, -- 50k
				{id = "exp", multiply = 80000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["rotworm"] = {class = "low", storage = 28705, countSto = 38805, count = 200, price = 0, repeated = 3, inDay = false, waitDaysToRepeat = 7,
			mlist = {"rotworm", "carrion worm", "rotworm queen"},
			awards = {
				{id = 2480, multiply = 1}, -- legion helmet
				{id = 2160, multiply = 2}, -- 20k
				{id = "exp", multiply = 20000}, -- exp
			}
		},
	-- Medium:
		["sea serpent"] = {class = "medium", storage = 28710, countSto = 38810, count = 2000, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 10,
			mlist = {"sea serpent"},
			awards = {
				--{id = 7896, multiply = 1}, -- Glacier Kilt
				--{id = 7902, multiply = 1}, -- Glacier Mask
				{id = 10521, multiply = 1}, -- Moon Backpack
				{id = 8887, multiply = 1}, -- Frozen Plate
				{id = 10529, multiply = 1}, -- sea serpent trophy
				{id = "exp", multiply = 200000},
			}
		},
		
		-- [[ SPACE ]] --
		["hellspawn"] = {class = "medium", storage = 28712, countSto = 38812, count = 1300, price = 20000, repeated = 1, inDay = false, waitDaysToRepeat = 10,
			mlist = {"hellspawn"},
			awards = {
				{id = 8877, multiply = 1}, -- Lavos Armor
				{id = 2160, multiply = 10}, -- 100k
				{id = "exp", multiply = 200000},
			}
		},
		-- [[ SPACE ]] --	
		["hydra"] = {class = "medium", storage = 28713, countSto = 38813, count = 2000, price = 50000, repeated = 3, inDay = 4, waitDaysToRepeat = 10,
			mlist = {"hydra"},
			awards = {
				{id = 8880, multiply = 1}, -- swamplair armor
				{id = 10523, multiply = 1}, -- egg of the many
				{id = 2160, multiply = 20}, -- 200k
				{id = "exp", multiply = 200000},
				{id = "premmy", multiply = 1},
			}
		},
		-- [[ SPACE ]] --
		["frost dragon"] = {class = "medium", storage = 28714, countSto = 38814, count = 2000, price = 50000, repeated = 3, inDay = 4, waitDaysToRepeat = 10,
			mlist = {"frost dragon"},
			awards = {
				{id = 2160, multiply = 20}, -- 200k
				{id = "exp", multiply = 200000},
				{id = "premmy", multiply = 1},
			}
		},
		-- [[ SPACE ]] --
		["nightmare"] = {class = "medium", storage = 28715, countSto = 38815, count = 4000, price = 5000, repeated = 3, inDay = 10, waitDaysToRepeat = 10,
			mlist = {"nightmare", "nightmare scion"},
			awards = {
				{id = 5741, multiply = 1}, -- skull helmet
				{id = 6500, multiply = 100}, -- 100 demonic essence
				{id = "exp", multiply = 400000},
			}
		},
		-- [[ SPACE ]] --
		["glooths"] = {class = "medium", storage = 28716, countSto = 38816, count = 3000, price = 150000, repeated = 3, inDay = 3, waitDaysToRepeat = 3,
			mlist = {"Glooth Anemone", "Glooth Bandit", "Glooth Battery", "Glooth Blob", "Glooth Brigand", "Glooth Golem", "Glooth Powered Minotaur"},
			awards = {
				{id = 11236, multiply = 1}, -- glooth bag
				{id = 11236, multiply = 1}, -- glooth bag
				{id = 2160, multiply = 50}, -- 500k
				{id = "exp", multiply = 1000000},
				{id = "premmy", multiply = 5},
			}
		},
		-- [[ SPACE ]] --
		["golems"] = {class = "medium", storage = 28717, countSto = 38817, count = 3000, price = 150000, repeated = 3, inDay = 3, waitDaysToRepeat = 3,
			mlist = {"Worker Golem", "War Golem"},
			awards = {
				{id = 2160, multiply = 50}, -- 500k
				{id = "exp", multiply = 1000000},
				{id = "premmy", multiply = 5},
			}
		},
	-- High:
		-- [[ SPACE ]] --
		["infernalist"] = {class = "medium", storage = 28720, countSto = 38820, count = 1000, price = 15000, repeated = 1, inDay = false,
			mlist = {"infernalist"},
			awards = {
				{id = 10139, multiply = 1}, -- infernalit's crown
				{id = 6529, multiply = 1}, -- Infernal Bolt
				{id = 10558, multiply = 3}, -- 3kk
				{id = "exp", multiply = 600000},
			}
		},
		-- [[ SPACE ]] --
		["draken"] = {class = "medium", storage = 28721, countSto = 38821, count = 6000, price = 15000, repeated = 1, inDay = false,
			mlist = {"draken", "draken abomination","draken elite","draken spellweaver","draken warmaster"},
			awards = {			
				{id = 12605, multiply = 1}, -- Shield Of Corruption
				{id = 2164, multiply = 1}, -- Might Ring
				{id = 10558, multiply = 3}, -- 3kk
				{id = "exp", multiply = 800000},
				{id = "premmy", multiply = 3},
			}
		},
		-- [[ SPACE ]] --
		["grim reaper"] = {class = "high", storage = 28722, countSto = 38822, count = 6000, price = 15000, repeated = 1, inDay = false,
			mlist = {"grim reaper"},
			awards = {
				{id = 2342, multiply = 1}, -- Helmet Of The Ancients
				{id = 10558, multiply = 3}, -- 2kk
				{id = "exp", multiply = 500000},
			}
		},
		
		-- [[ SPACE ]] --
		["dark torturer"] = {class = "high", storage = 28723, countSto = 38823, count = 6000, price = 15000, repeated = 1, inDay = false,
			mlist = {"dark torturer"},
			awards = {
				{id = 6537, multiply = 1}, -- mr punish's handcuffs
				{id = 10558, multiply = 3}, -- 3kk
				{id = "exp", multiply = 700000},
				{id = "premmy", multiply = 1},
			}
		},
		-- [[ SPACE ]] --
		["fury"] = {class = "high", storage = 28724, countSto = 38824, count = 5000, price = 15000, repeated = 1, inDay = false,
			mlist = {"fury"},
			awards = {
				{id = 12591, multiply = 1}, -- cobra crown
				{id = 10558, multiply = 3}, -- 3kk
				{id = "exp", multiply = 310000},
			}
		},
		-- [[ SPACE ]] --
		["undead dragon"] = {class = "high", storage = 28725, countSto = 38825, count = 6000, price = 50000, repeated = 1, inDay = false,
			mlist = {"undead dragon"},
			awards = {
				{id = 6433, multiply = 1}, -- necromancer shield
				{id = 10558, multiply = 5}, -- 5kk
				{id = "exp", multiply = 2500000},
				{id = "premmy", multiply = 5},
			}
		},
		-- [[ SPACE ]] --
		["ghastly dragon"] = {class = "high", storage = 28726, countSto = 38826, count = 6000, price = 50000, repeated = 1, inDay = false,
			mlist = {"ghastly dragon"},
			awards = {
				{id = 6391, multiply = 1}, -- nightmare shield
				{id = 10558, multiply = 5}, -- 5kk
				{id = "exp", multiply = 2500000},
				{id = "premmy", multiply = 7},
			}
		},
		-- [[ SPACE ]] --
		["medusa"] = {class = "medium", storage = 28727, countSto = 38827, count = 6000, price = 15000, repeated = 1, inDay = false,
			mlist = {"medusa"},
			awards = {
				{id = 8869, multiply = 1}, -- greenwood coat
				{id = 10558, multiply = 2}, -- 2kk
				{id = "exp", multiply = 1100000},
			}
		},
		-- [[ SPACE ]] --
		["serpent spawn"] = {class = "medium", storage = 28728, countSto = 38828, count = 6000, price = 15000, repeated = 1, inDay = false,
			mlist = {"serpent spawn"},
			awards = {
				{id = 10309, multiply = 1}, -- claw of the noxious spawn
				{id = 10558, multiply = 3}, -- 3kk
				{id = "exp", multiply = 800000},
				{id = "premmy", multiply = 1},
			}
		},
		-- [[ SPACE ]] --
		["destroyer"] = {class = "high", storage = 28729, countSto = 38829, count = 6000, price = 15000, repeated = 1, inDay = false,
			mlist = {"destroyer"},
			awards = {
				{id = 7455, multiply = 1}, -- mythril axe
				{id = 10558, multiply = 3}, -- 3kk
				{id = "exp", multiply = 500000},
			}
		},

	-- Addons:
		-- [[ SPACE ]] --
		["green djinn"] = {class = "addons", storage = 28740, countSto = 38840, count = 600, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"green djinn", "efreet"},
			awards = {
				{id = 5910, multiply = 10}, -- Green POC
				{id = 2160, multiply = 20}, -- 200k
				{id = "exp", multiply = 120000},
			}
		},	
		-- [[ SPACE ]] --
		["behemoth"] = {class = "addons", storage = 28741, countSto = 38841, count = 1200, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"behemoth"},
			awards = {
				{id = 5893, multiply = 10}, --Perfect Behemoth Fang
				{id = 5930, multiply = 1}, -- Behemoth Claw
				{id = 2160, multiply = 5}, -- 50k
				{id = "exp", multiply = 120000},
			}
		},	
		-- [[ SPACE ]] --
		["giant spider"] = {class = "addons", storage = 28742, countSto = 38842, count = 900, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"giant spider"},
			awards = {
				{id = 5879, multiply = 10}, -- Spider Silk
				{id = 2160, multiply = 4}, -- 40k
				{id = "exp", multiply = 120000},
			}
		},
		-- [[ SPACE ]] --
		["quara"] = {class = "addons", storage = 28743, countSto = 38843, count = 3800, price = 900, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"quara","quara constrictor", "quara hydromancer", "quara mantassin", "quara pincher", "quara predator"},
			awards = {		
				{id = 7963, multiply = 1}, -- Shark Fish
				{id = 5895, multiply = 35}, -- Fish Fin
				{id = 2160, multiply = 50}, -- 50k
				{id = "exp", multiply = 120000},
			}
		},	
		-- [[ SPACE ]] --
		["blue djinn"] = {class = "addons", storage = 28744, countSto = 38844, count = 600, price = 20000, repeated = 1, inDay = false, waitDaysToRepeat = 3,
			mlist = {"blue djinn","marid"},
			awards = {
				{id = 5912, multiply = 12}, -- Blue POC
				{id = 2160, multiply = 5}, -- 50k
				{id = "exp", multiply = 100000},
			}
		},
		-- [[ SPACE ]] --
		["minotaurs"] = {class = "addons", storage = 28745, countSto = 38845, count = 800, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"minotaurs","minotaur","minotaur archer","minotaur mage","minotaur guard"},
			awards = {
				{id = 5878, multiply = 15}, -- 15 minotaur leather
				{id = "exp", multiply = 70000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["vampire"] = {class = "addons", storage = 28746, countSto = 38846, count = 600, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"vampire"},
			awards = {
				{id = 5905, multiply = 5}, -- 5 vampire dust
				{id = "exp", multiply = 90000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["elfs"] = {class = "addons", storage = 28747, countSto = 38847, count = 900, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"elf","elf arcanist","elf scout"},
			awards = {
				{id = 5922, multiply = 8}, -- 8 holy orchid
				{id = "exp", multiply = 90000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["tortoise"] = {class = "addons", storage = 28748, countSto = 38848, count = 800, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"tortoise","thornback tortoise"},
			awards = {
				{id = 5899, multiply = 10}, -- 10 turtle shell
				{id = "exp", multiply = 50000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["hero"] = {class = "addons", storage = 28749, countSto = 38849, count = 600, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"hero"},
			awards = {
				{id = 5911, multiply = 10}, -- 10 Red POC
				{id = "exp", multiply = 100000}, -- exp
			}
		},
		-- [[ SPACE ]] --
		["monk"] = {class = "addons", storage = 28750, countSto = 38850, count = 600, price = 20000, repeated = 3, inDay = false, waitDaysToRepeat = 3,
			mlist = {"monk","dark monk"},
			awards = {
				{id = 2193, multiply = 5}, -- 5 ankh
				{id = "exp", multiply = 90000}, -- exp
			}
		},
	-- Special:
		["dragon lord"] = {class = "special", storage = 28760, countSto = 38860, count = 10000, price = 100000, repeated = 1, inDay = 30, waitDaysToRepeat = 15,
			mlist = {"dragon lord"},
			awards = {
				{id = 10020, multiply = 1}, -- Dragon Claw
				{id = 10558, multiply = 1}, -- 1kk
				{id = "exp", multiply = 1000000},
			}
		},
		-- [[ SPACE ]] --
		["pirates"] = {class = "special", storage = 28761, countSto = 38861, count = 8000, price = 30000, repeated = 10, inDay = false, waitDaysToRepeat = 1,
			mlist = {"pirates","pirate skeleton", "pirate buccaneer", "pirate corsair", "pirate cutthroat", "pirate marauder", "pirate ghost"},
			awards = {
				{id = 8110, multiply = 1}, -- Pirate Present (Sorteia itens e Boss Item dos Pirates)
				{id = 2160, multiply = 10}, -- 100k
				{id = "exp", multiply = 140000},
			}
		},
		-- [[ SPACE ]] --
		["carniphila"] = {class = "special", storage = 28762, countSto = 38862, count = 600, price = 50000, repeated = 1, inDay = false, waitDaysToRepeat = 7,
			mlist = {"carniphila"},
			awards = {
				{id = 5015, multiply = 1}, -- Mandrake
				{id = 2160, multiply = 40}, -- 400k
				{id = "exp", multiply = 300000},
			}
		},
		-- [[ SPACE ]] --
		["minotaur"] = {class = "special", storage = 28763, countSto = 38863, count = 8000, price = 50000, repeated = 3, inDay = false, waitDaysToRepeat = 7,
			mlist = {"minotaur","minotaur archer","minotaur mage","minotaur guard"},
			awards = {
				{id = 5804, multiply = 1}, -- Nose Ring
				{id = 2160, multiply = 30}, -- 300k
				{id = "exp", multiply = 150000},
			}
		},
		
		-- [[ SPACE ]] --
		["necromancer"] = {class = "special", storage = 28764, countSto = 38864, count = 8000, price = 50000, repeated = 1, inDay = false,
			mlist = {"necromancer"},
			awards = {
				{id = 5809, multiply = 1}, -- soul stone
				{id = 10558, multiply = 1}, -- 1kk
				{id = "exp", multiply = 500000},
			}
		},
		-- [[ SPACE ]] --
		["demon"] = {class = "special", storage = 28765, countSto = 38865, count = 6666, price = 100000, repeated = 1, inDay = false,
			mlist = {"demon"},
			awards = {
				{id = 2496, multiply = 1}, -- horned helmet
				{id = 2520, multiply = 1}, -- demon shield
				--{id = 8293, multiply = 1}, -- hallowed axe
				{id = 10305, multiply = 1}, -- holy icon
				{id = 2472, multiply = 1}, -- magic plate armor
				{id = "exp", multiply = 1300000},
				--{id = "premmy", multiply = 5},
			}
		},	
		-- [[ SPACE ]] --
		["warlock"] = {class = "special", storage = 28766, countSto = 38866, count = 1200, price = 80000, repeated = 1, inDay = false,
			mlist = {"warlock"},
			awards = {
				{id = 5939, multiply = 1}, -- waterhose
				{id = 2160, multiply = 30}, -- 300k
				{id = "exp", multiply = 400000},
				{id = "premmy", multiply = 0},
			}
		},	
		-- [[ SPACE ]] --
		["cults"] = {class = "special", storage = 28767, countSto = 38867, count = 3000, price = 50000, repeated = 1, inDay = false,
			mlist = {"cults","novice of the cult", "adept of the cult", "acolyte of the cult", "enlightened of the cult"},
			awards = {
				{id = 5940, multiply = 1}, -- ceiron's wolf tooth chai
				{id = 2160, multiply = 30}, -- 300k
				{id = "exp", multiply = 250000},
			}
		},	
		-- [[ SPACE ]] --
		["asura"] = {class = "special", storage = 28768, countSto = 38868, count = 10000, price = 100000, repeated = 1, inDay = false,
			mlist = {"asura","dawnfire asura","frost flower asura","midnight asura","true dawnfire asura","true frost flower asura","true midnight asura"},
			awards = {
				{id = 2139, multiply = 1}, -- asura crown
				{id = 10558, multiply = 5}, -- 5kk
				{id = "exp", multiply = 2000000},
				{id = "premmy", multiply = 0},
			}
		},
		-- [[ SPACE ]] --
		["crystal spider"] = {class = "special", storage = 28769, countSto = 38869, count = 3000, price = 100000, repeated = 1, inDay = false, waitDaysToRepeat = 30,
			mlist = {"crystal spider"},
			awards = {
				{id = 11113, multiply = 1}, -- Crystal boots
				{id = "exp", multiply = 0},
			}
		},
}


-- [[ Storage: ativo (1) / repetição / Prazo  ]] --
function checkPlayerIsInTask(cid) -- RETURN: True if he can do some task // MonsterName if he can't
	getSto = doOrganizeTaskSto(_MONSTERS_TASK_SYSTEM_CONFIG)
	if isPlayer(cid) then
		pTaskTab = {}
		for a = getSto[1], getSto[#getSto] do
			if getPlayerStorageValue(cid, a) ~= -1 then
				onCheck = doCutTaskStorage(cid, a, "/")
				if #onCheck > 0 then
					active = tonumber(onCheck[1]:sub(2, 2))
					if active >= 1 then
						mName = whatTaskIsActive(cid, a)
						table.insert(pTaskTab, mName)
					end
				end			
			end		
		end
		return pTaskTab
	end
	return true
end

function checkPlayerRepetationTask(cid) -- RETURN: List of Repetation Tasks
	getSto = doOrganizeTaskSto(_MONSTERS_TASK_SYSTEM_CONFIG)
	if isPlayer(cid) then
		pTaskTab = {}
		for a = getSto[1], getSto[#getSto] do
			if getPlayerStorageValue(cid, a) ~= -1 then
				onCheck = doCutTaskStorage(cid, a, "/")
				if #onCheck > 0 then
					active = tonumber(onCheck[2])
					if active >= 1 then
						mName = whatTaskIsActive(cid, a)
						table.insert(pTaskTab, mName)
					end
				end			
			end		
		end
		return pTaskTab
	end
return true
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

function getInfoPlayerTask(cid, mName) -- Returns: [1] Repetition, [2] full date from Especific Task.
local infoTab = {}
	getList = _MONSTERS_TASK_SYSTEM_CONFIG
	if isPlayer(cid) then
		getInfo = getList[mName:lower()]
		if getInfo then
			if getPlayerStorageValue(cid, getInfo.storage) ~= -1 then
				local onCut = doCutTaskStorage(cid, getInfo.storage, "/")
				if #onCut > 0 then
					for a = 2, 3 do
						table.insert(infoTab, tonumber(onCut[a]))
					end
					return infoTab
				else
					return true
				end
			else
				return false
			end
		end
	end
end

function doCutTaskStorage(cid, storageKey, cutType) -- cutType [Ex: ","]
local cutSto = {}
	local string = tostring(getPlayerStorageValue(cid, storageKey))
	local cutSto = string:explode(cutType)
	if #cutSto > 0 then
		for i = 1, #cutSto do
			table.insert(cutSto, cutSto[i])
		end
		return cutSto
	else
		return true
	end
end

function whatTaskIsActive(cid, stoKey) -- Retorna Nome das Task Ativa
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
				awardList = cawardList.." and {"..milharFormat(list[a].multiply).." experience points}"
			else
				awardList = cawardList..", {"..milharFormat(list[a].multiply).." experience points}"
			end
		elseif list[a].id == "premmy" then
			awardList = awardList.." and {"..list[a].multiply.." premium day(s)}"
		end
	end
return awardList
end

function doGiveTaskAwards(cid, list) -- Entrega Lista de Prêmios
	if isPlayer(cid) then
		doSendMagicEffect(getPlayerPosition(cid),  12)
		for a = 1, #list do
			if isNumber(list[a].id) then
				doPlayerAddItem(cid, list[a].id, list[a].multiply)
			elseif list[a].id == "exp" then
				doPlayerAddExp(cid, list[a].multiply)
				doSendAnimatedText(getThingPos(cid), list[a].multiply, 215)
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
	getTaskInfo = taskList[monster]
	getM = taskList[monster]
	if getM then
		if getInfo then
			repet = getInfo[1]
			data = getInfo[2]
			waitDays = 0


			if getTaskInfo.waitDaysToRepeat then
				waitDays = os.time() + (tonumber(getTaskInfo.waitDaysToRepeat)*86400)
			end
			newValue = "&0/"..repet.."/".. waitDays
			setPlayerStorageValue(cid, getM.storage, newValue)
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
				if killeds == task.count then
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