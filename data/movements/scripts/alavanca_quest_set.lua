local pos_certa = {x = 981, y = 2448, z = 9} -- Quando as alavancas estiverem na posição correta

local alavancas = {
	[1] = {x = 974, y = 2451, z = 8},
	[2] = {x = 967, y = 2491, z = 8},
	[3] = {x = 1004, y = 2477, z = 8}
}

local levers = { -- Estado inicial
	[1] = "d",
	[2] = "d",
	[3] = "d"
}

local aux = {"e", "d"}

function onStepIn(cid)
if (not isPlayer(cid)) then
	return false
end
	
	for id, pos in ipairs(alavancas) do
		local itemid = levers[id] == "e" and 1945 or 1946
		if getTileItemById(pos, itemid).uid < 100 then
			return false
		end
	end

	doSendMagicEffect(getThingPos(cid), 10)
	doTeleportThing(cid, pos_certa, true)
	doSendMagicEffect(getThingPos(cid), 10)

	for id, pos in ipairs(alavancas) do
		local itemid = levers[id] == "e" and 1945 or 1946
		local lv = getTileItemById(pos, itemid).uid
		if lv > 100 then
			doTransformItem(lv, 1945)
		end
	end
	return true
end