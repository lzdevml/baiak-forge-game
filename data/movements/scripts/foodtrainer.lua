local config = {
eff = 12, -- efeito que sai
food = 100, -- quanto de food vai dar (use 100 no maximo)
timespin = 10 -- tempo pra dar uma volta (quanto menor mais checagens a função vai fazer e mais pesado vai ficar o sistema)
}

function helpTrainer(uid, pos)
	if not isPlayer(uid) then return false end
	look = getCreatureLookDirection(uid)
	look = look < 3 and look + 1 or 0
	doCreatureSetLookDirection(uid, look)
	doSendMagicEffect(pos, config.eff)
	
	if getPlayerFood(uid) < config.food then
		doPlayerFeed(uid, config.food)
		doCreatureSay(uid, "+ Food", TALKTYPE_MONSTER)
	end
	
	addEvent(function()
		if isPlayer(uid) and getCreaturePosition(uid).x == pos.x and getCreaturePosition(uid).y == pos.y and getCreaturePosition(uid).z == pos.z then
			helpTrainer(uid, pos)
		end
	end, config.timespin * 1000)
return true
end	

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	helpTrainer(cid, position)
return true
end