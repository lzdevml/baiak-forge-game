-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 10111 then
           queststatus = getPlayerStorageValue(cid,8680)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Prismatic legs.")
               doPlayerAddItem(cid,12909,1)
               setPlayerStorageValue(cid,8680,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10112 then
           queststatus = getPlayerStorageValue(cid,8680)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill legs.")
               doPlayerAddItem(cid,12905,1)
               setPlayerStorageValue(cid,8680,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end