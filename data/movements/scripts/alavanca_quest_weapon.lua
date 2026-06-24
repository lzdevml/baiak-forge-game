local pos_certa = {x = 5825, y = 1570, z = 10} -- Quando as alavancas estiverem na posição correta

local alavancas = {
	[1] = {x = 737, y = 2265, z = 10},
	[2] = {x = 743, y = 2265, z = 10},
	[3] = {x = 737, y = 2272, z = 10},
	[4] = {x = 743, y = 2272, z = 10}
}

local levers = { -- Estado inicial
	[1] = "d",
	[2] = "e",
	[3] = "d",
	[4] = "e"
}

local aux = {"e", "d"}

function onStepIn(cid, item, position, fromPosition)
	if (not isPlayer(cid)) then
        return true
    end
	
	for id, pos in ipairs(alavancas) do
		local itemid = levers[id] == "e" and 1945 or 1946
		if getTileItemById(pos, itemid).uid < 100 then
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "As alavancas precisam estar na posicao correta para ter acesso ao teleport.")
			return true
		end
	end


	doSendMagicEffect(getThingPos(cid), 10)
	doTeleportThing(cid, pos_certa, true)
	doSendMagicEffect(getThingPos(cid), 10)

	for id, pos in ipairs(alavancas) do
		local itemid = levers[id] == "e" and 1945 or 1946
		local lv = getTileItemById(pos, itemid).uid
		if lv > 100 then
			doTransformItem(lv, math.random(1945, 1946))
		end
	end
	return true
end