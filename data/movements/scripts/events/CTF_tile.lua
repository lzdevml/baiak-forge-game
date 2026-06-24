local conditionBlue = {lookType = 2721, lookHead = 87, lookBody = 87, lookLegs = 79, lookFeet = 79, lookTypeEx = 0, lookAddons = 3}
local conditionRed = {lookType = 2721, lookHead = 94, lookBody = 94, lookLegs = 79, lookFeet = 79, lookTypeEx = 0, lookAddons = 3}

function onStepIn(cid, item, position, fromPosition, toPosition, lastPosition, actor)
	if isPlayer(cid) then
		if getCreatureStorage(cid, ctfConfig.flag.storage) > 0 then
			if getCreatureStorage(cid, ctfConfig.red.storage) > 0 then
				if isControledByTeamCTF(getThingPos(cid), 'red') then
					local points = ctfConfig.pointsForFlag + (ctfConfig.pointsForEachBase * getBasesControledByTeamCTF('red'))
					if getStorage(ctfConfig.red.scores) + points >= ctfConfig.maxTeamPoints then
						doCloseCtfEvent('red')
						doChangeSpeed(cid, math.floor(getCreatureBaseSpeed(cid) / 2))
					else
						doChangeSpeed(cid, math.floor(getCreatureBaseSpeed(cid) / 2))
						doRemoveCondition(cid, CONDITION_OUTFIT)
						doSetCreatureOutfit(cid, conditionRed, -1)
						doSetStorage(ctfConfig.red.scores, getStorage(ctfConfig.red.scores) + points)
						doBroadcastMessage('[CTF]\n' .. getCreatureName(cid) .. ' do [red team] marcou pontos para equipe. Atual resultado:\nRed team: ' .. getStorage(ctfConfig.red.scores) .. '/' .. ctfConfig.maxTeamPoints .. '\nBlue team: ' .. getStorage(ctfConfig.blue.scores) .. '/' .. ctfConfig.maxTeamPoints .. '', MESSAGE_STATUS_WARNING)
					end

					addEvent(doCreateItem, 15000, ctfConfig.flag.id, 1, ctfConfig.flag.pos)
					doCreatureSetStorage(cid, ctfConfig.flag.storage, -1)
				else
					doPlayerSendCancel(cid, 'Esta base não é controlada por sua equipe.')
				end

			elseif getCreatureStorage(cid, ctfConfig.blue.storage) > 0 then
				if isControledByTeamCTF(getThingPos(cid), 'blue') then
					local points = ctfConfig.pointsForFlag + ctfConfig.pointsForEachBase * getBasesControledByTeamCTF('blue')								

					if getStorage(ctfConfig.blue.scores) + points >= ctfConfig.maxTeamPoints then
						doCloseCtfEvent('blue')
						doChangeSpeed(cid, math.floor(getCreatureBaseSpeed(cid) / 2))
					else
						doChangeSpeed(cid, math.floor(getCreatureBaseSpeed(cid) / 2))
						doRemoveCondition(cid, CONDITION_OUTFIT)
						doSetCreatureOutfit(cid, conditionBlue, -1)
						doSetStorage(ctfConfig.blue.scores, getStorage(ctfConfig.blue.scores) + points)
						doBroadcastMessage('[CTF]\n' .. getCreatureName(cid) .. ' do [blue team] marcou pontos para equipe. Atual resultado:\nRed team: ' .. getStorage(ctfConfig.red.scores) .. '/' .. ctfConfig.maxTeamPoints .. '\nBlue team: ' .. getStorage(ctfConfig.blue.scores) .. '/' .. ctfConfig.maxTeamPoints .. '', MESSAGE_STATUS_WARNING)
					end

					addEvent(doCreateItem, 15000, ctfConfig.flag.id, 1, ctfConfig.flag.pos)
					doCreatureSetStorage(cid, ctfConfig.flag.storage, -1)
				else
					doPlayerSendCancel(cid, 'Esta base não é controlada por sua equipe.')
				end
			end
		end
	end
	return true
end