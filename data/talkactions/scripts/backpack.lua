function onSay(cid, words, param)
    if doPlayerRemoveMoney(cid, 5000) then
        doPlayerAddItem(cid, 10518, 1)
        doSendMagicEffect(getCreaturePosition(cid),13)
        doCreatureSay(cid, "Você comprou uma backpack!", TALKTYPE_ORANGE_1)
    else
        doCreatureSay(cid, "Você não possui dinheiro o suficiente.", TALKTYPE_ORANGE_1)
        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    end
end