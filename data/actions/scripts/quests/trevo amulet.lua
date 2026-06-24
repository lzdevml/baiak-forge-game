-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

      if item.uid == 59702 then
         queststatus = getPlayerStorageValue(cid,59702)
         if queststatus == -1 then
            doPlayerSendTextMessage(cid,22,"You have found a Trevo Lord Amulet.")
            doPlayerAddItem(cid,11393,1)
            setPlayerStorageValue(cid,59702,1)
         else
            doPlayerSendTextMessage(cid,22,"It is empty.")
         end
   else
      return 0
      end

      return 1
end   
   

