function onStatsChange(cid, attacker, type, combat, value)
    if isPlayer(cid) and isCreature(attacker) and (not (attacker == cid)) then
        if (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS)) then
            if combat ~= COMBAT_HEALING then
                local reflectPercent = 10 -- PORCENTAGEM DO DANO DEVOLVIDO NO REFLECT + CHANCE DE ATIVAR
                local dmg = value
                local playerPos = getCreaturePosition(cid)
                local attackerPos = getCreaturePosition(attacker)

				if getPlayerStorageValue(cid, 38209) == 1 then -- STORAGE QUE O JOGADOR PRECISA TER PARA O REFLECT FUNCIUONAR. POR ITEM QUE AO DAR USE GANHE STOR XD
					if reflectPercent >= math.random (0,100) then
						dmg = math.ceil(-value*(45/100))
						if (dmg < 0) then
							if getCreatureCondition(attacker, CONDITION_MANASHIELD) then
								doCreatureAddMana(attacker, dmg)
								doSendAnimatedText(attackerPos, -dmg, COLOR_DRAWBLOOD)
								doSendMagicEffect(attackerPos, CONST_ME_STUN)
								doSendAnimatedText(getCreaturePos(cid), "REFLECT", COLOR_LIGHTBLUE)
							else
								doCreatureAddHealth(attacker, dmg)
								doSendAnimatedText(attackerPos, -dmg, COLOR_RED)
								doSendMagicEffect(attackerPos, CONST_ME_DRAWBLOOD)
								doSendAnimatedText(getCreaturePos(cid), "REFLECT", COLOR_LIGHTBLUE)
							end
						end
					else
						return true
					end
				end
            end
        end
    end
    return true
end