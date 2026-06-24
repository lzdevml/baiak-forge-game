-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 10109 then
           queststatus = getPlayerStorageValue(cid,8581)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Prismatic Helmet.")
               doPlayerAddItem(cid,12914,1)
               setPlayerStorageValue(cid,8581,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10110 then
           queststatus = getPlayerStorageValue(cid,8581)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Prismatic Armor.")
               doPlayerAddItem(cid,12906,1)
               setPlayerStorageValue(cid,8581,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end