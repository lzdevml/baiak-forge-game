function onSay(cid, words, param)
if doPlayerRemoveMoney(cid,3000000) then
    doPlayerAddItem(cid,8981,1)
    doSendMagicEffect(getPlayerPosition(cid),12)
    doPlayerSendTextMessage(cid,22,"Voce comprou Vip Days!")
else
    doPlayerSendCancel(cid,"Voce não tem grana Suficiente!.")
    doSendMagicEffect(getPlayerPosition(cid),2)
end
return TRUE
end