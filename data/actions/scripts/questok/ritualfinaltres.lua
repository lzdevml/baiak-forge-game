-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 8591 then
           queststatus = getPlayerStorageValue(cid,8590)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Folio.")
               doPlayerAddItem(cid,13408,1)
               setPlayerStorageValue(cid,8590,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8592 then
           queststatus = getPlayerStorageValue(cid,8590)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Tome.")
               doPlayerAddItem(cid,13410,1)
               setPlayerStorageValue(cid,8590,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8593 then
           queststatus = getPlayerStorageValue(cid,8590)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Shield.")
               doPlayerAddItem(cid,13426,1)
               setPlayerStorageValue(cid,8590,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8594 then
           queststatus = getPlayerStorageValue(cid,8590)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have Eldritch Quiver")
               doPlayerAddItem(cid,13409,1)
               setPlayerStorageValue(cid,8590,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end