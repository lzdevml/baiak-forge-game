function onLogin(cid)

local playerVoc = getPlayerVocation(cid) -- Deixe isso como esta.
local reqTries = getPlayerRequiredSkillTries -- Deixe isso como esta.
local LevelMin = 150 -- Caso não queira utilizar essa função da script, mude o valor de 130 para 0.

local Mages = {
	ML = 60, -- Level inicial/minimo dos mages, sorc e druid.
	Shield = 20 -- Shield inicial/minimo dos mages, sorc e druid.
	}
	
local Paladin = {
	Distance = 80, -- Distancia inicial/minima dos paladinos.
	Shield = 80, -- Shield inicial/minimo dos paladinos.
	ML = 20 -- MagicLevel inicial/minimo dos paladinos.
	}
	
local Kina = {
	Sword = 80, -- Sword Level inicial/minimo dos knights.
	Axe = 80, -- Axe Level inicial/minimo dos knights.
	Club = 80, -- Club Level inicial/minimo dos knights.
	Shield = 80, -- Shield Level inicial/minimo dos knights.
	ML = 9 -- MagicLevel inicial/minimo dos knights.
	}
	
if getPlayerLevel(cid) < LevelMin then
	doPlayerAddExperience(cid, (getExperienceForLevel(LevelMin) - getPlayerExperience(cid)))
end

if playerVoc == 1 then
	if getPlayerMagLevel(cid) < Mages.ML then
		doPlayerAddMagLevel(cid, Mages.ML - getPlayerMagLevel(cid))
	end
	if getPlayerSkill(cid, SKILL_SHIELD) < Mages.Shield then
		doPlayerAddSkill(cid, SKILL_SHIELD, Mages.Shield - getPlayerSkill(cid, SKILL_SHIELD))
	end

elseif playerVoc == 2 then
	if getPlayerMagLevel(cid) < Mages.ML then
		doPlayerAddMagLevel(cid, Mages.ML - getPlayerMagLevel(cid))
	end
	if getPlayerSkill(cid, SKILL_SHIELD) < Mages.Shield then
		doPlayerAddSkill(cid, SKILL_SHIELD, Mages.Shield - getPlayerSkill(cid, SKILL_SHIELD))
	end

elseif playerVoc == 3 then
	if getPlayerSkill(cid, SKILL_DISTANCE) < Paladin.Distance then
		doPlayerAddSkill(cid, SKILL_DISTANCE, Paladin.Distance - getPlayerSkill(cid, SKILL_DISTANCE))
	end
	if getPlayerSkill(cid, SKILL_SHIELD) < Paladin.Shield then
		doPlayerAddSkill(cid, SKILL_SHIELD, Paladin.Shield - getPlayerSkill(cid, SKILL_SHIELD))
	end
	if getPlayerMagLevel(cid) < Paladin.ML then
		doPlayerAddMagLevel(cid, Paladin.ML - getPlayerMagLevel(cid))
	end

elseif playerVoc == 4 then
	if getPlayerSkill(cid, SKILL_SWORD) < Kina.Sword then
		doPlayerAddSkill(cid, SKILL_SWORD, Kina.Sword - getPlayerSkill(cid, SKILL_SWORD))
	end
	if getPlayerSkill(cid, SKILL_CLUB) < Kina.Club then
		doPlayerAddSkill(cid, SKILL_CLUB, Kina.Club - getPlayerSkill(cid, SKILL_CLUB))
	end
	if getPlayerSkill(cid, SKILL_AXE) < Kina.Axe then
		doPlayerAddSkill(cid, SKILL_AXE, Kina.Axe - getPlayerSkill(cid, SKILL_AXE))
	end
	if getPlayerSkill(cid, SKILL_SHIELD) < Kina.Shield then
		doPlayerAddSkill(cid, SKILL_SHIELD, Kina.Shield - getPlayerSkill(cid, SKILL_SHIELD))
	end
	if getPlayerMagLevel(cid) < Kina.ML then
		doPlayerAddMagLevel(cid, Kina.ML - getPlayerMagLevel(cid))
	end
end

return TRUE
end