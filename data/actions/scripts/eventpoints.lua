local cfg = {
amount = 1
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

if getPlayerLevel(cid) > 2 then
doAccountAddPoints(cid, cfg.amount)
doCreatureSay(cid, "Parabéns! Você recebeu 1 MegaCoin! ", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid), 28)
doRemoveItem(item.uid,1)
else
doPlayerSendCancel(cid,"Você precisa de level 2 para usar este item.")
end
return TRUE
end