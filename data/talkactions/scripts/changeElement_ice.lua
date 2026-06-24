-- COPIAR DAQUI
local allowed = {13360, 13355}

local function getElementWeaponAllowedList(cid)
	local str, ctrl = '', 0
	for i = 1, #allowed do
		ctrl = ctrl + 1
		if ctrl == 1 then str = getItemNameById(allowed[i]) elseif ctrl == #allowed then str = str..' e '..getItemNameById(allowed[i])..'' else str = str..', '..getItemNameById(allowed[i])..'' end
	end
	return str
end
-- ATÈ AQUI

function onSay(cid, words, param, channel)
	if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 then -- sorc and druid
	
		-- COPIAR DAQUI
		local item = getPlayerWeapon(cid, true)
		if item.itemid <= 0 then
			item = getPlayerWeapon(cid, false)
		end
		if not isInArray(allowed, item.itemid) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Desculpe, você não pode mudar o elemento para este item.\n Itens permitidos: "..getElementWeaponAllowedList(cid)..".")
			return true
		end
		-- ATÉ AQUI	

		if getPlayerStorageValue(cid, storMage_changeElement) ~= 3 then
			if (getPlayerLevel(cid) >= 8) and (getPlayerMoney(cid) >= 300000) then
				if (getPlayerLevel(cid) >= 8) and (doPlayerRemoveMoney(cid, 300000)) then
					setPlayerStorageValue(cid, storMage_changeElement, 3)
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Seu novo elemento: Ice")
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "WARNING: Something unexpected has occurred. Please contact the administrator. > ERROR 104 <")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não tem dinheiro ou level suficiente. Você precisa de 300k + para trocar o elemento da arma.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já possui esse elemento!")
		end


	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua vocação não pode utilizar este comando.")
	end
	return true
end