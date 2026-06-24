-- == Blood Castle Event por Killua == --
function onSay(cid, words, param, channel)
     local plural = bloodconfig.tempoTP == 1 and "minuto" or "minutos"
     local plurals = bloodconfig.tempoAberto == 1 and "minuto" or "minutos"
     doBroadcastMessage("[Blood Castle] O portal para o evento vai ser aberto em " .. bloodconfig.tempoTP .. " " .. plural .. ", nao percam!")
     addEvent(createTeleportb, bloodconfig.tempoTP*60*1000)
     addEvent(doBroadcastMessage, bloodconfig.tempoTP*60*1000, "[Blood Castle] O teleport para o evento foi aberto no templo e vai sumir em " .. bloodconfig.tempoAberto .. " " .. plurals .. ". Se apressem!")
     addEvent(removeTpb, bloodconfig.tempoTP+bloodconfig.tempoAberto*60*1000)
     addEvent(checkBlood, bloodconfig.tempoTP+bloodconfig.tempoAberto*60*1000+60*1000)
     addEvent(Guarantee, bloodconfig.tempoMaximo*60*1000+15000)
     return true
end