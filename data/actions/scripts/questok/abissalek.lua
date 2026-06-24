-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 10106 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Hat.")
               doPlayerAddItem(cid,12903,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10108 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Coat.")
               doPlayerAddItem(cid,12904,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10112 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Legs.")
               doPlayerAddItem(cid,12905,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10114 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Boots")
               doPlayerAddItem(cid,12852,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10110 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Spellbook.")
               doPlayerAddItem(cid,12906,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end

    else
        return 0
       end

       return 1
end