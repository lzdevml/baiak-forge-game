-- Wrath of the Emperor chests

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

   	if item.uid == 5058 then
   		queststatus = getPlayerStorageValue(cid,30302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found arcane staff.")
   			broadcastMessage (""..playername.." completed a Pits of Inferno Quest! ", 19)
   			doPlayerAddItem(cid,2453,1)
   			setPlayerStorageValue(cid,30302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5059 then
   		queststatus = getPlayerStorageValue(cid,30302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found an avanger.")
   			broadcastMessage (""..playername.." completed a Pits of Inferno Quest! ", 19)
   			doPlayerAddItem(cid,6528,1)
   			setPlayerStorageValue(cid,30302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5060 then
   		queststatus = getPlayerStorageValue(cid,30302)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found an arbalest.")
   			broadcastMessage (""..playername.." completed a Pits of Inferno Quest! ", 19)
   			doPlayerAddItem(cid,5803,1)
   			setPlayerStorageValue(cid,30302,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	end
   	return 1
end