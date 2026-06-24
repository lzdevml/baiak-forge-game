function onThink(interval, lastExecution)
  -- Configurações
    local cor = 20 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[rox-ideal:
Red Skull = 100 frags no dia
Black Skull = 200
Autoloot = Para saber como funciona digite !autoloot
Site = www.rox-ideal.tk
Digite /mute NomeDoPlayer para mutar divulgadores.
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end