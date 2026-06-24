-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 10107 then
           queststatus = getPlayerStorageValue(cid,8580)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Prismatic Armor.")
               doPlayerAddItem(cid,12908,1)
               setPlayerStorageValue(cid,8580,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10108 then
           queststatus = getPlayerStorageValue(cid,8580)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Coat.")
               doPlayerAddItem(cid,12904,1)
               setPlayerStorageValue(cid,8580,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end