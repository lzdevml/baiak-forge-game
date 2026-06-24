local config = {
	storage = 43011,
	exstorage = 43012,
	days = {
		["Monday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		},
		["Tuesday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		},
		["Wednesday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		},
		["Thursday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		},
		["Friday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		},
		["Saturday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		},
		["Sunday"] = {
			{itemid = 2160, count = 50},
			{itemid = 2160, count = 40},
			{itemid = 2160, count = 20},
			{itemid = 2160, count = 10}
		}
	}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if isPremium(cid) == false then
doPlayerSendTextMessage(cid, 25, "Desculpe, Apenas VIP pode receber.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return true
end 
	
	
	if getPlayerLevel(cid) <= 50 then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Apenas jogadores level 50+ podem resgatar recompensas. Vá upar e resgate recompensas todos os dias.")
	end

	local x = config.days[os.date("%A")]
	if getPlayerStorageValue(cid, config.storage) == tonumber(os.date("%w")) then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce já resgatou sua recompensa hoje. Volte amanhã!")
	end

	local c = math.random(#x)
	local info, count = getItemInfo(x[c].itemid), x[c].count
	text = info.name

	local itemx = doCreateItemEx(x[c].itemid, count)
	if doPlayerAddItemEx(cid, itemx, false) ~= RETURNVALUE_NOERROR then
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
		text = "A recompensa tem " .. getItemWeight(itemx) .. " oz. Você não possui 'capacidade' ou não possui espaço suficiente em sua 'bp'."
	else
		text = "Você recebeu " .. text .. "."
		setPlayerStorageValue(cid, config.storage, tonumber(os.date("%w")))
	end

	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, text)
	return true
end