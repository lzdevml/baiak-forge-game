--[[

				Real Castle Event
	Desenvolvido por Vítor Bertolucci (Killua)

]]

function onUse(cid, item, frompos, item2, topos)
	if item.uid == 61469 then
		local guild = getGlobalStorageValue(realCastle.guild_storage) > 1 and "a guild "..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).." possui o domínio" or "nenhuma guild possui o domínio do castelo"
		local sto = realCastle.date_storages
		local gsto = getGlobalStorageValue
		local time = gsto(sto[1]).."/"..gsto(sto[2]).."/"..gsto(sto[3])
		local domain = realCastle.isOpen() and "as guilds estão batalhando pelo domínio do castelo" or guild
		local msg = " -----------[Baiakinho]----------\n\n\nPrincipais Regras que levam a delete... Proibido Trapar Caves; Proibido MC No Castle; Proibido Divulgação; Proibido difamar o servidor de maneira que leve outros players a se retirarem; Proibido fazer free itens donates;"
		doShowTextDialog(cid,8977,msg)
		return true
	end
	if not realCastle.isOpen() then 
		doTeleportThing(cid,getTownTemplePosition(1)) 
		return true 
	end
	if not realCastle.isDominating(cid) then
		realCastle.domain(cid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_CRAPS)
	else
		doPlayerSendCancel(cid,"Sua guild já está com o domínio do castelo.")
	end
	return true
end
