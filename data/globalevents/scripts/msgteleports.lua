local positions = {
	------------------------------------ Templo ------------------------------------	
	
	--{pos = {x = 122, y = 55, z = 7}, text = "SnowBall", effect = 41, color = 192},
	--{pos = {x = 122, y = 59, z = 7}, text = "BattField", effect = 0, color = 192},
	--{pos = {x = 146, y = 58, z = 7}, text = "C.T.F.", effect = 15, color = 192},
	--{pos = {x = 146, y = 55, z = 7}, text = "DesertWar", effect = 3, color = 192},
	--{pos = {x = 122, y = 58, z = 7}, text = "D.T.T.", effect = 17, color = 192},
	--{pos = {x = 146, y = 61, z = 7}, text = "400", effect = 5, color = 192},
	--{pos = {x = 147, y = 56, z = 7}, text = "Bomberman", effect = 31, color = 192},
	
	-- {pos = {x = 122, y = 54, z = 7}, text = "EXP 300+", effect = 5, color = 151},
	-- {pos = {x = 122, y = 56, z = 7}, text = "EXP 400+", effect = 5, color = 151},
	-- {pos = {x = 122, y = 58, z = 7}, text = "EXP 500+", effect = 5, color = 151},
	-- {pos = {x = 122, y = 60, z = 7}, text = "EXP 600+", effect = 5, color = 151},
	



	{pos = {x = 142, y = 49, z = 7}, text = "VIP I", effect = 52, color = 192},
	{pos = {x = 143, y = 57, z = 7}, text = "VIP II", effect = 53, color = 192},
	{pos = {x = 845, y = 1069, z = 6}, text = "VIP III", effect = 54, color = 192},
	{pos = {x = 832, y = 1072, z = 6}, text = "VIP IV", effect = 40, color = 192},
	
{pos = {x = 146, y = 56, z = 7}, text = "Task's", effect =  49, color = COLOR_RED},
{pos = {x = 146, y = 55, z = 7}, text = "PVP", effect = 12, color = COLOR_RED},
{pos = {x = 159, y = 53, z = 7}, text = "Castle48hr", effect = 12, color = COLOR_RED},
{pos = {x = 159, y = 55, z = 7}, text = "Castle24hr", effect = 56, color = COLOR_RED},

	
	{pos = {x = 135, y = 45, z = 7}, text = "~Donate~", effect = 13, color = 192},
	{pos = {x = 134, y = 45, z = 7}, text = "20% XP", effect = 13, color = 192},
	{pos = {x = 136, y = 45, z = 7}, text = "10% Loot", effect = 13, color = 192},
	
	{pos = {x = 154, y = 50, z = 7}, text = "Quests", effect = 49, color = 192},
	{pos = {x = 150, y = 50, z = 7}, text = "Trainers", effect = 49, color = 192},
	{pos = {x = 152, y = 50, z = 7}, text = "Hunts", effect = 49, color = 192},
	


	{pos = {x = 146, y = 57, z = 7}, text = "Npc's", effect = 49, color = COLOR_RED},
	{pos = {x = 161, y = 45, z = 7}, text = "50kk", effect = -1, color = COLOR_RED},
	{pos = {x = 162, y = 45, z = 7}, text = "80kk", effect = -1, color = COLOR_RED},
	{pos = {x = 156, y = 49, z = 7}, text = "House", effect = -1, color = COLOR_RED},

		{pos = {x = 4421, y = 1269, z = 6}, text = "V", effect = -1, color = COLOR_WITHE},
		{pos = {x = 4422, y = 1269, z = 6}, text = "I", effect = -1, color = COLOR_WITHE},
		{pos = {x = 4423, y = 1269, z = 6}, text = "P", effect = -1, color = COLOR_WITHE},
				{pos = {x = 1436, y = 1229, z = 7}, text = "Knight", effect = -1, color = COLOR_RED},
}


function onThink(interval, lastExecution)
	for i = 1, #positions do
		if positions[i].effect ~= -1 then
			doSendMagicEffect(positions[i].pos, positions[i].effect)
		end
		if positions[i].color == RANDOM then
			doSendAnimatedText(positions[i].pos, positions[i].text, math.random(1, 255))
		else
			doSendAnimatedText(positions[i].pos, positions[i].text, positions[i].color)
		end
	end
	return true
end

