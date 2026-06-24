function verificaProtection(cid, protection)
    percentProtect = 0
    if cid and isPlayer(cid) and protection then
        if getPlayerStorageValue(cid, imbu_Bonus[protection].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus[protection].Storage2) > 0 then
            local sto1 = getPlayerStorageValue(cid, imbu_Bonus[protection].Storage1)
            local sto2 = getPlayerStorageValue(cid, imbu_Bonus[protection].Storage2)
            if sto1 > 0 and sto2 > 0 then
                percentProtect = sto1+sto2
            elseif sto1> 0 then
                percentProtect = sto1
            elseif sto2> 0 then
                percentProtect = sto2
            end

            
        end
    end
    return percentProtect
end

sto_noEditImbui_OnThrow = 984785 -- Desativa quando loga, ativa quando desloga, desativa na PZ, ativa fora da pz

function onLogin(cid)
    registerCreatureEvent(cid, "ImbuiSystem")
    registerCreatureEvent(cid, "ImbuiSystemLogin")
    registerCreatureEvent(cid, "blockMove")
    registerCreatureEvent(cid, "blockChannel")
    registerCreatureEvent(cid, "lookBonus")
    registerCreatureEvent(cid, "logoutItemBonus")    
    registerCreatureEvent(cid, "ImbuiStats")
    registerCreatureEvent(cid, "ImbuCombat")

    setPlayerStorageValue(cid, Imbu_channelTopicStorage, -1)
    
    local slots = {1,2,3,4,5,6,7,8,9,10}
    if getPlayerStorageValue(cid, 984785) == 1 then
        for i=1, #slots do        
            if getPlayerSlotItem(cid, slots[i]).uid ~= 0 then 
                if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "code") then 
                    --print("Slot: "..slots[i].." modificado")
                    getNewDesc_Equip(cid, getPlayerSlotItem(cid, slots[i]))
                    
                end
            end
        end
        setPlayerStorageValue(cid, 984785,-1)
    end
    
    
    return true
end

function onLogout(cid)
    local slots = {1,2,3,4,5,6,7,8,9,10}
    if getPlayerStorageValue(cid, 984785) == -1 then
        for i=1, #slots do
            if getPlayerSlotItem(cid, slots[i]).uid ~= 0 then 
                if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "code") then 
                    --print("Slot: "..slots[i].." modificado")
                    getNewDesc_DeEquip(cid, getPlayerSlotItem(cid, slots[i]))                
                end
            end
        end
        setPlayerStorageValue(cid, 984785,1)
    end
    return true
end

