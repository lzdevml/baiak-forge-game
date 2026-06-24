local t = {
--  [uniqueID] = {vocs = {vocationIDs}, items = {itemIDs}}
    [18500] = {vocs = {1, 2, 3, 4, 5, 6, 7, 8}, items = {7424}}, -- mages
    [18501] = {vocs = {1, 2, 3, 4, 5, 6, 7, 8}, items = {7417}}, -- sword ~ knights
    [18502] = {vocs = {1, 2, 3, 4, 5, 6, 7, 8}, items = {7450}}, -- club ~ knights
    [18503] = {vocs = {1, 2, 3, 4, 5, 6, 7, 8}, items = {7420}}, -- axe ~ knights
    [18504] = {vocs = {1, 2, 3, 4, 5, 6, 7, 8}, items = {8854}} -- paladins
}

function onUse(cid, item, fromPos, toPos)
    storage = 54321
    u = t[item.uid]
    
    if not u then return false end
        if isInArray(u.vocs, getPlayerVocation(cid)) then
            if getPlayerStorageValue(cid, storage) < 1 then
                setPlayerStorageValue(cid, storage, 1)
                for i = 1, #u.items do
                    doPlayerAddItem(cid, u.items[i], 1)
                end
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Você recebeu a sua arma!.')
            else
                doPlayerSendCancel(cid, 'Você já pegou a sua arma.')
            end
        else
            doPlayerSendCancel(cid, 'Your vocation is not allowed to do this quest.')
        end
    
    return true
end
