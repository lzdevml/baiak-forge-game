

function onUse(cid, item, frompos, item2, topos)
if item.uid == 27124 then

tppos = {x=161, y=55, z=7}
playerpos = {x=182, y=209, z=7}

doCreateTeleport(5023, playerpos, tppos)
doBroadcastMessage("Um teleporte foi criado no templo para o vento valendo itens.")

doSendMagicEffect(tppos,10)

doSendMagicEffect(playerpos,6)

end
return 1
end