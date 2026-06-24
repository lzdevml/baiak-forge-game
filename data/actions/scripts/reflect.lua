-- vip chests

function onUse(cid, item, fromPosition, itemEx, toPosition)

   	if item.uid == 58192 then
   		queststatus = getPlayerStorageValue(cid,51410)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have found a Reflect Eye.")
   			doPlayerAddItem(cid,12826,1)
   			setPlayerStorageValue(cid,51410,1)
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"It is empty.")
   		end

	end
   	return 1
end


