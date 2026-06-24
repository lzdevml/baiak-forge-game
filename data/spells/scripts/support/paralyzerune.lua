local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -400)
setConditionFormula(condition, -1, 60, -1, 40)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end