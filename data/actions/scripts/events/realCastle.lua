--[[

	Castle Custom @Vetodj

]]

function onUse(cid, item, frompos, item2, topos)

		local guild = getGlobalStorageValue(realCastle.guild_storage) > 1 and "a guild "..getGuildNameByID(getGlobalStorageValue(realCastle.guild_storage)).." possui o dom�nio" or "nenhuma guild possui o dom�nio do castelo"
		local sto = realCastle.date_storages
		local gsto = getGlobalStorageValue
		local time = gsto(sto[1]).."/"..gsto(sto[2]).."/"..gsto(sto[3])
		local domain = realCastle.isOpen() and "as guilds est�o batalhando pelo dom�nio do castelo" or guild
		local msg = " ---------[Styller-Castle]-------\n\n\nAtualmente "..domain..".\n\nPr�xima batalha: "..time.." �s 21:00."
	if item.uid == 61466 then
	doShowTextDialog(cid,8977,msg)
		return true
	end
	if not realCastle.isOpen() then 
		doTeleportThing(cid,getTownTemplePosition(1)) 
		doCreatureSay(cid,'Castle est� fechado para dominio!', TALKTYPE_ORANGE_1)
		return true 
	end
	if not realCastle.isDominating(cid) then
		realCastle.domain(cid)
		doSendMagicEffect(getThingPos(cid), CONST_ME_CRAPS)
		doCreatureSay(cid,'Dominei!', TALKTYPE_ORANGE_1)
	else
		doPlayerSendCancel(cid,"Sua guild j� est� com o dom�nio do castelo.")
	end
	return true
end
