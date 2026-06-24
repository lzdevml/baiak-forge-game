local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -7, -1, -7, 3, 3, 4, 5)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
setCombatArea(combat, area)

function onCastSpell(cid, var)


local pos_player = getCreaturePosition(cid)

	if pos_player.x >= 19924 and pos_player.x <= 20002 then
		if pos_player.y >= 20085 and pos_player.y <= 20169 then
			if pos_player.z == 7 then
			doPlayerSendCancel(cid, "[Castle 21h] You cannot use this spell inside here.")
			return false
			end
		end
	end
	
	
	if getPlayerStorageValue(cid, WarConfigs.WarUEDisabled) == 1 then
		doPlayerSendCancel(cid, "[Anti-Entrosa] You cannot use this spell inside here.")
		return false
	else
		return doCombat(cid, combat, var)
	end
end

