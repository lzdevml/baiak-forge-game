local effect = {
	[1] = CONST_ME_FIREWORK_BLUE,
	[2] = CONST_ME_FIREWORK_RED,
	[3] = CONST_ME_FIREWORK_YELLOW 
}

local config = {
--Eventos	
	--TPS TEMPLO
	{texto = "Bosses", pos = {x = 158, y = 46, z = 7}, colorText = TEXTCOLOR_ORANGE, magicEffect = CONST_ME_STUN},
	{texto = "Trainning", pos = {x = 160, y = 46, z = 7}, colorText = TEXTCOLOR_ORANGE, magicEffect = CONST_ME_STUN},
	{texto = "Hunts", pos = {x = 162, y = 46, z = 7}, colorText = TEXTCOLOR_ORANGE, magicEffect = CONST_ME_STUN},
	{texto = "Quests", pos = {x = 164, y = 46, z = 7}, colorText = TEXTCOLOR_ORANGE, magicEffect = CONST_ME_STUN},
	{texto = "Castle24h", pos = {x = 169, y = 49, z = 7}, colorText = TEXTCOLOR_ORANGE, magicEffect = CONST_ME_STUN},
	{texto = "Castle24h ", pos = {x = 169, y = 50, z = 7}, colorText = TEXTCOLOR_ORANGE, magicEffect = CONST_ME_STUN},
	{texto = "Reward", pos = {x = 162, y = 50, z = 7}, colorText = TEXTCOLOR_GREEN, magicEffect = CONST_ME_STUN},
	{texto = "Event", pos = {x = 165, y = 53, z = 7}, colorText = TEXTCOLOR_GREEN, magicEffect = CONST_ME_STUN},
	{texto = "Gnomprona", pos = {x = 159, y = 41, z = 7}, colorText = TEXTCOLOR_GREEN, magicEffect = CONST_ME_STUN},
	{texto = "Imbuiments", pos = {x = 155, y = 51, z = 7}, colorText = TEXTCOLOR_PINK, magicEffect = CONST_ME_STUN},	
	
	
}

function onThink(cid, interval, lastExecution)
	for _, pid in pairs(config) do
		doSendAnimatedText(pid.pos, pid.texto, pid.colorText)
		doSendMagicEffect(pid.pos, pid.magicEffect)
	end
	return true
end