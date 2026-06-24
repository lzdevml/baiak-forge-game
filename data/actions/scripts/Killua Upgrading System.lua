--- Sistema de Upgrade de itens feito por Killua.
--- Sistema feito com base no do Bronson Server.

local vocations = {1, 2, 4, 5, 6, 7, 8} -- Vocações que podem refinar itens

local ids_bloqueados = {2160, 5706, 2463} -- Itens que não podem ser refinados

local controle = {
    {level = 0, quantOre = 1, chance = 100}, -- Level do item, quantidade de Iron Ore necessaria, chance de sucesso
    {level = 1, quantOre = 2, chance = 90},
    {level = 2, quantOre = 3, chance = 80},
    {level = 3, quantOre = 4, chance = 70},
    {level = 4, quantOre = 5, chance = 60},
    {level = 5, quantOre = 6, chance = 50},
    {level = 6, quantOre = 7, chance = 40},
    {level = 7, quantOre = 8, chance = 30},
    {level = 8, quantOre = 9, chance = 20},
    {level = 9, quantOre = 10, chance = 10}
}

function getItemLevel(uid)
    if uid > 0 then
        return getItemAttribute(uid, "lvl") or 0
    end
    return false
end

function doItemAddLevel(uid, count)
    if uid > 0 and tonumber(count) > 0 then
        return doItemSetAttribute(uid, "lvl", getItemLevel(uid) + count)
    end
    return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if not isInArray(vocations, getPlayerVocation(cid)) then
        return doPlayerSendCancel(cid, "Sua vocacao nao pode refinar.")
    elseif isInArray(ids_bloqueados, itemEx.uid) then
        return doPlayerSendCancel(cid, "Este item nao pode ser refinado.")
    end 
    
    if getItemInfo(itemEx.itemid).attack > 0 or getItemInfo(itemEx.itemid).defense > 0 or getItemInfo(itemEx.itemid).armor > 0 then
        for _, upgrade in pairs(controle) do
            local atk = getItemAttribute(itemEx.uid, "attack") or getItemInfo(itemEx.itemid).attack
            local def = getItemAttribute(itemEx.uid, "defense") or getItemInfo(itemEx.itemid).defense
            local arm = getItemAttribute(itemEx.uid, "armor") or getItemInfo(itemEx.itemid).armor
            local chance = math.random(1, 100)
            if getItemLevel(itemEx.uid) == upgrade.level then
               if doPlayerRemoveItem(cid, 5880, upgrade.quantOre) then
                   doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                  if chance <= upgrade.chance then
                      if getItemLevel(itemEx.uid) == 0 then
                          doItemSetAttribute(itemEx.uid, "description", "Esse item foi refinado por" ..getCreatureName(cid))
                      end
                      doItemAddLevel(itemEx.uid, 1)
                      doItemSetAttribute(itemEx.uid, "name", getItemNameById(itemEx.itemid).. " + " ..getItemLevel(itemEx.uid))
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce refinou com sucesso! Agora seu "..getItemNameById(itemEx.itemid).." eh level " ..getItemLevel(itemEx.uid))
                      if getItemInfo(itemEx.itemid).attack > 0 then
                          doItemSetAttribute(itemEx.uid, "attack", atk + 1)
                          return true
                      elseif getItemInfo(itemEx.itemid).armor > 0 then
                          doItemSetAttribute(itemEx.uid, "armor", arm + 1)
                          return true
                      elseif getItemInfo(itemEx.itemid).defense > 0 and getItemInfo(itemEx.itemid).attack <= 0 then
                          doItemSetAttribute(itemEx.uid, "defense", def + 1)
                          return true
                      end
                  else
                      doTransformItem(itemEx.uid, 2256)
                      doItemSetAttribute(itemEx.uid, 'name', "metal trash")
                      doItemSetAttribute(itemEx.uid, 'attack', 0)
                      doItemSetAttribute(itemEx.uid, 'armor', 0)
                      doItemSetAttribute(itemEx.uid, 'defense', 0)
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce falhou.")
                      return true
                  end
              else
                  doPlayerSendCancel(cid, "Voce nao tem iron ores o suficiente. Voce precisa de "..upgrade.quantOre.." iron ores.")
              end
          end
      end
  else
      doPlayerSendCancel(cid, "Esse item nao pode ser refinado.")
  end
  return true
end