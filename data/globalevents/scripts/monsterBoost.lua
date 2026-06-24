local monsterPosition = {x = 157, y = 43, z = 8}
local lootBoostPosition = {x = 156, y = 43, z = 8}
local expBoostPosition = {x = 158, y = 43, z = 8}

local BOOST_SYSTEM_MONSTER_NAME_STORAGE = 12380
local BOOST_SYSTEM_LOOT_BONUS_STORAGE = 12381
local BOOST_SYSTEM_EXP_BONUS_STORAGE = 12382
local BOOST_SYSTEM_LAST_DAY = 12383
local BOOST_SYSTEM_LAST_MONSTER = 12384

string.upperAllFirst = string.upperAllFirst or function (str)
  return string.gsub(' ' .. str, '%W%l', string.upper):sub(2)
end

local days = {
  ["Sunday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"}, -- Domingo
  ["Monday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"}, -- Segunda-feira
  ["Tuesday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"}, -- Terça-feira
  ["Wednesday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"}, -- Quarta-feira
  ["Thursday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"}, -- Quinta-feira
  ["Friday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"}, -- Sexta-feira
  ["Saturday"] = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Vile Grandmaster", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Vicious Squire", "Renegade Knight", "Cult Enforcer", "Defiler"} -- Sábado
}

function onStartup()
  local monsters = days[os.date("%A")]
  if not monsters then
    return true 
  end

	math.randomseed(os.time())
	math.random(); math.random(); math.random()
	local monster = monsters[math.random(1, #monsters)]
	local func = db.query or db.executeQuery
	print(monster)
	setGlobalStorageValue(BOOST_SYSTEM_LAST_DAY, tonumber(os.date("%w")))
	setGlobalStorageValue(BOOST_SYSTEM_LAST_MONSTER, tostring(monster))
	setGlobalStorageValue(BOOST_SYSTEM_MONSTER_NAME_STORAGE, monster:lower())
	setGlobalStorageValue(BOOST_SYSTEM_LOOT_BONUS_STORAGE, math.random(10, 25))
	setGlobalStorageValue(BOOST_SYSTEM_EXP_BONUS_STORAGE, math.random(5, 15))
	doCreateMonster(monster, monsterPosition, false, true)
	func("INSERT INTO monster_boost (monster, loot, exp) VALUES ('"..monster.."', '"..getGlobalStorageValue(BOOST_SYSTEM_LOOT_BONUS_STORAGE).."', '"..getGlobalStorageValue(BOOST_SYSTEM_EXP_BONUS_STORAGE).."')")
	return true
end

function onThink()
  local monsterName = getGlobalStorageValue(BOOST_SYSTEM_MONSTER_NAME_STORAGE)
  if monsterName == EMPTY_STORAGE then 
    return true
  end

  local creature = getTopCreature(monsterPosition)
  if not creature or creature.uid == 0 then 
    doCreateMonster(monsterName, monsterPosition, false, true)
  elseif getCreatureName(creature.uid):lower() ~= monsterName then
    doRemoveCreature(creature.uid)
    doCreateMonster(monsterName, monsterPosition, false, true)
  end

  --doSendAnimatedText(monsterPosition, string.upperAllFirst(monsterName), COLOR_LIGHTBLUE)
  doSendAnimatedText(lootBoostPosition, "Loot +" .. getGlobalStorageValue(BOOST_SYSTEM_LOOT_BONUS_STORAGE) .. "%", 210)
  doSendAnimatedText(expBoostPosition, "Exp +" .. getGlobalStorageValue(BOOST_SYSTEM_EXP_BONUS_STORAGE) .. "%", 190)
  doSendAnimatedText(monsterPosition, "MONSTRO", 180)
  doSendAnimatedText(monsterPosition, "BOOSTADO", 180)

  return true
end