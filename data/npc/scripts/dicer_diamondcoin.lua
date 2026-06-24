local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                              npcHandler:onThink() end
 
local function delayMoneyRemoval(item, pos)
        doRemoveItem(getTileItemById(pos, item).uid)
        return true
end
 
local function placeMoney(amount, table_middle_pos)
        local remain = amount
        local anubis_flasks = 0
 
        if (math.floor(amount / 1) >= 1) then
                anubis_flasks = math.floor(amount / 1)
                remain = remain - anubis_flasks * 1
        end
        addEvent(doCreateItem, 600, 10559, anubis_flasks, table_middle_pos)
end
 
local function rollDice(roll, mp_count, table_left_pos, table_middle_pos, npc)
        local dice_ids = {5792, 5793, 5794, 5795, 5796, 5797}
        local random_rollval = math.random(1,6)
        local total_g = (1 * mp_count)
        local prize_percent = 0.5 -- 40%
 
        if ((total_g) <= 60 and (total_g) >= 3) then
                doSendMagicEffect(table_left_pos, CONST_ME_CRAPS)
 
                for _, itemId in pairs(dice_ids) do
                                if(getTileItemById(table_left_pos, itemId).uid > 0) then
                                doTransformItem(getTileItemById(table_left_pos, itemId).uid, dice_ids[random_rollval])
                        end
                end
 
                if (roll == 1 and random_rollval <= 3) then
                        placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
                        addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
                        addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
                        addEvent(doCreatureSay, 500, npc, "Você stá com sorte!", TALKTYPE_SAY, false, 0)
                elseif (roll == 2 and random_rollval >= 4) then
                        placeMoney(total_g + (total_g * prize_percent), table_middle_pos)
                        addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_SOUND_GREEN)
                        addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_SOUND_GREEN)
                        addEvent(doCreatureSay, 500, npc, "Você está com sorte!", TALKTYPE_SAY, false, 0)
                else
                        addEvent(doSendMagicEffect, 400, table_left_pos, CONST_ME_BLOCKHIT)
                        addEvent(doSendMagicEffect, 700, table_left_pos, CONST_ME_BLOCKHIT)
                        addEvent(doCreatureSay, 500, npc, "Tente na próxima.", TALKTYPE_SAY, false, 0)
                end
                doCreatureSay(npc, string.format("%s rolled a %d.", getCreatureName(npc), random_rollval), TALKTYPE_ORANGE_1, false, 0, table_left_pos)
        else
                addEvent(doCreateItem, 100, 10559, mp_count, table_middle_pos)
                doCreatureSay(npc, "Mínimo 3, Máximo 60.", TALKTYPE_SAY, false, 0)
        end
        return true
end
 
function creatureSayCallback(cid, type, msg)
        -- NPC userdata instance
        local npc = getNpcCid()
 
        -- Game table position userdata instances
        local table_left_pos = {x=167, y=56, z=5} -- Pos da frente do Npc onde gira o dado
        local table_middle_pos = {x=168, y=56, z=5} -- Pos do meio onde vai o dinheiro
 
        -- Search for coins on the left and middle tables and create item userdata instances
        local table_middle_mp = getTileItemById(table_middle_pos, 10559)
 
        -- Other variables
        local mp_count = 0
        local ROLL, LOW, HIGH = 0, 1, 2
        posplayer = {x=169, y=55, z=5} -- Pos onde o player precisa estar
                local ppos = getPlayerPosition(cid)
        if ppos.x == posplayer.x and ppos.y == posplayer.y then
        if isInArray({"H", "HIGH", "high", "h"}, msg) then
                        ROLL = HIGH
                elseif  isInArray({"L", "LOW", "l", "low"}, msg) then
                        ROLL = LOW             
                else
                        return false
                end
                if (table_middle_mp.uid ~= 0) then
                        mp_count = table_middle_mp.type
                        doTeleportThing(table_middle_mp.uid, table_left_pos)
                        addEvent(delayMoneyRemoval, 300, 10559, table_left_pos)
                end
                addEvent(rollDice, 500, ROLL, mp_count, table_left_pos, table_middle_pos, npc)
        else
                return false
        end
        return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())