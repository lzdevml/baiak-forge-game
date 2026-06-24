function onUse(cid, item, frompos, item2, topos)
    if item.uid == 18500  and getPlayerStorageValue(cid,60000) == -1 and getPlayerStorageValue(cid,18501) == -1 and getPlayerStorageValue(cid,18502) == -1 and getPlayerStorageValue(cid,18503) == -1 and getPlayerStorageValue(cid,18504) == -1  then
            doPlayerSendTextMessage(cid,25,"You have found a item.")
            doPlayerAddItem(cid,7424,1)            
            setPlayerStorageValue(cid,18500,1)
        else
            doPlayerSendTextMessage(cid,25,"It is empty.")
        end
    end
    return true


function onUse(cid, item, frompos, item2, topos)
    if item.uid == 18501 and getPlayerStorageValue(cid,18500) == -1 and getPlayerStorageValue(cid,18501) == -1 and getPlayerStorageValue(cid,18502) == -1 and getPlayerStorageValue(cid,18503) == -1 and getPlayerStorageValue(cid,18504) == -1  then
            doPlayerSendTextMessage(cid,25,"You have found a item.")
            doPlayerAddItem(cid,7417,1)
            setPlayerStorageValue(cid,18501,1)
        else
            doPlayerSendTextMessage(cid,25,"It is empty.")
        end
    end
    return true
end


function onUse(cid, item, frompos, item2, topos)
    if item.uid == 18502 and getPlayerStorageValue(cid,18500) == -1 and getPlayerStorageValue(cid,18501) == -1 and getPlayerStorageValue(cid,18502) == -1 and getPlayerStorageValue(cid,18503) == -1 and getPlayerStorageValue(cid,18504) == -1  then
            doPlayerSendTextMessage(cid,25,"You have found a item.")
            doPlayerAddItem(cid,7450,1)
             setPlayerStorageValue(cid,18502,1)
        else
            doPlayerSendTextMessage(cid,25,"It is empty.")
        end
    end
    return true
end


function onUse(cid, item, frompos, item2, topos)
    if item.uid == 18503 and getPlayerStorageValue(cid,18500) == -1 and getPlayerStorageValue(cid,18501) == -1 and getPlayerStorageValue(cid,18502) == -1 and getPlayerStorageValue(cid,18503) == -1 and getPlayerStorageValue(cid,18504) == -1  then
           doPlayerSendTextMessage(cid,25,"You have found a item.")
           doPlayerAddItem(cid,7420,1)
           setPlayerStorageValue(cid,60003,1)
        else
            doPlayerSendTextMessage(cid,25,"It is empty.")
        end
    end
    return true
end

function onUse(cid, item, frompos, item2, topos)
    if item.uid == 18504 and getPlayerStorageValue(cid,18500) == -1 and getPlayerStorageValue(cid,18501) == -1 and getPlayerStorageValue(cid,18502) == -1 and getPlayerStorageValue(cid,18503) == -1 and getPlayerStorageValue(cid,18504) == -1  then
		
            doPlayerSendTextMessage(cid,25,"You have found a item.")
           doPlayerAddItem(cid,8854,1)
             setPlayerStorageValue(cid,18504,1)
        else
            doPlayerSendTextMessage(cid,25,"It is empty.")
        end
    end
    return true
end