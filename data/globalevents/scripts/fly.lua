function onThink(interval, lastExecution)
  -- Configuraï¿½ï¿½es
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[Esta Preso?
  Sem Saida?
  Preguiça de Andar? 
  Entao Diga 
!fly templo, , !fly depot, !fly hunts, !fly trainer]]
}

  -- Fim de Configuraï¿½ï¿½es

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end