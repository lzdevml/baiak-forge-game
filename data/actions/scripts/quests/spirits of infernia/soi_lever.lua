-- Ao clicar na alavanca teleport 10 players para as 10 posicoes

--Pos atual
local playerPosition = {
        {x = 31209, y = 32301, z = 7, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31178, y = 32244, z = 7, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31302, y = 32311, z = 8, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31224, y = 32346, z = 8, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31377, y = 32359, z = 5, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31226, y = 32327, z = 6, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31181, y = 32360, z = 7, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31389, y = 32267, z = 9, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31319, y = 32212, z = 9, stackpos = STACKPOS_TOP_CREATURE},
        {x = 31286, y = 32284, z = 2, stackpos = STACKPOS_TOP_CREATURE}
}
--nova pos
local newPosition = {
        {x = 31182, y = 32266, z = 8},
        {x = 31183, y = 32266, z = 8},
        {x = 31184, y = 32266, z = 8},
        {x = 31185, y = 32266, z = 8},
        {x = 31186, y = 32266, z = 8},
        {x = 31187, y = 32266, z = 8},
        {x = 31188, y = 32266, z = 8},
        {x = 31189, y = 32266, z = 8},
        {x = 31190, y = 32266, z = 8},
        {x = 31191, y = 32266, z = 8}
}

local qtdPlayersToQuest = 10 -- test purpose

 function onUse(cid, item, fromPosition, itemEx, toPosition)
        local player = {}
        local haveAllRequiredActions = false
               
 
                if item.itemid == 1945 then                    
                               
                                for i = 1, qtdPlayersToQuest do
                                        player[i] = getThingfromPos(playerPosition[i])
                                        if isPlayer(player[i].uid) ~= TRUE or getPlayerItemCount(player[i].uid, 6500) < 100 then
                                                doCreatureSay(cid, 'You must conquest all Spirits Temples and each one needs to sacrifice 100 demoniac essence to enter on Spirits of Infernia (SOI).', TALKTYPE_ORANGE_1)
                                                return false
                                        end                            
                                end
                               
                                for i = 1, qtdPlayersToQuest do
                                                player[i] = getThingfromPos(playerPosition[i])                                 
                                                doPlayerRemoveItem(player[i].uid,6500, 100)
                                                doSendMagicEffect(playerPosition[i], CONST_ME_POFF)            
                                                doTeleportThing(player[i].uid, newPosition[i], FALSE)
                                                doSendMagicEffect(newPosition[i], CONST_ME_ENERGYAREA)                                                                 
                                end
                       
                                return true
                       
                elseif item.itemid == 1946 then
                        doPlayerSendCancel(cid, "Sorry, not possible.")
                        return doTransformItem(item.uid, item.itemid - 1)
                end
 
 
 
 end
