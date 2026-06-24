local config = {
     stoneid = 1285,
	 pos = {x = 446, y = 82, z = 7},
	 pos2 = {x = 442, y = 87, z = 7},
	 pos3 = {x = 441, y = 87, z = 7},
	 pos4 = {x = 440, y = 87, z = 7},
	 pos5 = {x = 439, y = 87, z = 7},
	 pos6 = {x = 443, y = 87, z = 7},
     time = 3600 -- time in seconds to create the stone
}
		
function onSay(cid, words, param, channel)
	local msg1min = "[Castle 2]\n\n5 minutos para se abrirem as portas do Castle 02. Teleport no Temple." 
	local msg2min = "[Castle 2]\n\n4 minutos para se abrirem as portas do Castle 02. Teleport no Temple." 
	local msg3min = "[Castle 2]\n\n3 minutos para se abrirem as portas do Castle 02. Teleport no Temple." 
	local msg4min = "[Castle 2]\n\n2 minutos para se abrirem as portas do Castle 02. Teleport no Temple." 
	local msg5min = "[Castle 2]\n\n1 minutos para se abrirem as portas do Castle 02. Teleport no Temple." 
	local msg = "[Castle 2]\n\nQue comece a guerra. Teleport no Temple."
	
function RemoverPedras()
		local stone = getTileItemById(config.pos,config.stoneid).uid
		if(stone > 0) then
		doRemoveItem(stone,1)
		doSendMagicEffect(config.pos, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos)
		doBroadcastMessage(msg)
		RemoverPedras2()
		RemoverPedras3()
		RemoverPedras4()
		RemoverPedras5()
		RemoverPedras6()
		return true
	end
end	

function RemoverPedras2()
		local stone = getTileItemById(config.pos2,config.stoneid).uid
		if(stone > 0) then
		doRemoveItem(stone,1)
		doSendMagicEffect(config.pos2, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos2)
		doBroadcastMessage(msg)
		return true
	end
end	
function RemoverPedras3()
		local stone = getTileItemById(config.pos3,config.stoneid).uid
		if(stone > 0) then
		doRemoveItem(stone,1)
		doSendMagicEffect(config.pos3, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos3)
		doBroadcastMessage(msg)
		return true
	end
end	

function RemoverPedras4()
		local stone = getTileItemById(config.pos4,config.stoneid).uid
		if(stone > 0) then
		doRemoveItem(stone,1)
		doSendMagicEffect(config.pos4, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos4)
		doBroadcastMessage(msg)
		return true
	end
end	

function RemoverPedras5()
		local stone = getTileItemById(config.pos5,config.stoneid).uid
		if(stone > 0) then
		doRemoveItem(stone,1)
		doSendMagicEffect(config.pos5, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos5)
		doBroadcastMessage(msg)
		return true
	end
end	

function RemoverPedras6()
		local stone = getTileItemById(config.pos6,config.stoneid).uid
		if(stone > 0) then
		doRemoveItem(stone,1)
		doSendMagicEffect(config.pos6, CONST_ME_MAGIC_RED)
		addEvent(doCreateItem, config.time * 1000, config.stoneid, 1, config.pos6)
		doBroadcastMessage(msg)
		return true
	end
end	

	doBroadcastMessage(msg1min)
	addEvent(doBroadcastMessage, 60000, msg2min)
	addEvent(doBroadcastMessage, 120000, msg3min)
	addEvent(doBroadcastMessage, 180000, msg4min)
	addEvent(doBroadcastMessage, 240000, msg5min)
	addEvent(RemoverPedras, 300000)
    return true
end
