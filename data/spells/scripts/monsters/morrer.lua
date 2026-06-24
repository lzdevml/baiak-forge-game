local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 39)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 0)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

function onCastSpell(cid, var)
	doCreatureAddHealth(cid, -250000)
   return doCombat(cid, combat, var)
end
