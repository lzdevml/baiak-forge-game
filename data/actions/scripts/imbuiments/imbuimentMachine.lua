--[[
    CONST_SLOT_FIRST = 1
    CONST_SLOT_HEAD = CONST_SLOT_FIRST
    CONST_SLOT_NECKLACE = 2
    CONST_SLOT_BACKPACK = 3
    CONST_SLOT_ARMOR = 4
    CONST_SLOT_RIGHT = 5
    CONST_SLOT_LEFT = 6
    CONST_SLOT_LEGS = 7
    CONST_SLOT_FEET = 8
    CONST_SLOT_RING = 9
    CONST_SLOT_AMMO = 10
    CONST_SLOT_LAST = CONST_SLOT_AMMO
]]

StoDesc = 854827
stoGreetMessage = 21474
function onUse(cid, item, fromPosition, itemEx, toPosition)
    local itemPlayer = itemEx.itemid 
    local desc = ''
    --extraDefense
    --doRemoveItem(itemPlayer, 1)
    --doPlayerAddItem(cid, itemPlayer, 1)

    -- getItemAttribute(itemEx.uid, "description")
    -- getItemInfo(item.itemid).description
    
    if isImbueableItem(itemPlayer) then
    local qtdItem = getPlayerItemCount(cid, itemPlayer) 
        if qtdItem == 1 then
            local slots = {1,2,3,4,5,6,7,8,9,10} 
            for i=1, #slots do
                check = getPlayerSlotItem(cid, slots[i]).uid
                if check == itemEx.uid then
                    doPlayerSendChannelMessage(cid, "", translate(cid, {"Coloque o item na sua backpack!", "Put your item inside the backpack to imbue it."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
                    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, translate(cid, {"Coloque o item na sua backpack!", "Put your item inside the backpack to imbue it."}))
                    doSendMagicEffect(getCreaturePosition(cid), 2)
                    return true
                end
            end
            equipedSlots = Count_EquipedSlots(itemEx)
            -------- Salvar descrição: ------------------------------------------------------------------------
                if getItemAttribute(itemEx.uid, "bonus") then
                    desc = getItemAttribute(itemEx.uid, "bonus")
                end

                setPlayerStorageValue(cid,StoDesc,desc)
            ---------------------------------------------------------------------------------------------------

            if equipedSlots < Slots then
                doSendMagicEffect(getThingPos(item.uid), 11)                
                imbu_type(cid,item,0)

  
                doPlayerOpenChannel(cid, 11) 
                addEvent(function()
                    doPlayerSendChannelMessage(cid, "", "...", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
                    doPlayerSendChannelMessage(cid, "", translate(cid, {"Imbuiment Machine usada no item: ", "Imbuement Machine used item: "}) .. getItemNameById(itemPlayer) .. " (Slots: ".. equipedSlots .. "/".. Slots ..")", TALKTYPE_CHANNEL_MANAGEMENT, IMBUI_CHANNEL_ID)
                    doPlayerSendChannelMessage(cid, "", translate(cid, {"Escolha um imbuiment: ", "Choose an imbuement type: "}) .. BonusList, TALKTYPE_CHANNEL_O, IMBUI_CHANNEL_ID)
                    setPlayerStorageValue(cid, Imbu_channelTopicStorage, 0 .. "," .. itemPlayer)
                end,101)

                --[[
                greetMessage = "Imbuement Machine used item: " .. getItemNameById(itemPlayer) .. " (Slots: ".. equipedSlots .. "/".. Slots ..")*Choose an imbuement type: " .. BonusList .. "."
                setPlayerStorageValue(cid, stoGreetMessage, greetMessage)
                setPlayerStorageValue(cid, Imbu_channelTopicStorage, 0 .. "," .. itemPlayer)
                doCreatureSay(cid, "hi", TALKTYPE_CHANNEL_O, false, 0)
                ]]
                setPlayerStorageValue(cid, storageItem, itemPlayer)                
            else
                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, translate(cid, {"Esse item já atingiu o limite de Slots. ","This item's slot limit has already been reached. "}) .. "(".. equipedSlots ..")")
                setPlayerStorageValue(cid, Bonus_storage, -1)
                doSendMagicEffect(getCreaturePosition(cid), 2)
                setImbueChannelTopic(cid, -1)
            end
        elseif qtdItem == 0 then
            doPlayerSendChannelMessage(cid, "", translate(cid, {"Coloque o item dentro da sua backpack!", "Put your item inside the backpack!"}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, translate(cid, {"Coloque o item dentro da sua backpack!", "Put your item inside the backpack!"}))
            doSendMagicEffect(getCreaturePosition(cid), 2)
            return true
        else
            doPlayerSendChannelMessage(cid, "", translate(cid, {"Você só pode possuir 1x ".. getItemNameById(itemPlayer) .." dentro de sua backpack para imbuir.", "You can only have 1x ".. getItemNameById(itemPlayer) .." inside backpack to imbue it."}), TALKTYPE_GAMEMASTER_CHANNEL, IMBUI_CHANNEL_ID)  
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,translate(cid, {"Você só pode possuir 1x ".. getItemNameById(itemPlayer) .." dentro de sua backpack para imbuir.", "You can only have 1x ".. getItemNameById(itemPlayer) .." inside backpack to imbue it."}))
            doSendMagicEffect(getCreaturePosition(cid), 2)
            return true
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, translate(cid, {"Use a Imbuiment Machine em um equipamento válido.", "Use the Imbuement Machine on valid equipment."}))
        setPlayerStorageValue(cid, Bonus_storage, -1)
        doSendMagicEffect(getCreaturePosition(cid), 2)
        setImbueChannelTopic(cid, -1)
        return true
	end

    --addEvent(function()
    --    doPlayerSendChannelMessage(cid, "", "Nao Pertence", TALKTYPE_CHANNEL_O, IMBUI_CHANNEL_ID)
    --    isImbueableItem()
   -- end,101)

    return true
end