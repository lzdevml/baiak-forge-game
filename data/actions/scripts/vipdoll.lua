-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 9789 then
   		queststatus = getPlayerStorageValue(cid,50999)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a addon doll.")
   			doPlayerAddItem(cid,9693,1)
   			setPlayerStorageValue(cid,50999,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")   		
   		end
	else
		return 0
   	end

   	return 1
end
