function onSay(cid, words, param, channel)
    if param == "" then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Enter the correct command.")
        return true
    elseif param == "active" then
        local activequery = db.getResult("SELECT * FROM `trade_off` WHERE `player` = "..getPlayerGUID(cid)..";")
        if activequery:getID() == -1 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have no active offers.")
            return true
        end
        local str = "~~ [My Active Offers] ~~\n\n"
        repeat
            local item = {id = activequery:getDataInt("item_id"), name = activequery:getDataString("item_name"), count = activequery:getDataInt("item_count")}
            local cost = {id = activequery:getDataInt("cost_id"), name = activequery:getDataString("cost_name"), count = activequery:getDataInt("cost_count")}
            local offerdate = activequery:getDataString("date")
            str = str .. "ID: "..activequery:getDataInt("id").." (on "..offerdate:sub(1,10).." at "..offerdate:sub(12,20)..")\n"
            str = str .. "Item for sale:\n".. item.count.." "..(item.count > 1 and getItemPluralNameById(item.id) or item.name).."\n"
            str = str .. "Cost:\n"..(cost.count).." "..(cost.count > 1 and (paymethod == 1 and "gold coins" or getItemPluralNameById(cost.id)) or cost.name).."\n\n"
        until not activequery:next()
        activequery:free()
        doShowTextDialog(cid, 1951, str)
        return true
    elseif param == "balance" then
        local balance = getPlayerTradeOffBalance(cid)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Trade Off currently balance: "..balance.." gold coins")
        return true
    elseif param == "withdraw" then
        local balance = getPlayerTradeOffBalance(cid)
        if balance == 0 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You do not have gold coins to be withdrawn.")
            return true
        end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received "..balance.." gold coins!")
        doPlayerAddMoney(cid, balance)
        setPlayerTradeOffBalance(getPlayerGUID(cid), -balance)
        return true
    end
    local t, p = string.explode(param, ","), getPlayerPosition(cid)
    if (t[1] == "add") then
        local checkcontainer, itemInContainer, siteContainer = false, {}, {}
        if TRADE_OFF.sendOfferInPz then    
            if(not getTilePzInfo(p)) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You must be inside PZ area when you add offerts.")
                return true
            end
        end
        if getPlayerLevel(cid) < TRADE_OFF.level_required then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You need level "..TRADE_OFF.level_required.." or higher to add an offer.")
            return true
        end
        if (not t[2]) or t[2] == "" then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Enter the correct command.")
            return true
        end
        local tradeitem = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
        if tradeitem.itemid == 0 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Put an item in slot arrow.")
            return true
        end
        if isInArray(TRADE_OFF.blocked_items, tradeitem.itemid) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Item is not allowed to be traded offline.")
            return true
        end
        if isInArray(TRADE_OFF.vipContainers, tradeitem.itemid) then
            if getContainerSlotsFree(tradeitem.uid) ~= getContainerCap(tradeitem.uid) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not sell special containers with something inside.")
                return true
            end
        end
        if isItemContainer(tradeitem.itemid) and not isInArray(TRADE_OFF.vipContainers, tradeitem.itemid) then
            if getContainerSlotsFree(tradeitem.uid) == getContainerCap(tradeitem.uid) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not sell empty container items.")
                return true
            elseif getContainerSlotsFree(tradeitem.uid) == (getContainerCap(tradeitem.uid)-1) then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not sell only a item inside a container. Sell outside the container instead.")
                return true
            else
                local checkItems = checkContainerItems(tradeitem.uid)
                if not checkItems then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not sell different items inside a container.")
                    return true
                end
                local containerItems = getContainerItems(tradeitem.uid)
                itemInContainer.id = containerItems[1].itemid
                if not isItemStackable(itemInContainer.id) then
                    itemInContainer.count = #containerItems
                    siteContainer = {itemInContainer.count <= 8 and TRADE_OFF.containers[1] or 1988, getContainerSize(tradeitem.uid)}
                else
                    local sum,checktype = 0, true
                    for index, info in pairs(containerItems) do
                        if info.type == 100 then
                            sum = sum + info.type
                        else
                            checktype = false
                            break
                        end
                    end
                    if not checktype then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not sell this type of item in an amount less than 100 inside a container.")
                        return true
                    end
                    siteContainer = {getContainerSize(tradeitem.uid) <= 8 and TRADE_OFF.containers[1] or 1988, getContainerSize(tradeitem.uid)}  
                    itemInContainer.count = sum
                end
                checkcontainer = true
            end
        end
        local price, paymethod, checkStackable = t[2], -1, false
        if (not tonumber(price)) then
            paymethod = 2
            price = tostring(price):lower()
            local checkItemName = ExistItemByName(price)
            if not checkItemName then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Item '"..price.."' does not exists.")
                return true
            end
            local changeritem = getItemIdByName(price)
            if changeritem == tradeitem.itemid then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not sell a item for the same item.")
                return true
            end    
            if isItemStackable(changeritem) then
                if (not t[3] or t[3] == "" or not tonumber(t[3]) or (tonumber(t[3]) <= 0)) then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Please set the amount of the exchange item.")
                    return true
                end            
                checkStackable = true
            else
                if t[3] then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not define quantity for a non-stackable item.")
                    return true
                end
            end
        else
            paymethod = 1
            if tonumber(price) <= 0 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Enter the correct price.")
                return true
            end
        end
        local query = db.getResult("SELECT * FROM `trade_off` WHERE `player` = "..getPlayerGUID(cid)..";")
        if query:getID() ~= -1 then
            if query:getRows(true) >= TRADE_OFF.maxOffersPerPlayer then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have reached the maximum of "..(TRADE_OFF.maxOffersPerPlayer).." active offers.")
                return true
            end        
        end
        local item_id = not checkcontainer and tradeitem.itemid or itemInContainer.id
        local item_name = getItemNameById(item_id)
        local item_count = not checkcontainer and (isItemStackable(item_id) and tradeitem.type or 1) or itemInContainer.count
        
        local cost = (paymethod == 1 and getMoneyInfo(tonumber(price)) or {})
        local cost_id = (paymethod == 1 and cost.id or getItemIdByName(price))
        local cost_name = (paymethod == 1 and "gold coins" or capitalizeAll(getItemNameById(cost_id)))
        local cost_count = (paymethod == 1 and cost.price or (not checkStackable and 1 or tonumber(t[3])))
        
        local offer_info = item_count.." "..(item_count > 1 and getItemPluralNameById(item_id) or item_name).." for "
        local cost_info = (cost_count).." "..(cost_count > 1 and (paymethod == 1 and "gold coins" or getItemPluralNameById(cost_id)) or cost_name)
        
        local containerToSite = checkcontainer and siteContainer or {0,0}
        db.executeQuery("INSERT INTO `trade_off`(`player`,`item_id`,`item_name`,`item_count`,`cost_id`,`cost_name`,`cost_count`,`date`,`container`,`slots`) VALUES ("..getPlayerGUID(cid)..","..item_id..","..capitalizeAll(db.escapeString(item_name))..","..item_count..","..cost_id..","..db.escapeString(cost_name)..","..cost_count..",DATE_FORMAT(NOW(), '%d/%m/%Y %T'),"..containerToSite[1]..","..containerToSite[2]..")")
        doRemoveItem(tradeitem.uid)
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You added a new offer successfully!\nGood sales!")  
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[Trade Off]:\nNew offer added:\n-> "..offer_info..""..cost_info)
    elseif (t[1] == "buy") then
        if not (t[2] and tonumber(t[2])) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Enter the correct command.")
            return true
        end
        local buyquery = db.getResult("SELECT * FROM `trade_off` WHERE `id` = "..tonumber(t[2])..";")
        if buyquery:getID() == -1 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Auction ID not found.")
            return true
        end
        local paymethod = 2
        local seller = buyquery:getDataInt("player")
        local item = {id = buyquery:getDataInt("item_id"), name = buyquery:getDataString("item_name"), count = buyquery:getDataInt("item_count")}
        local cost = {id = buyquery:getDataInt("cost_id"), name = buyquery:getDataString("cost_name"), count = buyquery:getDataInt("cost_count")}
        buyquery:free()
        if seller == getPlayerGUID(cid) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You can not buy your own items. If you prefer, remove the offer instead.")
            return true
        end
        if isInArray({2148, 2152, 2160}, cost.id) then
            paymethod = 1
        end
        local cost_info = (cost.count).." "..(cost.count > 1 and (paymethod == 1 and "gold coins" or getItemPluralNameById(cost.id)) or cost.name)
        if paymethod == 1 then
            if getPlayerMoney(cid) < cost.count then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You do not have "..cost_info..".")
                doSendMagicEffect(p, CONST_ME_POFF)
                return true
            end
        else
            if getPlayerItemCount(cid, cost.id) < cost.count then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You do not have "..cost_info..".")
                doSendMagicEffect(p, CONST_ME_POFF)
                return true
            end
        end
        local checking_backpack = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
        if (isItemStackable(item.id) and (item.count <= 100)) or ((not isItemStackable(item.id)) and (item.count == 1)) then
            local needed_cap = getItemWeightById(item.id, item.count, false)
            if getPlayerFreeCap(cid) < needed_cap then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You need "..round(needed_cap, 2).." oz free capacity to receive this item.")
                doSendMagicEffect(p, CONST_ME_POFF)
                return true
            end
            if checking_backpack.uid == 0 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "There is not enough room to receive this item.")
                doSendMagicEffect(p, CONST_ME_POFF)
                return true
            else
                local slots_free = getAllContainerFree(checking_backpack.uid)
                if slots_free == 0 then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "There is not enough room to receive this item.")
                    doSendMagicEffect(p, CONST_ME_POFF)
                    return true
                end
            end
            doPlayerAddItem(cid, item.id, item.count)
        else
            sendTradeOffMail(getPlayerName(cid), item.id, item.count, cid)
        end
        local sellername = getPlayerNameByGUID(seller)
        if paymethod == 1 then
            doPlayerRemoveMoney(cid, cost.count) 
            setPlayerTradeOffBalance(seller, cost.count)
        else
            doPlayerRemoveItem(cid, cost.id, cost.count)
            sendTradeOffMail(sellername, cost.id, cost.count)
        end
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received ".. item.count.." "..(item.count > 1 and getItemPluralNameById(item.id) or item.name).." for "..cost_info..".")
        if isPlayer(getPlayerByName(sellername)) then
            doPlayerSendTextMessage(getPlayerByName(sellername), MESSAGE_INFO_DESCR, "[Trade OFF]: You have completed an offer!")
        end
        db.executeQuery("DELETE FROM `trade_off` WHERE `id` = "..tonumber(t[2])..";")
    elseif(t[1] == "remove") then
        if (not(t[2] and tonumber(t[2]))) or t[2] == "" then
             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Enter the correct command.")
            return true
        end
        local removequery = db.getResult("SELECT * FROM `trade_off` WHERE `id` = "..tonumber(t[2])..";")
        if removequery:getID() == -1 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Auction ID not found.")
            return true
        elseif removequery:getDataInt("player") ~= getPlayerGUID(cid) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You are not the offer's owner.")
        elseif removequery:getDataInt("player") == getPlayerGUID(cid) then
            local item = {id = removequery:getDataInt("item_id"), name = removequery:getDataString("item_name"), count = removequery:getDataInt("item_count")}
            sendTradeOffMail(getPlayerName(cid), item.id, item.count)
            db.executeQuery("DELETE FROM `trade_off` WHERE `id` = "..tonumber(t[2])..";")
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You deleted the offer successfully! Your items were sent to your depot.")
        end
        removequery:free() 
    elseif(t[1] == "info") then
        if (not(t[2] and tonumber(t[2]))) or t[2] == "" then
             doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Enter the correct command.")
            return true
        end
        local infoquery = db.getResult("SELECT * FROM `trade_off` WHERE `id` = "..tonumber(t[2])..";")
        if infoquery:getID() == -1 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Auction ID not found.")
            return true
        end
        local seller = getPlayerNameByGUID(infoquery:getDataInt("player"))
        local checkseller = isPlayer(getPlayerByName(seller)) and "[online]" or "[offline]"
        local item = {id = infoquery:getDataInt("item_id"), name = infoquery:getDataString("item_name"), count = infoquery:getDataInt("item_count")}
        local cost = {id = infoquery:getDataInt("cost_id"), name = infoquery:getDataString("cost_name"), count = infoquery:getDataInt("cost_count")}
        infoquery:free()
        local str = "Auction ID ["..tonumber(t[2]).."] Details\n\n"
        str = str .. "Seller: "..seller.." "..checkseller.."\n\n".."Item for sale:\n".. item.count.." "..(item.count > 1 and getItemPluralNameById(item.id) or item.name).."\n\n"
        str = str .. "Cost:\n"..(cost.count).." "..(cost.count > 1 and (paymethod == 1 and "gold coins" or getItemPluralNameById(cost.id)) or cost.name)
        doPlayerPopupFYI(cid, str)
    end
    return true
end