--- Made by Mazen ---
function onUse(cid, item, fromPosition, itemEx, toPosition)

       if item.uid == 12901 then
           queststatus = getPlayerStorageValue(cid,50090)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Demon Legs.")
               doPlayerAddItem(cid,2495,1)
			   doPlayerAddOutfit(cid, 541, 3) -- Yalaharian ADDON FEMALE
            doPlayerAddOutfit(cid, 542, 3) -- Yalaharian ADDON MALE
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a missão e recebeu a Roupa Demon.")
                          setPlayerStorageValue(cid,50090,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 12902 then
           queststatus = getPlayerStorageValue(cid,50090)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Rainbow Shield.")
               doPlayerAddItem(cid,8905,1)
			    doPlayerAddOutfit(cid, 541, 3) -- Yalaharian ADDON FEMALE
            doPlayerAddOutfit(cid, 542, 3) -- Yalaharian ADDON MALE
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a missão e recebeu a Roupa Demon.")
                          setPlayerStorageValue(cid,50090,1)
           else
                           doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
           end
       elseif item.uid == 12903 then
           queststatus = getPlayerStorageValue(cid,50090)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Spellbook of Ancient Arcana.")
               doPlayerAddItem(cid,13375,1)
			    doPlayerAddOutfit(cid, 541, 3) -- Yalaharian ADDON FEMALE
            doPlayerAddOutfit(cid, 542, 3) -- Yalaharian ADDON MALE
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a missão e recebeu a Roupa Demon.")
                              setPlayerStorageValue(cid,50090,1)
           else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
        end
       elseif item.uid == 12904 then
           queststatus = getPlayerStorageValue(cid,50090)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Thorn Spitter.")
               doPlayerAddItem(cid,12984,1)
			    doPlayerAddOutfit(cid, 541, 3) -- Yalaharian ADDON FEMALE
            doPlayerAddOutfit(cid, 542, 3) -- Yalaharian ADDON MALE
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você finalizou a missão e recebeu a Roupa Demon.")
			 setPlayerStorageValue(cid,50090,1)
                else
               doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
        end
    end
       return 1
end