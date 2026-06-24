local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)       
        
        
-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end
local topic = {}
local stoGreetMessage = 21474

function greetCallback(cid)    
    local greetMessage = getPlayerStorageValue(cid, stoGreetMessage) ~= -1 and doCutText(getPlayerStorageValue(cid, stoGreetMessage), "*") or false
    if getPlayerStorageValue(cid, stoGreetMessage) ~= -1 then
            msg = greetMessage[1]
            addEvent(function()
                    selfSay(greetMessage[2], cid)
            end, 100)
            topic[cid] = 1
    else
            msg = "Use the Imbuiment Machine on any item."
            topic[cid] = 0
    end

    npcHandler:setMessage(MESSAGE_GREET, msg)
    
    return true
end

function creatureSayCallback(cid, _type, msg)
    if msgcontains(msg, "hi") then
        local greetMessage = getPlayerStorageValue(cid, stoGreetMessage) ~= -1 and doCutText(getPlayerStorageValue(cid, stoGreetMessage), "*") or false
        if getPlayerStorageValue(cid, stoGreetMessage) ~= -1 then
            msg = greetMessage[1]
            addEvent(function()
                    selfSay(greetMessage[2], cid)
            end, 100)
            topic[cid] = 1
            return true
        else
            selfSay("Use the Imbuiment Machine on any item.", cid)
            topic[cid] = 0
            return true
        end
    end

    if getPlayerStorageValue(cid, Bonus_storage) ~= -1 then
        -- Imbuement Type
        if getImbueChannelTopic(cid) == 0 then
            if selectImbueType(cid,msg) then
                local Bonus = msg

                  
                if getPlayerStorageValue(cid, 854827) ~= '' then
                    local ItemBonusList = doCutText(getPlayerStorageValue(cid, 854827),"*")
                    for i, v in pairs (ItemBonusList) do
                        texto = ItemBonusList[i]
                        if texto ~= '' then
                           id = tonumber(doCutText(texto,",")[1])
                           --doBroadcastMessage("["..id.."] " .. texto)
                        end
                        --doBroadcastMessage("ID = ".. id .. " Bonus = " .. getBonusId(Bonus))
                        if getBonusId(Bonus) == id then
                           doPlayerSendChannelMessage(cid, "","This item already has this bonus!", TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)
                           return true
                        end
                    end
                end               
                selfSay(imbu_Bonus[Bonus].info, cid)   
                selfSay("Select imbuement level: {Basic} ("..imbu_Bonus[Bonus].levelsInfo[1].."), {Intricate} ("..imbu_Bonus[Bonus].levelsInfo[2]..") or {Powerful} ("..imbu_Bonus[Bonus].levelsInfo[3]..").",cid) -- .. NivelBonus .. ".", TALKTYPE_CHANNEL_O, IMBUI_CHANNEL_ID)              
                setPlayerStorageValue(cid, Imbu_channelTopicStorage, "1, ".. doCutStorage(cid, Imbu_channelTopicStorage, ",")[2] .."," .. Bonus)
            else
                selfSay("Select a valid bonus!", cid)
            end  
        elseif getImbueChannelTopic(cid) == 1 then
            --if selectImbueType_Nivel(doCutStorage(cid, Imbu_channelTopicStorage, ",")[2], msg) then
            if selectImbueType_Nivel(doCutStorage(cid, Imbu_channelTopicStorage, ",")[3], msg) then
                local probability = getProbabilityImbuement(msg)
                local successPrice = getSuccessPrice(msg)
                selfSay("{Confirm} imbuement | Probability of success: ".. probability .. "% | Price: ".. milharFormat(preco) .." gold coins.", cid)
                selfSay("{Protect} imbuement | Probability of sucess: 100% | Price: ".. milharFormat(preco + successPrice) .." gold coins. ", cid)
                selfSay("Required items: " .. itemsList .. ".", cid)
                setPlayerStorageValue(cid, Imbu_channelTopicStorage, "2, ".. doCutStorage(cid, Imbu_channelTopicStorage, ",")[2] .. ",".. doCutStorage(cid, Imbu_channelTopicStorage, ",")[3] ..",".. msg ..",".. preco .. ".") -- Topic, Imbuement, Tipo de imbuement
                if getPlayerImbuVoucher(cid) then
                    selfSay("{Voucher} imbuiment to use your VOUCHER and get FREE Imbuiment.",cid)
                end                  
            else
                selfSay("This level is not valid.", cid)   
            end
        elseif getImbueChannelTopic(cid) == 2 then          
            local imbued_Item = tonumber(doCutStorage(cid, Imbu_channelTopicStorage, ",")[2])
            -- ENCANTAMENTO: ------------------------------------------------------------
            function EnchantItem_Imbuement()
                doPlayerRemoveItem(cid, imbued_Item,1) 
                local oldDesc = getPlayerStorageValue(cid, 854827)
                local Bonusid = getBonusId(doCutStorage(cid, Imbu_channelTopicStorage, ",")[3])
                local BonusNivel = doCutStorage(cid, Imbu_channelTopicStorage, ",")[4]
                local bag = doPlayerAddItem(cid, 6104)
                local newItem = doAddContainerItem(bag, imbued_Item)

                local newDesc = ''
               
                if oldDesc ~= '' then
                    newDesc = oldDesc .. "\n*" .. Bonusid .. "," .. BonusNivel .. "," .. Imbue_time
                else
                    newDesc = "*" .. Bonusid .. "," .. BonusNivel .. "," .. Imbue_time
                end

                doItemSetAttribute(newItem, "bonus", newDesc)
                doItemSetAttribute(newItem, "code", generateSerial())
                selfSay("Item successfully imbued!", cid)
                doSendMagicEffect(getPlayerPosition(cid),  12)
                resetImbuement(cid) 
            end


            if getPlayerItemCount(cid, imbued_Item) == 1 then
                local money = tonumber(doCutStorage(cid, Imbu_channelTopicStorage, ",")[5])
                local sucessPrice = tonumber(getSuccessPrice(doCutStorage(cid, Imbu_channelTopicStorage, ",")[4]))
               
                if msg == "voucher" and removeImbuVoucher(cid) then                  
                    EnchantItem_Imbuement() 
                    return true
                end
                --doBroadcastMessage(sucessPrice)
                if getPlayerMoney(cid) >=  money then
                    if msg == "confirm" then
                        if confirmImbue(cid) and doPlayerRemoveMoney(cid, tonumber(doCutStorage(cid, Imbu_channelTopicStorage, ",")[5])) then  
                            local probability = getProbabilityImbuement(doCutStorage(cid, Imbu_channelTopicStorage, ",")[4])
                            local numberSorted = math.random(1,100)
                            --doBroadcastMessage(numberSorted)               
                            if numberSorted <= probability then
                                EnchantItem_Imbuement()
                            else
                                selfSay("Imbuement failed!", cid)
                                resetImbuement(cid) 
                            end
                            resetImbuement(cid) 
                        else
                            selfSay("You do not have the necessary items!", cid)  
                        end
                    elseif msg == "protect" and getPlayerMoney(cid) >= (money+sucessPrice) then
                        if (confirmImbue(cid) and doPlayerRemoveMoney(cid, money+sucessPrice) or getPlayerAccess(cid) >= 5) then
                            EnchantItem_Imbuement()
                        else
                            selfSay("You do not have the necessary items!", cid)  
                        end                    
                    else
                        selfSay("Incorrect param...", cid)
                    end
                else
                    selfSay("You do not have enough money.", cid)  
                end
            else
                selfSay("You can only have 1x ".. getItemNameById (imbued_Item) .." inside backpack to imbue it.", cid)  
            end
        end
    end

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)        
npcHandler:addModule(FocusModule:new())