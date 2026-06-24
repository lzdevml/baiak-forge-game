function checkCliente(cid)
	local teste = db.getResult("SELECT `clientstatus` FROM `accounts` WHERE `id` = "..getPlayerAccountId(cid)..";")
	retorno = teste:getDataInt("clientstatus", getPlayerAccountId(cid))
	return retorno
end

function onStepIn(cid, item, fromPosition)
   	if checkCliente(cid) == 1 then
   		doBroadcastMessage("Voce tem acesso a nova area, pois possui new client.")
   	else
   		doBroadcastMessage("Voce nao tem acesso a nova area, pois nao possui new client.")
   	end
end