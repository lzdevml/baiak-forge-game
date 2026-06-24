function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 26730) >= 0 then
		if (itemEx.itemid == 7508) or (itemEx.itemid == 7509) or (itemEx.itemid == 7510) or (itemEx.itemid == 7511) then
			if getItemNameById(item.id) == "bk sword +6" or getItemNameById(item.id) == "bk club +6" or getItemNameById(item.id) == "bk axe +6" then
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12651,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12652,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12653,1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "No momento as armas de knight estão com elemento fixo mas breve você podera escolher qual quer usar.")
			else	
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua arma precisa ser +6 para colocar elemento.")
			end
		elseif (itemEx.itemid == 7504) or (itemEx.itemid == 7505) or (itemEx.itemid == 7506) or (itemEx.itemid == 7507) then
			if getItemNameById(item.id) == "bk sword +6" or getItemNameById(item.id) == "bk club +6" or getItemNameById(item.id) == "bk axe +6" then
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12651,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12652,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12653,1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "No momento as armas de knight estão com elemento fixo mas breve você podera escolher qual quer usar.")
			else	
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua arma precisa ser +6 para colocar elemento.")
			end
		elseif (itemEx.itemid == 7516) or (itemEx.itemid == 7517) or (itemEx.itemid == 7518) or (itemEx.itemid == 7519) then
			if getItemNameById(item.id) == "bk sword +6" or getItemNameById(item.id) == "bk club +6" or getItemNameById(item.id) == "bk axe +6" then
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12651,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12652,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12653,1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "No momento as armas de knight estão com elemento fixo mas breve você podera escolher qual quer usar.")
			else	
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua arma precisa ser +6 para colocar elemento.")
			end
		elseif (itemEx.itemid == 7512) or (itemEx.itemid == 7513) or (itemEx.itemid == 7514) or (itemEx.itemid == 7515) then
			if getItemNameById(item.id) == "bk sword +6" or getItemNameById(item.id) == "bk club +6" or getItemNameById(item.id) == "bk axe +6" then
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12651,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12652,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12653,1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "No momento as armas de knight estão com elemento fixo mas breve você podera escolher qual quer usar.")
			else	
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua arma precisa ser +6 para colocar elemento.")
			end
		elseif (itemEx.itemid == 1561) then
			if getItemNameById(item.id) == "bk sword +6" or getItemNameById(item.id) == "bk club +6" or getItemNameById(item.id) == "bk axe +6" then
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12651,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12652,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12653,1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "No momento as armas de knight estão com elemento fixo mas breve você podera escolher qual quer usar.")
			else	
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua arma precisa ser +6 para colocar elemento.")
			end
		elseif (itemEx.itemid == 3900) then
			if getItemNameById(item.id) == "bk sword +6" or getItemNameById(item.id) == "bk club +6" or getItemNameById(item.id) == "bk axe +6" then
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12651,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12652,1)
				end
				if doRemoveItem(item.id,1) then
					doPlayerAddItem(cid, 12653,1)
				end
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "No momento as armas de knight estão com elemento fixo mas breve você podera escolher qual quer usar.")
			else	
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Sua arma precisa ser +6 para colocar elemento.")
			end
		end
        else
                doPlayerSendTextMessage(cid, 25, "Você não possui o encanto de trocar elementos.")
        end
    return true
end