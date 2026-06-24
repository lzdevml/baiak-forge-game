local firstPositions = {
	{x = 889, y = 387, z = 8}, 
	{x = 907, y = 387, z = 8},
	{x = 925, y = 387, z = 8},
	{x = 943, y = 387, z = 8}
}


local function getAvailableRoom()
	for o = 1,#firstPositions do
		local position = firstPositions[o]
		for i = 1, 20 do
			local player = getTopCreature(position).uid
			if not isPlayer(player) then
				return position;
			end
			position = {x = position.x + 18, y = position.y, z = position.z}
		end
	end
	return false
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local trainer_pos = getAvailableRoom()
	if trainer_pos and doTeleportThing(cid,trainer_pos, true) then
		doSendMagicEffect(getCreaturePosition(cid), 10)
	else
	--	doCreatureSay(cid, "Todas as salas de trainers particulares estão lotadas.", TALKTYPE_MONSTER_SAY)
		doPlayerSendCancel(cid, "Todas as salas de trainers particulares estão lotadas. DICA: desça as escadas e procure por um trainer vazio.")
		doTeleportThing(cid, fromPosition)
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	end
	return true
end
