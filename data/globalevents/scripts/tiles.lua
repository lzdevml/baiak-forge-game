local config = {
	positions = {
        ["DTT"] = {Position = {x = 166, y = 53, z = 7}},
		["Des.War"] = {Position = {x = 172, y = 47, z = 7}},
		["AURA.DNT"] = {Position = {x = 4438, y = 1329, z = 6}},
		["Ring"] = {Position = {x = 4452, y = 1328, z = 6}},
		["Invictor"] = {Effect = 56, Position = {x = 744, y = 45, z = 7}},
		["Mage"] = {Effect = 55, Position = {x = 739, y = 41, z = 6}},
		["Knight"] = {Effect = 55, Position = {x = 744, y = 42, z = 6}},
		["Paladin"] = {Effect = 55, Position = {x = 741, y = 46, z = 6}},
		["F.Storm"] = {Effect = 6, Position = {x = 172, y = 48, z = 7}},
		["Templo "] = {Position = {x = 260, y = 6, z = 7}},
		["Exit  "] = {Position = {x = 261, y = 6, z = 7}},
		["PROMOTION"] = {Position = {x = 4435, y = 1329, z = 6}},
		["MAGIAS"] = {Position = {x = 4437, y = 1329, z = 6}},
		["Snowball"] = {Position = {x = 162, y = 52, z = 7}},
		["Zombie"] = {Position = {x = 172, y = 50, z = 7}},
		["MAGIAS "] = {Position = {x = 4452, y = 1324, z = 6}},
		["C.Minado"] = {Position = {x = 170, y = 53, z = 7}},
		["LEIA!"] = {Position = {x = 744, y = 46, z = 6}},
		["Axe"] = {Position = {x = 150, y = 50, z = 8}},
		["Sword"] = {Position = {x = 148, y = 51, z = 8}},
		["Club"] = {Position = {x = 146, y = 50, z = 8}},
		["Distance"] = {Position = {x = 152, y = 51, z = 8}},
		["Magic"] = {Position = {x = 154, y = 50, z = 8}},
		["Venore"] = {Position = {x = 977, y = 48, z = 7}},
		["SuperUP"] = {Position = {x = 1102, y = 2128, z = 7}},
		["B.Field"] = {Position = {x = 169, y = 44, z = 7}},
		["CTF"] = {Position = {x = 165, y = 44, z = 7}},
		["Exit"] = {Position = {x = 977, y = 61, z = 7}},
		["1"] = {Position = {x = 2321, y = 481, z = 7}},
		["2"] = {Position = {x = 2324, y = 481, z = 7}},
		["3"] = {Position = {x = 2327, y = 481, z = 7}},
		["4"] = {Position = {x = 2330, y = 481, z = 7}},
		["5"] = {Position = {x = 2333, y = 481, z = 7}},
		["6"] = {Position = {x = 2321, y = 489, z = 7}},
		["7"] = {Position = {x = 2324, y = 489, z = 7}},
		["8"] = {Position = {x = 2327, y = 489, z = 7}},
		["9"] = {Position = {x = 2330, y = 489, z = 7}},
		["10"] = {Position = {x = 2333, y = 489, z = 7}},
		["11"] = {Position = {x = 2336, y = 481, z = 7}},
		["12"] = {Position = {x = 2339, y = 481, z = 7}},
		["13"] = {Position = {x = 2336, y = 489, z = 7}},
		["14"] = {Position = {x = 2339, y = 489, z = 7}},
		["14"] = {Position = {x = 2339, y = 489, z = 7}},
		["15"] = {Position = {x = 2343, y = 489, z = 7}},
		["16"] = {Position = {x = 2346, y = 489, z = 7}},
		["17"] = {Position = {x = 2342, y = 481, z = 7}},
		["18"] = {Position = {x = 2345, y = 481, z = 7}},
		["Super Up"] = {Effect = 23, Position = {x = 149, y = 48, z = 7}},
		["DesertWar"] = {Position = {x = 973, y = 50, z = 7}},
		["CarlinWar"] = {Position = {x = 981, y = 50, z = 7}},
		["PvPZone"] = {Position = {x = 973, y = 56, z = 7}},
		["CLICK"] = {Position = {x = 2480, y = 987, z = 7}},
		["Clique"] = {Position = {x = 573, y = 15, z = 7}},
		["Templo"] = {Position = {x = 550, y = 34, z = 7}},
		["Fire"] = {Position = {x = 143, y = 48, z = 8}},
		["Ice"] = {Position = {x = 141, y = 51, z = 8}},
		["Holy"] = {Position = {x = 143, y = 53, z = 8}},
		["Death"] = {Position = {x = 144, y = 50, z = 8}},
		["Earth"] = {Position = {x = 140, y = 55, z = 8}},
		["Energy"] = {Position = {x = 144, y = 56, z = 8}},
	}
}

function onThink(cid, interval, lastExecution)
	for text, pos in pairs(config.positions) do
		if pos.Effect then
			doSendMagicEffect(pos.Position, pos.Effect)
		end
		doSendAnimatedText(pos.Position, text, 202)
	end
	return true
end 