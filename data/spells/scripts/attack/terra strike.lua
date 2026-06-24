local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)

function onCastSpell(cid, var)
	if getPlayerStorageValue(cid, WarConfigs.WarUEDisabled) == 1 then
		doPlayerSendCancel(cid, "[Anti-Entrosa] You cannot use this spell inside here.")
		return false
	else
		return doCombat(cid, combat, var)
	end
end
