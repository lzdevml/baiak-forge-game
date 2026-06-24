local deadOutfit = {lookType = 33, lookHead = 94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookTypeEx = 0, lookAddons = 0}

function onStatsChange(cid, attacker, type, combat, value)
	if type == 1 and getCreatureHealth(cid) <= value then
		if isPlayer(cid) then
			if getCreatureStorage(cid, ctfConfig.red.storage) > 0 then
				addEvent(doTeleportThing, 0, cid, ctfConfig.red.deathPos)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Você está morto e foi teleportado para a sala dos mortos. Depois de alguns segundos, você será teleportado novamente para a batalha.')
				doSetCreatureOutfit(cid, deadOutfit, -1)
				doRemoveConditions(cid)
				doCreatureAddHealth(cid, -(getCreatureHealth(cid) - 1))
				doCreatureAddMana(cid, -(getCreatureMana(cid) - 1))
				doCreatureSetStorage(cid, ctfConfig.deathStorage, 1)

				if getCreatureStorage(cid, ctfConfig.flag.storage) == 1 then
					if getTileItemById(getThingPos(cid), 2019).uid > 0 then
						doRemoveItem(getTileItemById(getThingPos(cid), 2019).uid)
					end

					doCreateItem(ctfConfig.flag.id, 1, getThingPos(cid))
					doCreatureSetStorage(cid, ctfConfig.flag.storage, -1)
					doBroadcastMessage('[CTF]\n' .. getCreatureName(cid) .. ' do [red team] perdeu a bandeira!', MESSAGE_STATUS_WARNING)
					doChangeSpeed(cid, math.floor(getCreatureBaseSpeed(cid) / 2))
				end
				return false

			elseif getCreatureStorage(cid, ctfConfig.blue.storage) > 0 then
				addEvent(doTeleportThing, 0, cid, ctfConfig.blue.deathPos)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Você está morto e foi teleportado para o quarto da morte. Após alguns segundos, você será teleportado novamente para a batalha.')
				doSetCreatureOutfit(cid, deadOutfit, -1)
				doRemoveConditions(cid)
				doCreatureAddHealth(cid, -(getCreatureHealth(cid) - 1))
				doCreatureAddMana(cid, -(getCreatureMana(cid) - 1))
				doCreatureSetStorage(cid, ctfConfig.deathStorage, 1)

				if getCreatureStorage(cid, ctfConfig.flag.storage) > 0 then
					if getTileItemById(getThingPos(cid), 2019).uid > 0 then
						doRemoveItem(getTileItemById(getThingPos(cid), 2019).uid)
					end

					doCreateItem(ctfConfig.flag.id, 1, getThingPos(cid))
					doCreatureSetStorage(cid, ctfConfig.flag.storage, -1)
					doBroadcastMessage('[CTF]\n' .. getCreatureName(cid) .. ' do [blue team] perdeu a bandeira!', MESSAGE_STATUS_WARNING)
					doChangeSpeed(cid, math.floor(getCreatureBaseSpeed(cid) / 2))
				end
				return false
			end
		end
	end
	return true
end

function onCombat(cid, target)
	if isPlayer(cid) and isPlayer(target) then
		if getCreatureStorage(cid, ctfConfig.red.storage) == 1 and getCreatureStorage(target, ctfConfig.red.storage) == 1 then
			return doPlayerSendCancel(cid, 'Você não pode atacar seus companheiros de equipe.') and false
		elseif getCreatureStorage(cid, ctfConfig.blue.storage) == 1 and getCreatureStorage(target, ctfConfig.blue.storage) == 1 then
			return doPlayerSendCancel(cid, 'Você não pode atacar seus companheiros de equipe.') and false
		end
	end
	return true
end