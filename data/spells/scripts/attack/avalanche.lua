local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1.4, 2.8, 40, 70)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	if getPlayerStorageValue(cid, WarConfigs.WarAreaRunesDisabled) == 1 then
		doPlayerSendCancel(cid, "Rune blocked for war administrator.")
		return false
	else
		return doCombat(cid, combat, var)
	end
end
