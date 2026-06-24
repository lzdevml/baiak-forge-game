function onGetFormulaValues(cid, level, skill, attack, factor)
	local min = 0.03 * (attack * skill + (level/5))
	local max = 0.08 * (attack * skill + (level/5))
	return -min, -max
end

local combat = {}
for i, dmgTable in pairs(paly_changeElement) do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_BLOCKARMOR, 1)
	setCombatParam(combat[i], COMBAT_PARAM_BLOCKSHIELD, 1)
	setCombatParam(combat[i], COMBAT_PARAM_TYPE, dmgTable.dmgType)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, dmgTable.distEffect)

	_G['onGetFormulaValues' .. i] = onGetFormulaValues
	setCombatCallback(combat[i], CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues" .. i)
end

function onUseWeapon(cid, var)
	local value = getPlayerStorageValue(cid, storPaly_changeElement)
	local combatUse = combat[value]
    if not combatUse then
        return true
    end
	return doCombat(cid, combatUse, var)
end