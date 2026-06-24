-- ultimate armor

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

   	if item.uid == 5053 then
   		queststatus = getPlayerStorageValue(cid,503039)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a ultimate armor.")
   			broadcastMessage (""..playername.." completed a Ultimate Quest! ", 19)
   			doPlayerAddItem(cid,8884,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5054 then
   		queststatus = getPlayerStorageValue(cid,503049)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a ultimate armor.")
   			broadcastMessage (""..playername.." completed a Ultimate Quest! ", 19)
   			doPlayerAddItem(cid,11355,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	end
   	return 1
end


