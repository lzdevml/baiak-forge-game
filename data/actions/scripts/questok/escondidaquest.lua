-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)
       if item.uid == 31019 then
           queststatus = getPlayerStorageValue(cid,8679)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Refine Stone.")
               doPlayerAddItem(cid,8306,1)
               setPlayerStorageValue(cid,8679,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end

       elseif item.uid == 31020 then
           queststatus = getPlayerStorageValue(cid,8679)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a 5 Diamond Coins.")
               doPlayerAddItem(cid,12910,1)
               setPlayerStorageValue(cid,10559,5)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 31021 then
           queststatus = getPlayerStorageValue(cid,8679)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Autoloot Doll.")
               doPlayerAddItem(cid,13131,1)
               setPlayerStorageValue(cid,8679,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end