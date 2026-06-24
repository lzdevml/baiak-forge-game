-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 8587 then
           queststatus = getPlayerStorageValue(cid,8566)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Cowl.")
               doPlayerAddItem(cid,13406,1)
               setPlayerStorageValue(cid,8566,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8588 then
           queststatus = getPlayerStorageValue(cid,8566)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Breeches.")
               doPlayerAddItem(cid,13407,1)
               setPlayerStorageValue(cid,8566,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8589 then
           queststatus = getPlayerStorageValue(cid,8566)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Eldritch Hood.")
               doPlayerAddItem(cid,13425,1)
               setPlayerStorageValue(cid,8566,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 8590 then
           queststatus = getPlayerStorageValue(cid,8566)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have Eldritch Armor")
               doPlayerAddItem(cid,13427,1)
               setPlayerStorageValue(cid,8566,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end