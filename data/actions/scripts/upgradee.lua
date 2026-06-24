--- Sistema de Upgrade de itens feito por Killua.
--- Sistema feito com base no do Bronson Server.

local vocations = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12} -- Vocações que podem refinar itens

local ids_bloqueados = {2160, 5706, 2463} -- Itens que não podem ser refinados

local searchplayer = getCreatureName(cid)

local controle = {
    {level = 0, quantOre = 0, chance = 100}, -- Level do item, quantidade de Iron Ore necessaria, chance de sucesso
    {level = 1, quantOre = 0, chance = 100},
    {level = 2, quantOre = 0, chance = 100},
    {level = 3, quantOre = 0, chance = 100},
    {level = 4, quantOre = 0, chance = 100}
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
        return doPlayerSendCancel(cid, "This is not a valid upgrade tool.")
    end 
    
    if getItemInfo(itemEx.itemid).attack > 0 or getItemInfo(itemEx.itemid).defense > 0 or getItemInfo(itemEx.itemid).armor > 0 then
        for _, upgrade in pairs(controle) do
            local atk = getItemAttribute(itemEx.uid, "attack") or getItemInfo(itemEx.itemid).attack
            local def = getItemAttribute(itemEx.uid, "defense") or getItemInfo(itemEx.itemid).defense
            local arm = getItemAttribute(itemEx.uid, "armor") or getItemInfo(itemEx.itemid).armor
            local chance = math.random(1, 100)
            if getItemLevel(itemEx.uid) == upgrade.level then
               if doPlayerRemoveItem(cid, 8301, upgrade.quantOre) then
                   doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                  if chance <= upgrade.chance then
                      if getItemLevel(itemEx.uid) == 0 then
                          doItemSetAttribute(itemEx.uid, "description", "Esse item foi refinado por" ..getCreatureName(cid))
                      end
                      doItemAddLevel(itemEx.uid, 1)
                      doItemSetAttribute(itemEx.uid, "name", getItemNameById(itemEx.itemid).. " + " ..getItemLevel(itemEx.uid))
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have upgraded "..getItemNameById(itemEx.itemid).." to level +" ..getItemLevel(itemEx.uid))
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
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have failed in upgrade.")
                      return true
                  end
              else
                  doPlayerSendCancel(cid, "error report to GameMaster.")
              end
          end
      end
  else
      doPlayerSendCancel(cid, "This is not a valid upgrade tool.")
  end
  return true
end   