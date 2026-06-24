local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -6, -10, -5, -25, 9, 9, 1.0, 1.1)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
