-- titan chests

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

   	if item.uid == 9091 then
   		queststatus = getPlayerStorageValue(cid,90902)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Earthborn Titan Armor.")
   			broadcastMessage (""..playername.." completed a Titan Quest! ", 19)
   			doPlayerAddItem(cid,8882,1)
   			setPlayerStorageValue(cid,90902,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 9092 then
   		queststatus = getPlayerStorageValue(cid,90902)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Windborn Colossus Armor.")
   			broadcastMessage (""..playername.." completed a Titan Quest! ", 19)
   			doPlayerAddItem(cid,8883,1)
   			setPlayerStorageValue(cid,90902,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 9093 then
   		queststatus = getPlayerStorageValue(cid,90902)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Fireborn Giant Armor.")
   			broadcastMessage (""..playername.." completed a Titan Quest! ", 19)
   			doPlayerAddItem(cid,8881,1)
   			setPlayerStorageValue(cid,90902,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	end
   	return 1
end