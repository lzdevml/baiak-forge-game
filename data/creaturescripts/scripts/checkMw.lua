function onThink(cid, interval, lastExecution, thinkInterval)
	if isMonster(cid) then
		posicoes = {
			[1] = {fromPosition = {x = (getCreaturePosition(cid).x - 1), y = (getCreaturePosition(cid).y - 1), z = getCreaturePosition(cid).z, stackpos = 254}},
			[2] = {fromPosition = {x = (getCreaturePosition(cid).x), y = (getCreaturePosition(cid).y - 1), z = getCreaturePosition(cid).z, stackpos = 254}},
			[3] = {fromPosition = {x = (getCreaturePosition(cid).x + 1), y = (getCreaturePosition(cid).y - 1), z = getCreaturePosition(cid).z, stackpos = 254}},
			[4] = {fromPosition = {x = (getCreaturePosition(cid).x - 1), y = (getCreaturePosition(cid).y), z = getCreaturePosition(cid).z, stackpos = 254}},
			[5] = {fromPosition = {x = (getCreaturePosition(cid).x), y = (getCreaturePosition(cid).y), z = getCreaturePosition(cid).z, stackpos = 254}},
			[6] = {fromPosition = {x = (getCreaturePosition(cid).x + 1), y = (getCreaturePosition(cid).y), z = getCreaturePosition(cid).z, stackpos = 254}},
			[7] = {fromPosition = {x = (getCreaturePosition(cid).x - 1), y = (getCreaturePosition(cid).y + 1), z = getCreaturePosition(cid).z, stackpos = 254}},
			[8] = {fromPosition = {x = (getCreaturePosition(cid).x), y = (getCreaturePosition(cid).y + 1), z = getCreaturePosition(cid).z, stackpos = 254}},
			[9] = {fromPosition = {x = (getCreaturePosition(cid).x + 1), y = (getCreaturePosition(cid).y + 1), z = getCreaturePosition(cid).z, stackpos = 254}}
		}
		for i, j in pairs(posicoes) do
			if getThingfromPos(posicoes[i].fromPosition).itemid == 1497 or getThingfromPos(posicoes[i].fromPosition).itemid == 1499 then
				--doBroadcastMessage("MW")
				doRemoveItem(getThingfromPos(posicoes[i].fromPosition).uid)
			end
		end
	end
	return true
end