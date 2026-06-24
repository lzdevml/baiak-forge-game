-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 10105 then
           queststatus = getPlayerStorageValue(cid,8577)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Prismatic Helmet.")
               doPlayerAddItem(cid,12907,1)
               setPlayerStorageValue(cid,8577,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 10106 then
           queststatus = getPlayerStorageValue(cid,8577)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Gill Gugel.")
               doPlayerAddItem(cid,12903,1)
               setPlayerStorageValue(cid,8577,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
    else
        return 0
       end

       return 1
end