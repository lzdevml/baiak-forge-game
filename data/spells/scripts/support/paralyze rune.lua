local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 40000)
setConditionFormula(condition, -1, 60, -1, 40)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
