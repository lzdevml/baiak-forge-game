-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9980 then
   		queststatus = getPlayerStorageValue(cid,9923)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Koshei ancient amulet.")
   			doPlayerAddItem(cid,8266,1)
   			setPlayerStorageValue(cid,9923,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end
	
	-- Adicionar recompensa de outfit ao jogador com base no gênero
            if getPlayerSex(cid) == 0 then -- Jogador feminino
                doPlayerAddOutfit(cid, 431, 3) -- ID do outfit feminino
            elseif getPlayerSex(cid) == 1 then -- Jogador masculino
                doPlayerAddOutfit(cid, 430, 3) -- ID do outfit masculino
            end

   	return 1
end	
	