function onChannelJoin(cid, channelId, users)
    if(channelId ~= IMBUI_CHANNEL_ID) then
        return false
    end
    addEvent(function()
        if isPlayer(cid) then
            doPlayerSendChannelMessage(cid, "", translate(cid, {"Bem vindo ao sistema de Imbuiment. Para mais informações acesse: Sv.styller-Ots.com","Welcome to your Imbuements System. For more information, visit our website: Sv.styller-Ots.com."}), TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
            --if getPlayerPreyMonster(cid) == 0 and getPlayerPreyBonusType(cid) ~= 0 then
                --local bonusType = getPlayerPreyBonusType(cid)
               -- local bonusTypeName = PREY_TYPES_NAMES[bonusType]
                --local bonusValue = getPlayerPreyBonusValue(cid)
                --local bonusTabRange = PREY_SYSTEM.bonus_range[bonusType]
               -- local starsCount = getPreyStars(bonusTabRange[1], bonusTabRange[2], bonusValue)
                --local starStr = string.rep("* ", starsCount)
                -- doPlayerSendChannelMessage(cid, "", "Current bonus type: " .. bonusTypeName .. " | Value: "..starStr.. "["..bonusValue.."%]", TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID)
            --end
        end
    end, 100)
   -- if playerHavePrey(cid) then
       -- addEvent(function()
            --if isPlayer(cid) then
              --  local monster = getPreyMonsterNameById(cid, getPlayerPreyMonster(cid))
               -- local str = "Active prey (Left: ".. getPlayerPreyLeftTime(cid) .."):\nMonster: ".. capitalizeAll(monster)
               -- local bonusType = getPlayerPreyBonusType(cid)
               --- local bonusTypeName = PREY_TYPES_NAMES[bonusType]
               -- str = str .. "\nBonus: "..bonusTypeName
                --local minv, maxv = PREY_SYSTEM.bonus_range[bonusType][1], PREY_SYSTEM.bonus_range[bonusType][2]
               --- local bonusValue = getPlayerPreyBonusValue(cid)
               -- local stars = getPreyStars(minv, maxv, bonusValue)
               --- local starstr = string.rep("* ", stars)
               -- str = str .. "\nValue: " .. starstr .. "["..bonusValue.."%]"
               --- doPlayerSendChannelMessage(cid, "", str, TALKTYPE_CHANNEL_O, PREY_CHANNEL_ID) 
            --end
       -- end, 101) 
    --end
   return true
end

--head = 1
--amulet = 2
--container = 3
--chest = 4
--right hand = 5 

--left hand = 6
--legs = 7
--boots = 8
--ring = 9
--arrow slot = 10

function onThrow(cid, item, fromPosition, toPosition)
    if item.actionid == 54859 then
      return doCreatureSay(cid, translate(cid, {"Use a Imbuiment Machine em um item","Use the machine on your equipment."}), TALKTYPE_ORANGE_1) and false
    end

    if toPosition.x == 33476 and toPosition.y == 32700 and toPosition.z == 14 then
        return false
    end

    --- Voucher Imbuiment Items ---------------------
    if isVoucher_Imbuiment(item) and getItemAttribute(item.uid, "description") and getPlayerGroupId(cid) < 4 then
        local owner = string.explode(getItemAttribute(item.uid, "description"), ":")[2]
        if owner ~= getPlayerName(cid) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "Only " .. owner .. " can move this item.") 
            return false
        end
        if toPosition.y > 10 then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "You can't drop this item.") 
            return false
        end
    end

    --doBroadcastMessage(toPosition.y)
    --doBroadcastMessage("From Position X: " .. fromPosition.x .. " | To Position X: " .. toPosition.x)



    if toPosition.y < 11 and getPlayerSlotItem(cid, toPosition.y)  then
        if getPlayerSlotItem(cid, toPosition.y).uid > 0 then
            if getItemAttribute(getPlayerSlotItem(cid, toPosition.y).uid, "code") then 
                codeTo = getItemAttribute(getPlayerSlotItem(cid, toPosition.y).uid, "code")
                if codeTo ~= '' then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, translate(cid, {"Remova o item ".. getItemNameById(getPlayerSlotItem(cid, toPosition.y).itemid) .." manualmente. ", "Remove ".. getItemNameById(getPlayerSlotItem(cid, toPosition.y).itemid) .." manually."})) 
                    return false
                end
            end
        end
    end
    ------------------------------------------------
    if getItemAttribute(item.uid, "code") then
        if getImbueChannelTopic(cid) >= 0 then
            setPlayerStorageValue(cid, Imbu_channelTopicStorage, -1)
            doPlayerSendChannelMessage(cid, "", translate(cid, {"Imbuiment fail! Você não pode mover o item durante o imbuimento.","Imbuiment fail! You can't move item while imbuing."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID) 
        end
        --doBroadcastMessage(getItemAttribute(item.uid, "code"))
        local codeFrom = getItemAttribute(item.uid, "code")
        local codeTo = 0 

        if not getTilePzInfo(getPlayerPosition(cid)) then
            if toPosition.x == 65535 and codeFrom ~= '' then -- Inventory
                local descB = ''
                local slot = '' 

                if fromPosition.y < 11 and toPosition.y < 11 and codeFrom ~= ''  then -- Se mover o item entre os slots
                    return false
                end

                if getPlayerSlotItem(cid, toPosition.y).uid == 0 and toPosition.y < 11 then -- movimentar item para slot vazio
                    addEvent(function()
                        if getPlayerSlotItem(cid, toPosition.y) then
                            if getPlayerSlotItem(cid, toPosition.y).uid ~= 0 then
                                if getItemAttribute(getPlayerSlotItem(cid, toPosition.y).uid, "code") then 
                                    codeTo = getItemAttribute(getPlayerSlotItem(cid, toPosition.y).uid, "code")
                                end

                                if codeFrom == codeTo then -- Item movido com sucesso
                                    item = getPlayerSlotItem(cid, toPosition.y)
                                    getNewDesc_Equip(cid, item)  

                                    --if toPosition.y == 3 and getPlayerStorageValue(cid, imbu_Bonus["featherweight"].Storage1) then 
                                        --doPlayerSetMaxCapacity(cid, tonumber(getPlayerCap(cid)) +((tonumber(getPlayerCap(cid))*getPlayerStorageValue(cid, imbu_Bonus["featherweight"].Storage1))/100))
                                    --end
                                    return true                
                                end
                            end
                        end
                    end, 50)
                elseif (toPosition.y > 10) and (fromPosition.y < 11) then -- removendo o item do slot
                    
                    getNewDesc_DeEquip(cid, item)
                    
                    addEvent(function()
                        if getPlayerSlotItem(cid, fromPosition.y) then 
                            if getPlayerSlotItem(cid, fromPosition.y).uid > 0 then
                                if getItemAttribute(getPlayerSlotItem(cid, fromPosition.y).uid, "code") then 
                                    codeTo = getItemAttribute(getPlayerSlotItem(cid, fromPosition.y).uid, "code")
                                    if codeFrom == codeTo then 
                                        item = getPlayerSlotItem(cid, fromPosition.y)
                                        getNewDesc_Equip(cid, item)

                                        return true 
                                    end
                                end
                            end
                        end
                    end,50)
                else
                    addEvent(function()     
                        -- Caso tenha algum item na posição final, e seja um slot ele checa o movimento
                        if getPlayerSlotItem(cid, toPosition.y).uid > 0 and toPosition.y <= 10 and fromPosition.y > 10 then           
                            if getItemAttribute(getPlayerSlotItem(cid, toPosition.y).uid, "code") then 
                                codeTo = getItemAttribute(getPlayerSlotItem(cid, toPosition.y).uid, "code")
                            end  
                        end

                        if codeFrom == codeTo then -- Item movido com sucesso
                            if toPosition.y < 11 then
                                item = getPlayerSlotItem(cid, toPosition.y)
                                getNewDesc_Equip(cid, item)
                                return true 
                            end                    
                        end 

                    end,50)
                end                            
            elseif (toPosition.y > 10) and (fromPosition.y < 11) then -- Slot to Floor
                getNewDesc_DeEquip(cid, item)
                addEvent(function()
                    if getPlayerSlotItem(cid, fromPosition.y) then 
                        if getPlayerSlotItem(cid, fromPosition.y).uid > 0 then
                            if getItemAttribute(getPlayerSlotItem(cid, fromPosition.y).uid, "code") then 
                                codeTo = getItemAttribute(getPlayerSlotItem(cid, fromPosition.y).uid, "code")
                                if codeFrom == codeTo then 
                                    item = getPlayerSlotItem(cid, fromPosition.y)
                                    getNewDesc_Equip(cid, item)
                                    return true
                                end
                            end
                        end
                    end
                end,50)
            end
        end
    end

-------------------- Conditions ------------------------------------
  return true
end 

function onLook(cid, thing, position, lookDistance) 
    --doBroadcastMessage(getItemAttribute(thing.uid, "bonus"))
    
   --doBroadcastMessage(getItemAttribute(thing.uid, "bonus")) 
   --doBroadcastMessage(getItemInfo(thing.itemid).description)

    if isCreature(thing.uid) then return true end
    if isImbueableItem(thing.itemid) then
        local str = ''
        equipedSlots = Count_EquipedSlots(thing)
        if getItemAttribute(thing.uid, "bonus") then
        	if getItemInfo(thing.itemid).description then
        		if getItemAttribute(thing.uid, "bonus") == getItemInfo(thing.itemid).description then
        			str = "Imbuiments: (" .. equipedSlots .."/"..Slots..")" 
                    if getItemInfo(thing.itemid).description ~= '' then
                        str = "\n\n" .. str
                    else
                        str = "\n" .. str
                    end 

                    doItemSetAttribute(thing.uid, "description", getItemInfo(thing.itemid).description .. str) 
					--doPlayerSendTextMessage(cid, 22, str) 
                    doItemSetAttribute(thing.uid, "code", '')
                    doItemSetAttribute(thing.uid, "bonus", '')
					return true
        		end
        	end
            if getItemAttribute(thing.uid, "bonus") ~= ''  then
                local desc = getItemAttribute(thing.uid, "bonus")
                local Bonus = doCutText(desc,"*")
                local count = 0

                for i, v in pairs(Bonus) do
                  count = i
                end
                count = count/2

                for j=1, count do
                    if j>1 then
                        local atributos = doCutText(Bonus[j], ",")

                        local Nome = getBonusName(tonumber(atributos[1]))
                        local Tipo = atributos[2]

                        ----- Conversão de tempo ----------------------
                        local tempo = tonumber(atributos[3])
                        if tempo > 86400 then
                            tempo = tempo - tonumber(os.time())
                        end

                        local Horas = (tempo/3600)
                        local Minutos = (Horas - math.floor(Horas))*60
                        local Segundos = (Minutos - math.floor(Minutos))*60
                        local NewTime = math.floor(Horas).. ":"..math.floor(Minutos).. ":".. math.floor(Segundos)

                        ------------------------------------------------

                        
                        if str == '' then
                            if tempo > 0 then
                                str = "Imbuiments: (".. equipedSlots .. "/".. Slots .. ")\n" ..Nome .. " | " .. Tipo .. " | Time (" ..NewTime ..")"
                            else
                                equipedSlots = equipedSlots-1
                                str = "Imbuiments: (".. equipedSlots .. "/".. Slots .. ")"
                            end
                        else
                            if tempo > 0 then
                                str = str .. "\n" .. Nome .. " | " .. Tipo .. " | Time (" ..NewTime ..")"
                            else
                                equipedSlots = equipedSlots-1
                                str = str .. ''
                            end
                        end
                    end
                end
            else
        		str = "Imbuiments: (" .. equipedSlots .."/"..Slots..")"  
            end 
        else
         	str = "Imbuiments: (" .. equipedSlots .."/"..Slots..")"  
    	end
        --22
        if getItemInfo(thing.itemid).description ~= '' then
            str = "\n\n" .. str
        else
            str = "\n" .. str
        end 

        doItemSetAttribute(thing.uid, "description", getItemInfo(thing.itemid).description .. str)  
    end

  return true  
end

function onCombat(cid, target)
    if not isPlayer(cid) or not isMonster(target) then return true end
    if isSummon(target) then return true end
    registerCreatureEvent(target, "ImbuiStats")
    return true
end

local creature_table = {}
function onStatsChange(cid, attacker, type, combat, value)
--print("Value: " .. value .. " | Combat: " .. combat .. " | Type: " .. type)
----------------------------------------
if not creature_table[cid] then
   creature_table[cid] = false
elseif creature_table[cid] == true then
   creature_table[cid] = false
   return true
end
if isPlayer(cid) and isMonster(attacker) then
    local mname = getCreatureName(attacker)
    if not isInArray(PREY_SYSTEM.monsters_ignored_list, mname:lower()) then 
        if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and value >= 1 then
            if playerHavePrey(cid) then
                local preyMonsterId = getPlayerPreyMonster(cid)
                local preyMonsterName = getPreyMonsterNameById(cid, preyMonsterId)
                if preyMonsterName:lower() == mname:lower() then
                    return true
                end
            end
        end
    end
 --[[elseif isPlayer(attacker) and isMonster(cid) then
    local mname = getCreatureName(cid)
    if not isInArray(PREY_SYSTEM.monsters_ignored_list, mname:lower()) then 
        if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and value >= 1 then
            if playerHavePrey(attacker) then
                usePlayerPreyStamina(attacker)
                local preyMonsterId = getPlayerPreyMonster(attacker)
                local preyMonsterName = getPreyMonsterNameById(attacker, preyMonsterId)
                if preyMonsterName:lower() == mname:lower() then
                    return true
                end
            end
        end
    end
]]
end



local enable
    if cid == attacker then
        --print("Cid: " .. cid .. " | Attacker: " .. attacker)
        enable = false
    else
        enable = true
    end

    local porcentagem = 0
    if isPlayer(attacker) and (not (attacker == cid)) then
        ---- Verificar se é arma elemental: ----
        local itemsElementais = {
            [12715] = {elementAttack = 45}, -- falcon battleaxe
            [12714] = {elementAttack = 41}, -- falcon mace
        }
        itemBuffElement_Percent = 0
        local slot = 5
        while slot <= 6 do
            local item = getPlayerSlotItem(attacker, slot)
            if item.uid ~= 0 then
                for a,b in pairs(itemsElementais) do
                    if item.itemid == a then
                        local attack = getItemInfo(item.itemid).attack
                        local percentElementAttack = (itemsElementais[a].elementAttack*100)/attack 
                        physicalAttack = attack - itemsElementais[a].elementAttack
                        elementAttack = itemsElementais[a].elementAttack

                        itemBuffElement_Percent = percentElementAttack
                        --doBroadcastMessage(physicalAttack)
                    end
                end
            end
            slot = slot+1
        end
        ------------------------------------------

        if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and value > 0 then
            creature_table[cid] = true
            ----- Vampirism (attack = + %life) --------
            if (tonumber(getPlayerStorageValue(attacker, imbu_Bonus["vampirism"].Storage1)) > 0) or (tonumber(getPlayerStorageValue(attacker, imbu_Bonus["vampirism"].Storage2)) > 0) then
                local Storage1 = tonumber(getPlayerStorageValue(attacker, imbu_Bonus["vampirism"].Storage1))
                local Storage2 = tonumber(getPlayerStorageValue(attacker, imbu_Bonus["vampirism"].Storage2))
                local porcentagem = 0

                if Storage1 > 0 and Storage2 > 0 then
                    porcentagem = Storage1 + Storage2
                elseif Storage1 > 0 then
                    porcentagem = Storage1
                elseif Storage2 > 0 then
                    porcentagem = Storage2
                end

                local porcentagemLife = (value * (porcentagem / 100))

                if itemBuffElement_Percent > 0 then
                    porcentagem = porcentagem + ((elementAttack*(porcentagem/2))/physicalAttack)
                end

                doCreatureAddHealth(attacker, porcentagemLife)
                --doSendAnimatedText(getThingPos(attacker), "+" .. math.floor(porcentagemLife), TEXTCOLOR_DARKPURPLE)
            end
           
            ----- Void (attack = + %mana) -------
            if getPlayerStorageValue(attacker, imbu_Bonus["void"].Storage1) > 0 or getPlayerStorageValue(attacker, imbu_Bonus["void"].Storage2) > 0 then
                local Storage1 = getPlayerStorageValue(attacker, imbu_Bonus["void"].Storage1)
                local Storage2 = getPlayerStorageValue(attacker, imbu_Bonus["void"].Storage2)
                local porcentagem = 0
                if Storage1 > 0 and Storage2 > 0 then
                    porcentagem = Storage1 + Storage2
                elseif Storage1 > 0 then
                    porcentagem = Storage1
                elseif Storage2 > 0 then
                    porcentagem = Storage2
                end

                local porcentagemMana = (value * (porcentagem / 100))
                --- Buff para armas elementais: --
                if itemBuffElement_Percent > 0 then
                    porcentagemMana = porcentagemMana + ((elementAttack*(porcentagemMana/2))/physicalAttack)
                end

                addEvent(function()
                    doCreatureAddMana(attacker, porcentagemMana)
                end,100)                
                doSendAnimatedText(getThingPos(attacker), "+" .. math.floor(porcentagemMana), TEXTCOLOR_DARKPURPLE)
            end


            ----- Strike (attack = + %critical) -------
            if getPlayerStorageValue(attacker, imbu_Bonus["strike"].Storage1) > 0 then
                local chance = math.random(1,100)
                if chance <= 15 then
                    local porcentagemDano = getPlayerStorageValue(attacker, imbu_Bonus["strike"].Storage1)

                    local attackFinal = tonumber((porcentagemDano * value)/100)
                    
                    if itemBuffElement_Percent > 0 then
                        attackFinal = attackFinal + ((porcentagemDano*(porcentagemDano/2))/physicalAttack)
                    end

                    doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255) 
                    local pos = getCreaturePos(cid)
                    addEvent(function()
                        doSendAnimatedText(pos, "CRITICAL!!", 187) 
                    end, 500)         
                end
            end

            ----- Electrify (Bonus Atk + %Energy) -----
            if getPlayerStorageValue(attacker, imbu_Bonus["electrify"].Storage1) > 0 then
                local porcentagemDano = getPlayerStorageValue(attacker, imbu_Bonus["electrify"].Storage1)
                local attackBonus = math.ceil((value * porcentagemDano)/100)

                if verificaProtection(cid, "cloud") > 0 then
                    attackBonus = attackBonus - (percentProtect*attackBonus)/100
                end

                if combat == 1 then
                    local combat = COMBAT_ENERGYDAMAGE
                    doTargetCombatHealth(attacker, cid, combat, -attackBonus, -attackBonus, 255) 
                end

            end
            ----- Frost (Bonus Atk + %ice) -----
            if getPlayerStorageValue(attacker, imbu_Bonus["frost"].Storage1) > 0 then
                local porcentagemDano = getPlayerStorageValue(attacker, imbu_Bonus["frost"].Storage1)
                local attackBonus = math.ceil((value * porcentagemDano)/100)

                if verificaProtection(cid, "ice") > 0 then
                    attackBonus = attackBonus - (percentProtect*attackBonus)/100
                end

                if combat == 1 then
                    local combat = COMBAT_ICEDAMAGE
                    doTargetCombatHealth(attacker, cid, combat, -attackBonus, -attackBonus, 255) 
                end
            end
            ----- reap (Bonus Atk + %death) -----
            if getPlayerStorageValue(attacker, imbu_Bonus["reap"].Storage1) > 0 then
                local porcentagemDano = getPlayerStorageValue(attacker, imbu_Bonus["reap"].Storage1)
                local attackBonus = math.ceil((value * porcentagemDano)/100)

                if verificaProtection(cid, "death") > 0 then
                    attackBonus = attackBonus - (percentProtect*attackBonus)/100
                end
                if combat == 1 then
                    local combat = COMBAT_DEATHDAMAGE
                    doTargetCombatHealth(attacker, cid, combat, -attackBonus, -attackBonus, 255)
                end
            end
            ----- scorch (Bonus Atk + %fire) -----
            if getPlayerStorageValue(attacker, imbu_Bonus["scorch"].Storage1) > 0 then
                local porcentagemDano = getPlayerStorageValue(attacker, imbu_Bonus["scorch"].Storage1)
                local attackBonus = math.ceil((value * porcentagemDano)/100)
            
                if verificaProtection(cid, "fire") > 0 then
                    attackBonus = attackBonus - (percentProtect*attackBonus)/100
                end
                if combat == 1 then
                    local combat = COMBAT_FIREDAMAGE
                    doTargetCombatHealth(attacker, cid, combat, -attackBonus, -attackBonus, 255) 
                end
                return true
            end
            ----- venom (Bonus Atk + %earth) -----
            if getPlayerStorageValue(attacker, imbu_Bonus["venom"].Storage1) > 0 then
                local porcentagemDano = getPlayerStorageValue(attacker, imbu_Bonus["venom"].Storage1)
                local attackBonus = math.ceil((value * porcentagemDano)/100)

                if verificaProtection(cid, "snake") > 0 then
                    attackBonus = attackBonus - (percentProtect*attackBonus)/100
                end

                if combat == 1 then
                    local combat = COMBAT_EARTHDAMAGE
                    doTargetCombatHealth(attacker, cid, combat, -attackBonus, -attackBonus, 255) 
                end
            end
        end
    end

   
    if (isPlayer(cid) and not (attacker == cid)) then
        if (type == STATSCHANGE_HEALTHLOSS or type == STATSCHANGE_MANALOSS) and value > 0 then
            creature_table[cid] = true
             ----- Cloud Fabric (Protection %Energy) -------
            if (getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage2) > 0) and combat == COMBAT_ENERGYDAMAGE then
                local attackfinal = 0
                local porcentagemProtect = 0
                local Storage1 = getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage1)
                local Storage2 = getPlayerStorageValue(cid, imbu_Bonus["cloud"].Storage2)            
                if Storage1 > 0 and Storage2 > 0 then                
                    porcentagemProtect = Storage1 + Storage2
                    
                elseif Storage1 > 0 then
                    porcentagemProtect = Storage1
                elseif Storage2 > 0 then
                    porcentagemProtect = Storage2      
                end
                attackFinal = math.ceil(value - ((porcentagemProtect * value)/100))
                doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255)               
                return false
            end
            ----- Demon Presence (Protection %Holy) ------- COMBAT_HOLYDAMAGE
            if (getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage2) > 0) and combat == COMBAT_HOLYDAMAGE then
                local attackfinal = 0
                local porcentagemProtect = 0
                local Storage1 = getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage1)
                local Storage2 = getPlayerStorageValue(cid, imbu_Bonus["holy"].Storage2)
                if Storage1 > 0 and Storage2 > 0 then                
                    porcentagemProtect = Storage1 + Storage2
                    
                elseif Storage1 > 0 then
                    porcentagemProtect = Storage1
                elseif Storage2 > 0 then
                    porcentagemProtect = Storage2      
                end
                attackFinal = math.ceil(value - ((porcentagemProtect * value)/100))
                doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255)               
                return false
            end


            
            ----- Dragon Hide (Protection %Fire) ------- COMBAT_FIREDAMAGE
            if (getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage2) > 0) and combat == COMBAT_FIREDAMAGE then
                local stoFire = 141110
                --print("combat:" .. combat .. " | Type: " .. type)
                local attackfinal = 0
                local porcentagemProtect = 0
                local Storage1 = getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage1)
                local Storage2 = getPlayerStorageValue(cid, imbu_Bonus["fire"].Storage2)
                if Storage1 > 0 and Storage2 > 0 then                
                    porcentagemProtect = Storage1 + Storage2
                    
                elseif Storage1 > 0 then
                    porcentagemProtect = Storage1
                elseif Storage2 > 0 then
                    porcentagemProtect = Storage2      
                end
                attackFinal = math.ceil(value - ((porcentagemProtect * value)/100))
                doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255)          
                return false
            end

            ----- Lich Shroud (Protection %Death) ------- COMBAT_DEATHDAMAGE
            if (getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus["death"].Storage2) > 0) and combat == COMBAT_DEATHDAMAGE then
                local attackfinal = 0
                local porcentagemProtect = 0
                local Storage1 = getPlayerStorageValue(cid, imbu_Bonus["death"].Storage1)
                local Storage2 = getPlayerStorageValue(cid, imbu_Bonus["death"].Storage2)
                if Storage1 > 0 and Storage2 > 0 then                
                    porcentagemProtect = Storage1 + Storage2
                    
                elseif Storage1 > 0 then
                    porcentagemProtect = Storage1
                elseif Storage2 > 0 then
                    porcentagemProtect = Storage2      
                end
                attackFinal = math.ceil(value - ((porcentagemProtect * value)/100))
                doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255)               
                return false
            end

            ----- Quara Scale (Protection %Ice) ------- COMBAT_ICEDAMAGE
            if (getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage2) > 0) and combat == COMBAT_ICEDAMAGE then
                local attackfinal = 0
                local porcentagemProtect = 0
                local Storage1 = getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage1)
                local Storage2 = getPlayerStorageValue(cid, imbu_Bonus["ice"].Storage2)
                if Storage1 > 0 and Storage2 > 0 then                
                    porcentagemProtect = Storage1 + Storage2
                    
                elseif Storage1 > 0 then
                    porcentagemProtect = Storage1
                elseif Storage2 > 0 then
                    porcentagemProtect = Storage2      
                end
                attackFinal = math.ceil(value - ((porcentagemProtect * value)/100))
                doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255)               
                return false
            end

            ----- Snake Skin (Protection %Earth) ------- COMBAT_POISONDAMAGE
            if (getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1) > 0 or getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage2) > 0) and (combat == COMBAT_POISONDAMAGE or combat == COMBAT_EARTHDAMAGE) then
                local attackfinal = 0
                local porcentagemProtect = 0
                local Storage1 = getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage1)
                local Storage2 = getPlayerStorageValue(cid, imbu_Bonus["snake"].Storage2)
                if Storage1 > 0 and Storage2 > 0 then                
                    porcentagemProtect = Storage1 + Storage2
                    
                elseif Storage1 > 0 then
                    porcentagemProtect = Storage1
                elseif Storage2 > 0 then
                    porcentagemProtect = Storage2      
                end
                attackFinal = math.ceil(value - ((porcentagemProtect * value)/100))
                doTargetCombatHealth(attacker, cid, combat, -attackFinal, -attackFinal, 255)               
                return false
            end
        end
    end
    return true
