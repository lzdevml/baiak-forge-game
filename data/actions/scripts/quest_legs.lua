-- vip chests

function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 5100 then
   		queststatus = getPlayerStorageValue(cid,50330)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a dragon scale legs.")
   			doPlayerAddItem(cid,2469,1)
   			setPlayerStorageValue(cid,50330,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
		
		 -- Adicionar recompensa de outfit ao jogador com base no gênero
            if getPlayerSex(cid) == 0 then -- Jogador feminino
                doPlayerAddOutfit(cid, 1289, 1) -- ID do outfit feminino
            elseif getPlayerSex(cid) == 1 then -- Jogador masculino
                doPlayerAddOutfit(cid, 1288, 1) -- ID do outfit masculino
            end

	end
   	return 1
end
