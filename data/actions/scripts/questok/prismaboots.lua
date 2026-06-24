-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 10113 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Prismatic Boots.")
               doPlayerAddItem(cid,12910,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10114 then
           queststatus = getPlayerStorageValue(cid,8578)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Boots.")
               doPlayerAddItem(cid,12852,1)
               setPlayerStorageValue(cid,8578,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end