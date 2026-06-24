function onUse(cid, item, frompos, item2, topos)

if item2.itemid == 0 then

return FALSE

end


if item.itemid == 2553 and item2.itemid == 355 and item2.actionid == 777 then

doTransformItem(item2.uid, 392)

doSendMagicEffect(topos, CONST_ME_POFF)

doDecayItem(item2.uid)

doSetItemActionId(item2.uid,777)

else

return FALSE

end

return TRUE

end