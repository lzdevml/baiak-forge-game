-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 8580 then
           queststatus = getPlayerStorageValue(cid,8565)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Axe.")
               doPlayerAddItem(cid,13402,1)
               setPlayerStorageValue(cid,8565,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8581 then
           queststatus = getPlayerStorageValue(cid,8565)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Sword.")
               doPlayerAddItem(cid,13401,1)
               setPlayerStorageValue(cid,8565,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8582 then
           queststatus = getPlayerStorageValue(cid,8565)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Mace.")
               doPlayerAddItem(cid,13405,1)
               setPlayerStorageValue(cid,8565,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8583 then
           queststatus = getPlayerStorageValue(cid,8565)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Bow")
               doPlayerAddItem(cid,13400,1)
               setPlayerStorageValue(cid,8565,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8584 then
           queststatus = getPlayerStorageValue(cid,8565)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Rod.")
               doPlayerAddItem(cid,13403,1)
               setPlayerStorageValue(cid,8565,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8585 then
           queststatus = getPlayerStorageValue(cid,8565)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Wand.")
               doPlayerAddItem(cid,13404,1)
               setPlayerStorageValue(cid,8565,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end