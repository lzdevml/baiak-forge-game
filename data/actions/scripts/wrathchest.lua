-- Wrath of the Emperor chests

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

   	if item.uid == 8081 then
   		queststatus = getPlayerStorageValue(cid,80802)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Elite Draken Helmet.")
   			broadcastMessage (""..playername.." completed a Wrath of the Emperor Quest! ", 19)
   			doPlayerAddItem(cid,12645,1)
   			setPlayerStorageValue(cid,80802,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 8082 then
   		queststatus = getPlayerStorageValue(cid,80802)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Royal Scale Robe.")
   			broadcastMessage (""..playername.." completed a Wrath of the Emperor Quest! ", 19)
   			doPlayerAddItem(cid,12643,1)
   			setPlayerStorageValue(cid,80802,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 8083 then
   		queststatus = getPlayerStorageValue(cid,80802)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Royal Draken Mail.")
   			broadcastMessage (""..playername.." Wrath of the Emperor Quest! ", 19)
   			doPlayerAddItem(cid,12642,1)
   			setPlayerStorageValue(cid,80802,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	end
   	return 1
end