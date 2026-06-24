-- vip chests

function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 31029 then
   		queststatus = getPlayerStorageValue(cid,31029)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Demon Armor.")
   			doPlayerAddItem(cid,2494,1)
   			setPlayerStorageValue(cid,31029,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 31030 then
   		queststatus = getPlayerStorageValue(cid,31029)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Magic Sword.")
   			doPlayerAddItem(cid,2400,1)
   			setPlayerStorageValue(cid,31029,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	elseif item.uid == 31031 then
   		queststatus = getPlayerStorageValue(cid,31029)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Stonecutter Axe.")
   			doPlayerAddItem(cid,2431,1)
   			setPlayerStorageValue(cid,31029,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	elseif item.uid == 31032 then
   		queststatus = getPlayerStorageValue(cid,31029)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a 200k.")
   			doPlayerAddItem(cid,2160,20)
   			setPlayerStorageValue(cid,31029,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end		

	end
   	return 1
end


