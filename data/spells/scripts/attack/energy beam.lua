local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 2.5, 4)

local area = createCombatArea(AREA_BEAM4, AREADIAGONAL_BEAM4)
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
