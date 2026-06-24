local tpPos =  {x = 152, y = 48, z = 7} -- Posição que o tp irá ser criado
local tpDestino = {x = 165, y = 639, z = 7} -- Posisão para ond vai
local tpPosRelocate = {x=160,y=51,z=7} -- Para onde os jogadores são levados se estiverem no SQM do teleport quando ele aparecer
local timeF = 30, --Tempo para fechar, em minutos.

local days = {
	-- Primeira letra maiuscula para não bugar
	['Monday'] = {'18:40:20'}
}

local function fecharTp()
	local t = getTileItemById(tpPos, 1387)
	if t then
		doRemoveItem(t.uid, 1)
		doSendMagicEffect(config.pos, CONST_ME_POFF)
		doBroadcastMessage("O teleport fechou.")
	end
end

function onThink(interval, lastExecution)
	local daysOpen = {}
	for k, v in pairs(days) do
		table.insert(daysOpen, k)
	end
	
	

	if isInArray(daysOpen, os.date('%A')) then
		if isInArray(days[os.date('%A')], os.date('%X', os.time())) then
			local tp = getTileItemById(tpPos, 1387).uid
			if tp < 1 then
				doRelocate(tpPos, {x=tpPosRelocate.x, y=tpPosRelocate.y, z=tpPosRelocate.z})
				doCreateTeleport(1387, tpDestino, tpPos)
				doBroadcastMessage("O teleport para o evento foi aberto! Ele vai fechar em 30 minutos.")
				addEvent(fecharTp, timeF * 60 * 1000)
			end
		end
	end
	return true
end