local tps = {
	["Azerus"] = {pos = {x=1253, y=172, z=9}, toPos = {x=1287, y=165, z=9}, time = 40},
}

function removeTp(tp)
	local t = getTileItemById(tp.pos, 1387)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(tp.pos, CONST_ME_POFF)
	end
end

function onDeath(cid)
	local tp = tps[getCreatureName(cid)]
	if tp then
		doCreateTeleport(1387, tp.toPos, tp.pos)
		doCreatureSay(cid, "O teleport irá sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
		addEvent(removeTp, tp.time*1000, tp)
	end
	return true
end