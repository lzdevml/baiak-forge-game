function onThink(interval, lastExecution)
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
doBroadcastMessage("[ATENCAO] Hoje entre as 03:00 e 05:00 de Brasilia estaremos em manutencao e o servidor podera cair algumas vezes. Estaremos fazendo alguns updates e arrumando os problemas de lag, freezes e dash!", cor)
return TRUE
end
