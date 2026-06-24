-- ultimate shield

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

   	if item.uid == 5051 then
   		queststatus = getPlayerStorageValue(cid,503029)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a ultimate shield.")
   			broadcastMessage (""..playername.." completed a Ultimate Quest! ", 19)
   			doPlayerAddItem(cid,2533,1)
   			setPlayerStorageValue(cid,503029,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5052 then
   		queststatus = getPlayerStorageValue(cid,503029)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a ultimate shield.")
   			broadcastMessage (""..playername.." completed a Ultimate Quest! ", 19)
   			doPlayerAddItem(cid,2527,1)
   			setPlayerStorageValue(cid,503029,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	end
   	return 1
end


