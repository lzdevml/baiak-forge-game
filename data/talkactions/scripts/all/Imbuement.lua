function onSay(cid, words, param, channel)  
   local words = string.lower(param:len() > 0 and (words .. " " .. param):lower() or words)
   if channel == IMBUI_CHANNEL_ID then      
      if getPlayerStorageValue(cid, Bonus_storage) ~= -1 then
         -- Imbuement Type
         if getImbueChannelTopic(cid) == 0 then
               if selectImbueType(cid,words) then
                  local Bonus = words
                  
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
                           doPlayerSendChannelMessage(cid, "", translate(cid, {"Esse item já possui esse bonus!", "This item already has this bonus!"}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)
                           return true
                        end
                     end
                  end
                  doPlayerSendChannelMessage(cid, "", "...", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)                  
                  doPlayerSendChannelMessage(cid, "", "Info: " ..imbu_Bonus[Bonus].info, TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)   
                  doPlayerSendChannelMessage(cid, "", "|~| Basic: "..imbu_Bonus[Bonus].levelsInfo[1].. " |~| Intricate: " .. imbu_Bonus[Bonus].levelsInfo[2] .. " |~| Powerful: " .. imbu_Bonus[Bonus].levelsInfo[3] ..".", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)  
                  
                  doPlayerSendChannelMessage(cid, "",translate(cid, {"Selecione um nivel de imbuiment:", "Select imbuement level:"}) .. " * Basic * Intricate * Powerful *",TALKTYPE_CHANNEL_O, IMBUI_CHANNEL_ID) -- .. NivelBonus .. ".", TALKTYPE_CHANNEL_O, IMBUI_CHANNEL_ID)               
                  setPlayerStorageValue(cid, Imbu_channelTopicStorage, "1, ".. doCutStorage(cid, Imbu_channelTopicStorage, ",")[2] .."," .. Bonus)
               else
                  doPlayerSendChannelMessage(cid, "","Select a valid bonus!", TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)
               end
         elseif getImbueChannelTopic(cid) == 1 then
               --if selectImbueType_Nivel(doCutStorage(cid, Imbu_channelTopicStorage, ",")[2], words) then
               if selectImbueType_Nivel(doCutStorage(cid, Imbu_channelTopicStorage, ",")[3], words) then
                  local probability = getProbabilityImbuement(words)
                  local successPrice = getSuccessPrice(words)
                  doPlayerSendChannelMessage(cid, "","...", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
                  doPlayerSendChannelMessage(cid, "","* Confirm * success: ".. probability .. "% | Price: ".. milharFormat(preco) .." gold coins. ", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
                  doPlayerSendChannelMessage(cid, "","* Protect * success: 100% | Price: ".. milharFormat(preco+successPrice) .." gold coins. ", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
                  doPlayerSendChannelMessage(cid, "", translate(cid, {"Items necessários: ", "Required items: "}) .. itemsList .. ".", TALKTYPE_CHANNEL_O, IMBUI_CHANNEL_ID)
                  setPlayerStorageValue(cid, Imbu_channelTopicStorage, "2, ".. doCutStorage(cid, Imbu_channelTopicStorage, ",")[2] .. ",".. doCutStorage(cid, Imbu_channelTopicStorage, ",")[3] ..",".. words ..",".. preco .. ".") -- Topic, Imbuement, Tipo de imbuement
                  if getPlayerImbuVoucher(cid) then
                     doPlayerSendChannelMessage(cid, "", translate(cid, {"* Voucher * para usar o seu VOUCHER e realizar um Imbuiment GRATUITO!.", "* Voucher * to use your VOUCHER and get FREE Imbuiment."}), TALKTYPE_CHANNEL_Y, IMBUI_CHANNEL_ID)
                  end

                  
               else
                  doPlayerSendChannelMessage(cid, "", translate(cid, {"Esse nível não é valido.", "This level is not valid."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)   
               end

         elseif getImbueChannelTopic(cid) == 2 then
            local words = param:len() > 0 and (words .. " " .. param):lower() or words            
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
               doPlayerSendChannelMessage(cid, "", translate(cid, {"Item imbuido com sucesso!", "Item successfully imbued!"}), TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
               doSendMagicEffect(getPlayerPosition(cid),  12)
               resetImbuement(cid) 
            end


            if getPlayerItemCount(cid, imbued_Item) == 1 then
               local money = tonumber(doCutStorage(cid, Imbu_channelTopicStorage, ",")[5])
               local sucessPrice = tonumber(getSuccessPrice(doCutStorage(cid, Imbu_channelTopicStorage, ",")[4]))
               
               if words == "voucher" and getPlayerImbuVoucher(cid) and removeImbuVoucher(cid) then                  
                  EnchantItem_Imbuement() 
                  return true
               end
               --doBroadcastMessage(sucessPrice)
               if getPlayerMoney(cid) >=  money then
                  if words == "confirm" then
                     if confirmImbue(cid) and doPlayerRemoveMoney(cid, tonumber(doCutStorage(cid, Imbu_channelTopicStorage, ",")[5])) then  
                        local probability = getProbabilityImbuement(doCutStorage(cid, Imbu_channelTopicStorage, ",")[4])
                        local numberSorted = math.random(1,100)
                        --doBroadcastMessage(numberSorted)               
                        if numberSorted <= probability then
                           EnchantItem_Imbuement()
                        else
                           doPlayerSendChannelMessage(cid, "", translate(cid, {"O imbuiment falhou!", "Imbuement failed!"}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)
                           resetImbuement(cid) 
                        end
                        resetImbuement(cid) 
                     else
                        doPlayerSendChannelMessage(cid, "", translate(cid, {"Você não possui os items necessários", "You do not have the necessary items!"}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
                     end
                  elseif words == "protect" and getPlayerMoney(cid) >= (money+sucessPrice) then
                     if (confirmImbue(cid) and doPlayerRemoveMoney(cid, money+sucessPrice) or getPlayerAccess(cid) >= 5) then
                        EnchantItem_Imbuement()
                     else
                        doPlayerSendChannelMessage(cid, "",translate(cid, {"Você não possui os items necessários", "You do not have the necessary items!"}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
                     end                    
                  else
                     doPlayerSendChannelMessage(cid, "", translate(cid, {"Você não possui dinheiro suficinete ou digitou o parâmetro incorreto.", "Incorrect param or insufficient money..."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)
                  end
               else
                  doPlayerSendChannelMessage(cid, "", translate(cid, {"Você não possui dinheiro suficiente.", "You do not have enough money."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
               end
            else
               doPlayerSendChannelMessage(cid, "", translate(cid, {"Você só pode possuir 1x ".. getItemNameById(itemPlayer) .." dentro de sua backpack para imbuir.", "You can only have 1x ".. getItemNameById(itemPlayer) .." inside backpack to imbue it."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
            end
         end
      else
         doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, translate(cid, {"Use a Imbuiment Machine em um equipamento para habilitar o chat.", "Use the Imbuement Machine on an item to enable chat."}))
      end
      return true
   else
      return false
   end
   
   return true
end
