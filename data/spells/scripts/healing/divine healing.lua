local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 19.5, 24)

function onCastSpell(cid, var)
    if isPlayer(cid) == TRUE then
        return doRemoveCondition(cid, CONDITION_PARALYZE), doCombat(cid, combat, var)
    end
end  
