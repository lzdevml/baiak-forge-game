-- Prey System by Scriptzone
local channelTopic = {}

function onSay(cid, words, param, channel)
    local words = param:len() > 0 and (words .. " " .. param):lower() or words
    if string.match(words, "%p") and channel == PREY_CHANNEL_ID then
        return true
    end
    if channel == PREY_CHANNEL_ID then
        if ExistSpellByName(words) then
            return false
        end
        if tonumber(getPlayerStorageValue(cid, PREY_SYSTEM.storages.channel_exhausted)) then
        	if getPlayerStorageValue(cid, PREY_SYSTEM.storages.channel_exhausted) > os.time() then
            	doPlayerSendCancel(cid, translate(cid, {"Você não pode falar muito rápido aqui.","You cannot speak so fast here."}))
            	return true
            end
        else
        	setPlayerStorageValue(cid, PREY_SYSTEM.storages.channel_exhausted, -1)
        end
        setPlayerStorageValue(cid, PREY_SYSTEM.storages.channel_exhausted, os.time() + 1)
        if (not channelTopic[cid]) then 
            channelTopic[cid] = 0
        else
            if isPreyChannelStatus(cid, 1) then
                channelTopic[cid] = 0
                setPlayerPreyChannelStatus(cid, 0)
            end
        end
        
        if (words == "start") then
            if not playerHavePrey(cid) then
                local checkStorTime = getPlayerStorageValue(cid, PREY_SYSTEM.storages.listreroll)
                if checkStorTime > os.time() then
                    cost = PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid) .. " gold coins"
                    doPlayerSendChannelMessage(cid, "", translate(cid, {"Você quer sortear novos monstros por " .. milharFormat(cost) .. "?","Do you want to reroll the list for " .. milharFormat(cost) .. "?"}), TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
                    channelTopic[cid] = 2
                    return true
                end

                local preyMonsters = getPlayerPreyMonsters(cid)
                if #preyMonsters == 0 then
                    doPlayerSendChannelMessage(cid, "", translate(cid, {"[Prey System]: Não há nenhuma prey para o seu level.", "[Prey System]: None monsters for your level range are available."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
                else
                    local str = translate(cid,{"[Prey System]: Escolha uma dessas criaturas para obter um bônus aleatório:\n","[Prey System]: You can choose among the following monsters to get a random bonus:\n"})
                    local currentList = getPlayerCurrentList(cid)
                    local monsterList = #currentList == 0 and getPlayerPreyList(cid, PREY_SYSTEM.player_number_of_options) or currentList
                    for i = 1, #monsterList do
                        str = str .. capitalizeAll(monsterList[i]) .. (i ~= #monsterList and ", " or "")
                    end
                    if #currentList == 0 then
                        setPlayerCurrentList(cid, monsterList)
                    end
                    doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_MANAGEMENT, PREY_CHANNEL_ID)
                    channelTopic[cid] = 1 
                end
            else
                doPlayerSendChannelMessage(cid, "", translate(cid, {"Você já possui uma prey ativa. Você pode sortear uma nova lista de 'monsters' ou sortear um novo 'bonus' para essa criatura se preferir.","You already have a prey activated. You can change the list of 'monsters' or raffle a new 'bonus' if you prefer."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
            end
        elseif (words == "monsters") or (words == "monster") then 
            local currentList = getPlayerCurrentList(cid)
            if #currentList == 0 then
                doPlayerSendChannelMessage(cid, "", translate(cid,{"Você não possui uma lista de monstros ainda. Digite 'start' para gerar sua lista de monstros.","You do not have a list of monsters yet. Say 'start' to generate a list."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
            else
                local cost = "free"
                local checkStorTime = getPlayerStorageValue(cid, PREY_SYSTEM.storages.listreroll)
                if checkStorTime > os.time() then
                    cost = PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid) .. " gold coins"
                end
                doPlayerSendChannelMessage(cid, "", translate(cid,{"Você quer sortear uma nova lista por " .. milharFormat(cost) .. "?","Do you want to reroll the list for " .. milharFormat(cost) .. "?"}), TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
                channelTopic[cid] = 2
            end 
        elseif (words == "yes") and channelTopic[cid] == 2 then
            local checkStorTime = getPlayerStorageValue(cid, PREY_SYSTEM.storages.listreroll)
            local check = true
             if checkStorTime > os.time() then 
                if getPlayerMoney(cid) >= PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid) or getPlayerBalance(cid) >= PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid) then
                    if not doPlayerRemoveMoney(cid, PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid)) then
                        doPlayerSetBalance(cid, getPlayerBalance(cid) - PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid))
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, milharFormat(PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid)) .. " gold coins have been debited from your bank account.\n(Balance: " .. milharFormat(getPlayerBalance(cid)) .. ")")   
                    end
                    if playerHavePrey(cid) then
                        setPlayerPreyMonster(cid, 0)
                        setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_check, -1)
                        setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time, -1)
                        setPlayerPreyEventId(cid, os.time())
                    end
                    local str = translate(cid,{"[Prey System]: Escolha alguma dessas criaturas para obter um bônus aleatório:\n","[Prey System]: You can choose among the following monsters to get a random bonus:\n"})
                    local monsterList = getPlayerPreyList(cid, PREY_SYSTEM.player_number_of_options)
                    for i = 1, #monsterList do
                        str = str .. capitalizeAll(monsterList[i]) .. (i ~= #monsterList and ", " or "")
                    end
                    setPlayerCurrentList(cid, monsterList)
                    doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_MANAGEMENT, PREY_CHANNEL_ID)
                    channelTopic[cid] = 1 
                else
                    doPlayerSendChannelMessage(cid, "", translate(cid, {"Você não possui " .. milharFormat(PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid)) .. " gold coins.","You do not have " .. milharFormat(PREY_SYSTEM.list_reroll_price*getPlayerLevel(cid)) .. " gold coins."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
                    channelTopic[cid] = 0
                end
            else
                if playerHavePrey(cid) then
                    setPlayerPreyMonster(cid, 0)
                    setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_check, -1)
                    setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time, -1)
                    setPlayerPreyEventId(cid, os.time())
                end
                local str = translate(cid,{"[Prey System]: Escolha alguma dessas criaturas para obter um bônus aleatório:\n","[Prey System]: You can choose among the following monsters to get a random bonus:\n"})
                local monsterList = getPlayerPreyList(cid, 5)
                for i = 1, #monsterList do
                    str = str .. capitalizeAll(monsterList[i]) .. (i ~= #monsterList and ", " or "")
                end
                setPlayerCurrentList(cid, monsterList)
                doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_MANAGEMENT, PREY_CHANNEL_ID)
                channelTopic[cid] = 1 
            end
            setPlayerStorageValue(cid, PREY_SYSTEM.storages.listreroll, mathtime(PREY_SYSTEM.list_reroll_time) + os.time())
        elseif (words == "no") and channelTopic[cid] == 2 then
            doPlayerSendChannelMessage(cid, "", translate(cid,{"Certo. Digite 'start' para voltar.","Alright. Say 'start' to back."}), TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
            channelTopic[cid] = 0
        elseif (words == "bonus") then
            if getPlayerPreyBonusValue(cid) == 0 or getPlayerPreyMonster(cid) == 0 then
                doPlayerSendChannelMessage(cid, "", translate(cid, {"Você ainda não escolheu um monstro","You did not choose a monster yet."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
            else
                local cost_level = PREY_SYSTEM.bonus_reroll_price * getPlayerLevel(cid)
                doPlayerSendChannelMessage(cid, "", translate(cid,{"Você quer sortear um novo bônus por ".. milharFormat(cost_level) .." gold coins?","Do you want to reroll the bonus for ".. milharFormat(cost_level) .." gold coins?"}), TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
                channelTopic[cid] = 3
            end
        elseif (words == "yes") and channelTopic[cid] == 3 then
            local cost_level = PREY_SYSTEM.bonus_reroll_price * getPlayerLevel(cid)
            if getPlayerMoney(cid) >= cost_level or getPlayerBalance(cid) >= cost_level then
                if not doPlayerRemoveMoney(cid, cost_level) then
                    doPlayerSetBalance(cid, getPlayerBalance(cid) - cost_level)
                   doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, milharFormat(cost_level) .. " gold coins have been debited from your bank account.\n(Balance: " .. milharFormat(getPlayerBalance(cid)) .. ")")  
                end
                local bonuses = {}
                local currentBonusType = getPlayerPreyBonusType(cid)
                for i = 1, 4 do
                    if i ~= currentBonusType then
                        bonuses[#bonuses + 1] = i
                    end
                end
                local newBonusType = bonuses[math.random(1, #bonuses)]
                local newBonusName = PREY_TYPES_NAMES[newBonusType]
                local newBonusValue = getPlayerPreyBonusValue(cid)
                local minv, maxv = PREY_SYSTEM.bonus_range[newBonusType][1], PREY_SYSTEM.bonus_range[newBonusType][2]
                
                --if newBonusValue == PREY_SYSTEM.bonus_range[currentBonusType][2] then
                    --newBonusValue = maxv
                --else
                    --local valuePercent = newBonusValue / PREY_SYSTEM.bonus_range[currentBonusType][2]
                    --local randMin = math.ceil(valuePercent * maxv)
                    newBonusValue = math.random(minv, maxv)
                --end
                local stars = getPreyStars(minv, maxv, newBonusValue)
                local str = translate(cid,{"Bonus sorteado:\n","Bonus Reroll Result:\n"})
                str = str .. translate(cid,{"\nTipo: ","\nType: "}) .. PREY_TYPES_NAMES[newBonusType]
                str = str .. translate(cid, {"\nQuantidade: ", "\nValue: "}) .. string.rep("* ", stars) .. "[" .. newBonusValue .. "%]"
                doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
                setPlayerPreyBonusType(cid, newBonusType)
                setPlayerPreyBonusValue(cid, newBonusValue)
                setPlayerPreyStamina(cid, PREY_SYSTEM.stamina)
                setPlayerStorageValue(cid, PREY_SYSTEM.storages.final_stamina_check, -1)
                setPlayerStorageValue(cid, PREY_SYSTEM.storages.prey_stamina_time, -1)
                setPlayerPreyEventId(cid, os.time())
                channelTopic[cid] = 0
            else
                doPlayerSendChannelMessage(cid, "", translate(cid,{"Você não possui " .. milharFormat(cost_level) .. " gold coins.","You do not have " .. milharFormat(cost_level) .. " gold coins."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
            end 
        elseif (words == "no") and channelTopic[cid] == 3 then
            doPlayerSendChannelMessage(cid, "", translate(cid,{"Certo. Digite 'start' para voltar.","Alright. Say 'start' to back."}), TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
            channelTopic[cid] = 0
        elseif (words == "time") then
            if playerHavePrey(cid) then
                local left_time = getPlayerPreyLeftTime(cid)
                doPlayerSendChannelMessage(cid, "", translate(cid, {"Tempo restante: ","Prey time left: "})..getPlayerPreyLeftTime(cid), TALKTYPE_CHANNEL_MANAGEMENT, PREY_CHANNEL_ID)
            else
                doPlayerSendChannelMessage(cid, "", translate(cid, {"Você ainda não possui nenhuma prey ativa.","You do not have an active prey yet."}), TALKTYPE_GAMEMASTER_CHANNEL, PREY_CHANNEL_ID)
            end
        elseif channelTopic[cid] == 1 then
            local preyMonsters = getPlayerCurrentList(cid)
            if isInArray(preyMonsters, words) then           
                local monster = capitalizeAll(words)
                setPlayerPreyStamina(cid, PREY_SYSTEM.stamina) 
                local str = translate(cid, {"Prey ativa (Termina em: "..getPlayerPreyLeftTime(cid).."):\nMonstro: ".. monster, "Active prey (Left: "..getPlayerPreyLeftTime(cid).."):\nMonster: ".. monster})
                local checkListRerolling = (getPlayerPreyMonster(cid) == 0) and (getPlayerPreyBonusType(cid) ~= 0 or getPlayerPreyBonusValue(cid) ~= 0)
                local randBonusType = checkListRerolling and getPlayerPreyBonusType(cid) or math.random(1, 4)
                local bonusTypeName = PREY_TYPES_NAMES[randBonusType]
                str = str .. "\nBonus: "..bonusTypeName
                local minv, maxv = PREY_SYSTEM.bonus_range[randBonusType][1], PREY_SYSTEM.bonus_range[randBonusType][2]
                -- Manter Bonus ao trocar Monstro:
                -- local randBonusValue = checkListRerolling and getPlayerPreyBonusValue(cid) or math.random(minv, maxv)
                local randBonusValue = math.random(minv, maxv) -- Trocar Bônus

                local stars = getPreyStars(minv, maxv, randBonusValue)
                local starstr = string.rep("* ", stars)
                str = str .. translate(cid, {"\nQuantidade: " .. starstr .. "["..randBonusValue.."%]","\nValue: " .. starstr .. "["..randBonusValue.."%]"})
                doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
                local preyMonsterId = getPreyMonsterIdByName(cid, monster)

                setPlayerPreyBonusType(cid, randBonusType)
                setPlayerPreyBonusValue(cid, randBonusValue)
                setPlayerPreyMonster(cid, preyMonsterId)
                channelTopic[cid] = 0
            end
        end
        return true
    end
    return false
end