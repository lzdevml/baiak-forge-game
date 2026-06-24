-- vip chests

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

   	if item.uid == 5061 then
   		queststatus = getPlayerStorageValue(cid,50302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a crystalline axe.")
   			doPlayerAddItem(cid,12918,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5062 then
   		queststatus = getPlayerStorageValue(cid,50302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a crystalline sword.")
   			doPlayerAddItem(cid,12917,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	elseif item.uid == 5064 then
   		queststatus = getPlayerStorageValue(cid,50302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a mycological mace.")
   			doPlayerAddItem(cid,12919,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	elseif item.uid == 5065 then
   		queststatus = getPlayerStorageValue(cid,50302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a mycological bow.")
   			doPlayerAddItem(cid,12921,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5063 then
   		queststatus = getPlayerStorageValue(cid,50302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a umbral spellbook.")
   			doPlayerAddItem(cid,13074,1)
   			setPlayerStorageValue(cid,50302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	end
   	return 1
end


