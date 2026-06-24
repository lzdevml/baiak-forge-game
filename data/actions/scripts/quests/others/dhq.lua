-- Stone Item ID.
local stoneItemID = 1355

-- Stone Position.
local stonePos = {x = 236, y = 76, z = 10}

-- Position where the teleport will spawn.
local teleportPos = {x = 237, y = 75, z = 10}

-- Position where the teleporter will teleport you to.
local tpToPos = {x = 251, y = 76, z = 9}

-- Main function.
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == 1945) then
        local stone = getTileItemById(stonePos, stoneItemID)

        if (stone and stone.itemid == stoneItemID) then
            doRemoveItem(stone.uid)
            doCreateTeleport(1387, tpToPos, teleportPos)
            doSendMagicEffect(teleportPos, CONST_ME_TELEPORT)
            doSendMagicEffect(stonePos, CONST_ME_POFF)
            doTransformItem(item.uid, 1946)
        end
    elseif (item.itemid == 1946) then
        local stone = getTileItemById(stonePos, stoneItemID)

        if (stone and stone.itemid == stoneItemID) then
            doRemoveItem(stone.uid)
            doCreateItem(stoneItemID, 1, stonePos)
            doSendMagicEffect(stonePos, CONST_ME_TELEPORT)
            doSendMagicEffect(teleportPos, CONST_ME_POFF)
            doTransformItem(item.uid, 1945)
        end
    end

    if item.uid == 13445 and item.itemid == 1740 then
        if getPlayerStorageValue(cid, 13445) ~= 1 then
            setPlayerStorageValue(cid, 13445, 1) -- Storage Quest
            doPlayerAddItem(cid, 2493, 1)

            -- Adicionar recompensa de outfit ao jogador com base no gênero
            if getPlayerSex(cid) == 0 then -- Jogador feminino
                doPlayerAddOutfit(cid, 542, 1) -- ID do outfit feminino
            elseif getPlayerSex(cid) == 1 then -- Jogador masculino
                doPlayerAddOutfit(cid, 541, 1) -- ID do outfit masculino
            end
			
			 -- Adicione uma montaria com base no sexo do jogador
                if getPlayerSex(cid) == 1 then
                    doPlayerAddMount(cid, 113) -- Blazing Unicorn
                elseif getPlayerSex(cid) == 0 then
                    doPlayerAddMount(cid, 113) -- Blazing Unicorn
                end
		
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você desbloqueou um novo outfit e mount!")
        else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você desbloqueou um novo mount!")
                   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Está vazio.")
        end
    end
    return true
end
