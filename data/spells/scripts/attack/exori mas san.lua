local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_HOLY)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 15, 18, 21, 25)

local arr = {
    {0, 1, 0},
    {1, 3, 1},
    {0, 1, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
    if getPlayerStorageValue(cid, 64856) >= 10 then
    	return doCombat(cid, combat, var)
    else
	doSendMagicEffect(getThingPos(cid), 2)
        doPlayerSendTextMessage(cid, 22, "Você não possui essa magia pois nao fez a quest das novas magias 350+!")
    end
end