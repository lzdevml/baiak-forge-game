monsterDaily = {
    possible_monsters = {"Demon", "Hydra", "Midnight Asura", "Frazzlemaw", "Dragon Lord", "Grim Reaper", "Frost Dragon", "Dragon", "Cyclops Drone", "Serpent Spawn", "Hellspawn", "Hand Of Cursed Fate", "Spectre", "Betrayed Wraith", "Plaguesmith", "Phantasm", "Fury", "Destroyer", "Juggernaut", "Swamp Troll", "Hellfire Fighter", "Blightwalker", "Crystal Spider", "Giant Spider", "Tarantula", "Warlock", "Hero", "Necromancer", "Grimeleech", "Vexclaw", "Dragonling", "Infernalist", "Diabolic Imp", "Draken Warmaster", "Undead Dragon", "True Frost Flower Asura", "True Dawnfire Asura", "True Midnight Asura", "Blood Beast", "Devourer", "Glooth Blob", "Rot Elemental", "Minotaur Hunter", "Worm Priestess", "Minotaur Amazon", "Ironblight", "Hideous fungus", "Humongous Fungus", "Lost Berserker", "Magma Crawler", "Weeper", "Lava Golem", "Cliff Strider", "Orewalker"},
    storageMonsterSpawn = 308700,
    storagePercentSpawn = 308701,

    storageMonsterExp = 308702,
    storagePercentExp = 308703,

    storageMonsterLoot = 308704,
    storagePercentLoot = 308705,
}

function onShutdown()
	-- Increased Spawn: -------------------------------------------------------------------------------------------------------------------------

		-- MonsterName 
	    local monsterBoostSpawn = monsterDaily.possible_monsters[math.random(1, #monsterDaily.possible_monsters)]
	    db.query("UPDATE `global_storage` SET `value` = '".. monsterBoostSpawn.."' WHERE `key` ='"..monsterDaily.storageMonsterSpawn.."'")
		-- Interval Spawn multiplier:
	    local spawnBuffPercent = math.random(450,900)
	    db.query("UPDATE `global_storage` SET `value` = '".. spawnBuffPercent .."' WHERE `key` ='"..monsterDaily.storagePercentSpawn.."'")

	-- Bonus Exp: -------------------------------------------------------------------------------------------------------------------------
		-- MonsterName:
		local monsterBoostExp = monsterDaily.possible_monsters[math.random(1, #monsterDaily.possible_monsters)]
		db.query("UPDATE `global_storage` SET `value` = '".. monsterBoostExp.."' WHERE `key` ='"..monsterDaily.storageMonsterExp.."'")

		-- Boost Exp:
		local priority = math.random(1,20)
		local intExp = priority <= 18 and 1 or 2
	    local decimalExp = intExp == 1 and math.random(2,9) or math.random(0,1)
	    local randomFloatExp = intExp .."." .. decimalExp
	    db.query("UPDATE `global_storage` SET `value` = '".. randomFloatExp.."' WHERE `key` ='"..monsterDaily.storagePercentExp.."'")

	-- Bonus Loot: -------------------------------------------------------------------------------------------------------------------------
		-- MonsterName:
		local monsterBoostLoot = monsterDaily.possible_monsters[math.random(1, #monsterDaily.possible_monsters)]
		db.query("UPDATE `global_storage` SET `value` = '".. monsterBoostLoot.."' WHERE `key` ='"..monsterDaily.storageMonsterLoot.."'")

		-- Boost Loot:
		local priority = math.random(1,20)
		local int = priority <= 18 and 1 or 2
	    local decimal = int == 1 and math.random(2,9) or math.random(0,1)
	    local randomFloatLoot = int .."." .. decimal
	    db.query("UPDATE `global_storage` SET `value` = '".. randomFloatLoot.."' WHERE `key` ='"..monsterDaily.storagePercentLoot.."'")

	-- Bosses Poi: -------------------------------------------------------------------------------------------------------------------------
		for i = 98000, 98006 do
			setGlobalStorageValue(i, -1)
		end

	return true
end