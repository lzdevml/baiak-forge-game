function onGetFormulaValues3(cid)
	min = -200
	max = -230
    return min, max
end

local combat = {}
for i, dmgTable in pairs(mage_changeElement) do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_BLOCKARMOR, 1)
	setCombatParam(combat[i], COMBAT_PARAM_BLOCKSHIELD, 1)
	setCombatParam(combat[i], COMBAT_PARAM_TYPE, dmgTable.dmgType)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, dmgTable.distEffect)

	_G['onGetFormulaValues3' .. i] = onGetFormulaValues3
	setCombatCallback(combat[i], CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3" .. i)
end

function onUseWeapon(cid, var)
	local value = getPlayerStorageValue(cid, storMage_changeElement)
	local combatUse = combat[value]
    if not combatUse then
        return true
    end
	return doCombat(cid, combatUse, var)
end