end





function onThink(cid, interval, lastExecution, thinkInterval)
    if getPlayerPosition(cid) and not getTilePzInfo(getPlayerPosition(cid)) and getPlayerStorageValue(cid,Bonus_storage) ~= 0 then
        setPlayerStorageValue(cid, Bonus_storage, -1)
    end

    if  getPlayerStorageValue(cid, 4578712) ~= -1 and getPlayerStorageValue(cid, 4578712) > 0 and (not isInParty(cid)) then
        setPlayerStorageValue(cid, 4578712, -1)
    end



    local slots = {1,2,3,4,5,6,7,8,9,10}
    for i=1, #slots do
        if getPlayerSlotItem(cid, slots[i]).uid ~= 0 then 
            if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "code") then 
                if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "bonus") then
                    if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "bonus") ~= '' then
                        local desc = getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "bonus")
                        local Bonus = doCutText(desc,"*")
                        local count = 0
                        local time = {}

                        for i, v in pairs(Bonus) do
                          count = i
                        end
                        count = count/2
                        for j=1, count do

                            if j>1 then
                                time[j-1] = tonumber(doCutText(Bonus[j], ",")[3])
                                local atributos = doCutText(Bonus[j], ",")

                                local Nome = getBonusName(tonumber(atributos[1]))
                                local Tipo = atributos[2]

                                ----- Conversão de tempo ----------------------
                                local tempo = tonumber(atributos[3])
                                
                                if tempo > 86400 then
                                    tempo = tempo - tonumber(os.time())
                                end
                                local slots = {1,2,3,4,5,6,7,8,9,10}
                                --doBroadcastMessage(tempo)
                                if tempo < 0 and tempo > -5 then
                                    Add_ImbueConditions(cid, i, Nome, "null")
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end

    if getTilePzInfo(getPlayerPosition(cid)) and getPlayerStorageValue(cid, 984785) == -1 then
        for i=1, #slots do
            if getPlayerSlotItem(cid, slots[i]).uid ~= 0 then 
                if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "code") then 
                    getNewDesc_DeEquip(cid, getPlayerSlotItem(cid, slots[i]))                
                end
            end
        end
        setPlayerStorageValue(cid, 984785,1)
    elseif not getTilePzInfo(getPlayerPosition(cid)) and getPlayerStorageValue(cid, 984785) == 1 then
        for i=1, #slots do        
            if getPlayerSlotItem(cid, slots[i]).uid ~= 0 then 
                if getItemAttribute(getPlayerSlotItem(cid, slots[i]).uid, "code") then 
                    getNewDesc_Equip(cid, getPlayerSlotItem(cid, slots[i]))                        
                end
            end
        end
        setPlayerStorageValue(cid, 984785,-1)
    end


  return true
end

