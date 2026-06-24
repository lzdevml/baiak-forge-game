local positions = {

	{x = 198, y = 124, z = 11, stackpos=253},
	{x = 198, y = 123, z = 11, stackpos=253},
	{x = 198, y = 122, z = 11, stackpos=253},
	{x = 198, y = 121, z = 11, stackpos=253}

}

local pos = {
	
	{x = 198, y = 124, z = 12},
	{x = 198, y = 123, z = 12},
	{x = 198, y = 122, z = 12},
	{x = 198, y = 121, z = 12},

}

function onUse(cid, item, frompos, item2, topos)

	local check = true
	for i = 1,4 do
		local player = getTopCreature(positions[i])
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) then
			check = true
		else
			check = false
			break;
		end
		if player and player.uid and player.uid > 0 and isPlayer(player.uid) and getPlayerLevel(player.uid) < 100 then
			check = false
			break;
		end
	end

	if check then
		for i = 1,4 do
			local player = getTopCreature(positions[i])
			doTeleportThing(player.uid,pos[i])
		end

		doCreateMonster("Apocalypse",{x = 198, y = 125, z = 12})
		doCreateMonster("Pharaoh",{x = 201, y = 123, z = 12})
		doCreateMonster("Burning Spirit",{x = 195, y = 121, z = 12})
		doCreateMonster("Pharaoh",{x = 201, y = 121, z = 12})
		doCreateMonster("Burning Spirit",{x = 195, y = 123, z = 12})
		doCreateMonster("Apocalypse",{x = 198, y = 118, z = 12})

	else

		doPlayerSendCancel(cid,"São necessários 4 jogadores acima do level 200 para fazer a Anubis Quest.")
	end
	return true
end
