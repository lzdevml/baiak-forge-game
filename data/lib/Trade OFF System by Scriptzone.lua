-- Trade OFF System by Scriptzone

TRADE_OFF = {
    sendOfferInPz = true,
    maxOffersPerPlayer = 30,
    blocked_items = {2148, 2152, 2160, 10558, 7588, 7589, 7590, 7591, 7618, 7620, 7634, 7635, 7636, 8472, 8473, 12250, 9662, 8306, 8305, 8300, 8304, 12644, 6529},
    level_required = 10,
    containers = {1993, 1988, 2002, 2004, 1998},
    vipContainers = {
        2365, -- backpack of holding 
        18394, -- crystal backpack
        20620, -- zaoan chess box
        23816, -- war backpack
        18393, -- mushroom backpack
        11394, -- feed bag
        11235, -- glooth backpack
    }
}

function sendTradeOffMail(receiverName, itemid, count, cid)
    local parcel = doCreateItemEx(2595, 1)
    local label = doAddContainerItem(parcel, 2599)
    doSetItemText(label, "Trade OFF\n"..(not cid and "completed sale" or getTownName(getPlayerTown(cid))))
    if isItemStackable(itemid) then
        if count <= 100 then
            doAddContainerItem(parcel, itemid, count)
        else
            local restitems = count % 100
            local fullslots = (count - restitems)/100
            local totalslots = restitems > 0 and (fullslots + 1) or fullslots
            local containerid = totalslots <= 8 and TRADE_OFF.containers[1] or TRADE_OFF.containers[math.random(2, #TRADE_OFF.containers)]
            local container = doCreateItemEx(containerid, 1)
            for i = 1, fullslots do
                doAddContainerItem(container, itemid, 100)
            end
            if restitems > 0 then
                doAddContainerItem(container, itemid, restitems)
            end
            doAddContainerItemEx(parcel, container)
        end
    else
        if count == 1 then
            doAddContainerItem(parcel, itemid, 1)
        else
            local container = doCreateItemEx(TRADE_OFF.containers[1], 1)
            if (count <= 8) then
                for i = 1, count do
                    doAddContainerItem(container, itemid, 1)
                end 
            elseif (count > 8 and count <= 20) then
                container = doCreateItemEx(TRADE_OFF.containers[math.random(2, #TRADE_OFF.containers)], 1)
                for i = 1, count do
                    doAddContainerItem(container, itemid, 1)
                end
            else
                local bpid = TRADE_OFF.containers[math.random(2, #TRADE_OFF.containers)]
                local restBpItems = count % 20
                local fullBps = (count - restBpItems)/20
                container = doCreateItemEx(bpid, 1)
                for bp = 1, fullBps do
                    local tmpBp = doCreateItemEx(bpid, 1)
                    for k = 1, 20 do
                        doAddContainerItem(tmpBp, itemid, 1)
                    end
                    doAddContainerItemEx(container, tmpBp)                              
                end
                if restBpItems > 1 then
                    local tmpBp = doCreateItemEx(bpid, 1)
                    doAddContainerItemEx(container, tmpBp)      
                end
            end
            doAddContainerItemEx(parcel, container)
        end
    end
    doPlayerSendMailByName(receiverName, parcel)
end

function setPlayerTradeOffBalance(player_id, balance)
    db.executeQuery("UPDATE `players` SET `tradeoff_balance` = `tradeoff_balance` + "..balance.." WHERE `id` = "..player_id..";")
end

function getPlayerTradeOffBalance(cid)
    local balancequery = db.getResult("SELECT `tradeoff_balance` FROM `players` WHERE `id` = "..getPlayerGUID(cid)..";")
    local balance = balancequery:getDataInt("tradeoff_balance")
    balancequery:free()
    return tonumber(balance)
end
