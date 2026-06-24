-- vip chests

function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 5101 then
   		queststatus = getPlayerStorageValue(cid,5656565656568)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Necromancer Shield.")
   			doPlayerAddItem(cid,6433,1)
   			setPlayerStorageValue(cid,5656565656568,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
		-- Adicionar recompensa de outfit ao jogador com base no gênero
            if getPlayerSex(cid) == 0 then -- Jogador feminino
                doPlayerAddOutfit(cid, 278, 3) -- ID do outfit feminino
            elseif getPlayerSex(cid) == 1 then -- Jogador masculino
                doPlayerAddOutfit(cid, 279, 3) -- ID do outfit masculino
            end
   	elseif item.uid == 5102 then
   		queststatus = getPlayerStorageValue(cid,5656565656568)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Nightmare Shield.")
   			doPlayerAddItem(cid,6391,1)
   			setPlayerStorageValue(cid,5656565656568,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
		-- Adicionar recompensa de outfit ao jogador com base no gênero
            if getPlayerSex(cid) == 0 then -- Jogador feminino
                doPlayerAddOutfit(cid, 269, 3) -- ID do outfit feminino
            elseif getPlayerSex(cid) == 1 then -- Jogador masculino
                doPlayerAddOutfit(cid, 268, 3) -- ID do outfit masculino
            end
	elseif item.uid == 5075645645646546542 then
   		queststatus = getPlayerStorageValue(cid,5656565656568)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Yalahari Legs.")
   			doPlayerAddItem(cid,9777,1)
   			setPlayerStorageValue(cid,5656565656568,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end

	end
   	return 1
end


