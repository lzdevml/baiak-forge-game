-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5970 then
   		queststatus = getPlayerStorageValue(cid,5970)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Great Shield.")
   			doPlayerAddItem(cid,2522,1)
   			setPlayerStorageValue(cid,5970,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
       	end
	else
		return 0
   	end
	
	-- Adicionar recompensa de outfit ao jogador com base no gênero
            if getPlayerSex(cid) == 0 then -- Jogador feminino
                doPlayerAddOutfit(cid, 1289, 2) -- ID do outfit feminino
            elseif getPlayerSex(cid) == 1 then -- Jogador masculino
                doPlayerAddOutfit(cid, 1288, 2) -- ID do outfit masculino
            end

   	return 1
end	
	

