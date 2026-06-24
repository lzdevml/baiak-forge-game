function onUse(cid, item, frompos, item2, topos)
  local sto, sto20 = getPlayerStorageValue(cid, 722362), getPlayerStorageValue(cid, 722384)
  
  if sto == -1 then
    if sto20 == -1 then
      if doRemoveItem(item.uid, 1) then
        doPlayerSetStorageValue(cid, 722384, tonumber(os.time() + 3600 * 2))
        doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] + 0.2)
        doPlayerSendTextMessage(cid, 22, "Você recebeu 20% a mais de exp por 2 horas. Use !doubleexp para saber quanto tempo de exp bonus você ainda tem.")
        doSendMagicEffect(frompos, 13)
        addEvent(function()
          if isPlayer(cid) then
            doPlayerSetExperienceRate(cid, getPlayerRates(cid)[8] - 0.2)
            doPlayerSetStorageValue(cid, 722384, -1)
            doPlayerSendTextMessage(cid, 22, "O efeito acabou e você voltou a receber exp normalmente.")
          end
        end, 2 * 60 * 60 * 1000)  -- 2 horas em milissegundos
      end
    else
      doPlayerSendCancel(cid, "Você já está recebendo o bônus de 20% de experiência.")
    end
  else
    doPlayerSendCancel(cid, "Você não pode usar double exp e o bônus de 20% de experiência ao mesmo tempo.")
  end
  
  return true
end

function onSay(cid, words, param)
  if param == "!doubleexp" then
    local sto, sto20 = getPlayerStorageValue(cid, 722362), getPlayerStorageValue(cid, 722384)
    local currentTime = os.time()

    if sto == -1 then
      if sto20 == -1 then
        doPlayerSendTextMessage(cid, 22, "Você não tem nenhum bônus de experiência ativo no momento.")
      else
        local timeLeft = sto20 - currentTime
        doPlayerSendTextMessage(cid, 22, "Você tem um bônus de 20% de experiência ativo. Tempo restante: " .. math.floor(timeLeft / 60) .. " minutos")
      end
    else
      doPlayerSendTextMessage(cid, 22, "Você não pode usar double exp e o bônus de 20% de experiência ao mesmo tempo.")
    end
  end

  return true
end
