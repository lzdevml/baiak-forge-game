-- vip chests

function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 5070 then
   		queststatus = getPlayerStorageValue(cid,50303)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Yalahari Mask.")
   			doPlayerAddItem(cid,9778,1)
   			setPlayerStorageValue(cid,50303,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
   	elseif item.uid == 5071 then
   		queststatus = getPlayerStorageValue(cid,50303)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Yalahari Armor.")
   			doPlayerAddItem(cid,9776,1)
   			setPlayerStorageValue(cid,50303,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end
	elseif item.uid == 5072 then
   		queststatus = getPlayerStorageValue(cid,50303)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Yalahari Legs.")
   			doPlayerAddItem(cid,9777,1)
   			setPlayerStorageValue(cid,50303,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end

	end
   	return 1
end


