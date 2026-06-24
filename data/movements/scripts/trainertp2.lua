local npos = {x = 88, y = 10170, z = 7} -- posição que ele vai ao sair da sala
local storage = 18481 -- storage que salva a ultima vez que o player entrou (pra evitar spams)

function onStepIn(cid, item, pos, lastPos, fromPos, toPos, actor)
	ArrayPos = {{x = fromPos.x - 1, y = fromPos.y + 1, z = fromPos.z}, {x = fromPos.x + 1 , y = fromPos.y + 1, z = fromPos.z}}
	for _, pos in ipairs(ArrayPos) do
		creature = getTopCreature(pos).uid	
		if isMonster(creature)then
			doSendMagicEffect(getThingPos(creature), 14)
			doRemoveCreature(creature)
		end	
	end
	doTeleportThing(cid, npos)
	doPlayerSetStorageValue(cid, storage, os.time() + 5)
return true
end 