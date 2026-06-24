--[[

		Sistema de unificação de eventos
	Desenvolvido por Vítor Bertolucci (Killua)
					27/01/2017

]]

function onStepIn(cid, item, position, fromPosition)
	local event = Events:getOpenedEvent()
	if event then
		local ban = Events:isBanished(cid)
		if ban then
			doTeleportThing(cid, fromPosition)
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não pode entrar no evento pois está banido dos eventos. Seu ban sairá em "..timeString(ban - os.time())..".")
		end
		local ring = getPlayerSlotItem(cid,CONST_SLOT_RING)
    	if ring and ring.uid and ring.uid > 0 and ring.itemid == 2165 then
        	doRemoveItem(ring.uid)
    	end
    	doRemoveCondition(cid, CONDITION_INVISIBLE)
		return event:checkMovements(cid, item, position, fromPosition)
	end
	return true
end


function onAddItem(moveitem, tileitem, position, cid)
	if isPlayer(cid) then
		doRemoveItem(moveitem.uid)
		doSendMagicEffect(position, CONST_ME_POFF)
	end
	return true
end
