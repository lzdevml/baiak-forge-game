local tpId = 1387
local tps = {
	["Alptramun"] = {pos = {x = 6648, y = 11927, z = 6}, toPos = {x = 6689, y = 11922, z = 6}, time = 40},
}

function removeTp(tp)
	local t = getTileItemById(tp.pos, tpId)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(tp.pos, 53)
	end
end

function onDeath(cid)
	local tp = tps[getCreatureName(cid)]
	if tp then
		doCreateTeleport(tpId, tp.toPos, tp.pos)
		doCreatureSay(cid, "This is not the end, I'll be back. The portal will shut down in "..tp.time.." seconds.", TALKTYPE_ORANGE_1)
		addEvent(removeTp, tp.time*4000, tp)
	end
	return TRUE
end