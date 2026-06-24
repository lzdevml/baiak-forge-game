local monsters = {"Dawnfire Asura", "Wyrm", "Behemoth", "Midnight Asura", "Serpent Spawn", "Medusa", "Draken Elite", "Dragon Lord", "Hellhound", "Warlock", "Infernalist", "Grim Reaper", "Demon", "Nightmare", "Hydra", "Frost Dragon", "Fury", "Vampire", "Dragon", "Bog Raider", "Giant Spider", "Infernalist", "Sea Serpent", "Ghastly Dragon", "Earth Elemental", "Werewolf", "Mutated Rat", "Ghastly Dragon", "Destroyer", "Hellspawn", "Hellfire Fighter", "Defiler", "Pharaoh", "Orshid Hamses", "Mistic Mummy", "Master Hamses", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Falcon Knight", "Falcon Paladin", "Distorted Phanton", "Many Faces", "wyrm", "Elder Wyrm", "Blue Djinn", "Green Djinn", "Plaguesmith", "Frazzlemaw", "Guzzlemaw", "Silencer", "Demon Outcast", "Choking Fear", "Undead Dragon", "Energetic Book", "Burning Book", "Cursed Book", "Icecold Book", "Burster Spectre", "Gazer Spectre", "Ripper Spectre", "Defiler"} -- Monstros que podem ser sorteados
local premios = {{8981, 15}, {6527, 150}} -- {id do item, quantidade} que o jogador ganha e quantia de gold

function winMonsterEvent()
local max_sto, winner = 0, 0
local monster = getGlobalStorageValue(35074)
	for _, pid in pairs(getPlayersOnline()) do
		local sto = getPlayerStorageValue(pid, 35075)
		if sto > max_sto then
			max_sto = sto
			winner = pid
		end

		doPlayerSetStorageValue(pid, 35075, 0)
		unregisterCreatureEvent(pid, "MonsterHunter_Kill")
	end

	if isPlayer(winner) then
		local artigo = getPlayerSex(winner) == 0 and "A jogadora" or "O jogador"
		doBroadcastMessage("[Monster Hunter] ".. artigo .." ".. getCreatureName(winner) .." matou ".. max_sto .." ".. monster .."s e venceu o evento. Parabéns!")
		for _, prize in pairs(premios) do
			doPlayerAddItem(winner, prize[1], prize[2])
		end
	else
		doBroadcastMessage("[Monster Hunter Event] O evento terminou e não houve nenhum vencedor.")
	end

	setGlobalStorageValue(35074, 0)
end

function onThink(interval, lastExecution)
	math.randomseed(os.time())
	math.random()
	local monster_ran = monsters[math.random(1, #monsters)]
	local tempo = math.random(5, 10)
	for _, pid in pairs(getPlayersOnline()) do
		doPlayerSetStorageValue(pid, 35075, 0)
		registerCreatureEvent(pid, "MonsterHunter_Kill")
	end

	setGlobalStorageValue(35074, monster_ran)
	doBroadcastMessage("[Monster Hunter Event] O evento começou e vai durar ".. tempo .." minutos. O monstro sorteado foi > ".. monster_ran .." < Quem matar mais deles até o tempo acabar, será o vencedor!")
	addEvent(winMonsterEvent, tempo*1000*60) 
	return true
end