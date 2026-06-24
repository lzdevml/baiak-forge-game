local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 4, 6)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
