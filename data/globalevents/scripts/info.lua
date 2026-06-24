function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={

[[ God Styller Information: 
Duvidas? Acesse nosso facebook: www.facebook.com/godstyller - Chat online de segunda a sexta. ]]


}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end