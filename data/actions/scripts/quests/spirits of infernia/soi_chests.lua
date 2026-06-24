function onUse(cid, item, fromPosition, itemEx, toPosition)
       
        if item.uid == 3000 then
                queststatus = getPlayerStorageValue(cid,3000)
                if queststatus == -1 then
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Mount Doll.")
                        doPlayerAddItem(cid,9693,1)
                        setPlayerStorageValue(cid,3000,1)
                        doSendMagicEffect(getCreaturePosition(cid), 49)
                else
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
                end    
        end
       
        if item.uid == 3001 then
                queststatus = getPlayerStorageValue(cid,3001)
                if queststatus == -1 then
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Spirit Doll.")
                        doPlayerAddItem(cid,10063,1)
                        setPlayerStorageValue(cid,3001,1)
                        doSendMagicEffect(getCreaturePosition(cid), 49)
                else
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
                end    
        end
       
        if item.uid == 3002 then
                queststatus = getPlayerStorageValue(cid,3002)
                if queststatus == -1 then
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Golden Boots.")
                        doPlayerAddItem(cid,2646,1)
                        setPlayerStorageValue(cid,3002,1)
                        doSendMagicEffect(getCreaturePosition(cid), 49)
                else
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
                end    
        end
       
       
        if item.uid == 3003 then
                queststatus = getPlayerStorageValue(cid,3003)
                if queststatus == -1 then
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Addon Doll.")
                        doPlayerAddItem(cid,8982,1)
                        setPlayerStorageValue(cid,3003,1)
                        doSendMagicEffect(getCreaturePosition(cid), 49)
                else
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
                end    
        end
       
        if item.uid == 3004 then
                queststatus = getPlayerStorageValue(cid,3004)
                if queststatus == -1 then
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Winged Helmet.")
                        doPlayerAddItem(cid,2474,1)
                        setPlayerStorageValue(cid,3004,1)
                        doSendMagicEffect(getCreaturePosition(cid), 49)
                else
                        doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
                end    
        end
       
       
       
       
end