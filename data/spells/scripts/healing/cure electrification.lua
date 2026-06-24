local exausted = 2 -- exhausted em segundos
local storage = 15476 -- storage do exausted

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_ENERGY)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
