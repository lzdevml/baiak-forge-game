local lvlcrit = 35033

function onStatsChange(cid, attacker, type, combat, value, target)
	if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and isPlayer(attacker) then
		if (getPlayerStorageValue(attacker, lvlcrit)*1) >= math.random (0,1000) then
			dano = math.ceil(value*(0.1)) -- aqui o multiplicador de dano
			doTargetCombatHealth(attacker, cid, combat, -dano, -dano, CONST_ME_INSECTS)
			doSendAnimatedText(getCreaturePos(attacker), "LETAL", COLOR_DARKRED)
		end
	end
	return true
end

function onCombat(cid, target)
    if (isPlayer(cid) and isMonster(target)) then
        registerCreatureEvent(target, "Critical")    
    end
    return true
end