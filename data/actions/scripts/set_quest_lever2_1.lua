function onUse(cid, item, fromPosition, itemEx, toPosition)

    if (item.itemid == 1945) then
		doTransformItem(item.uid, item.itemid + 1)
		doCreateMonster("Poison Ancient Scarab", {x=968, y=2456, z=8}, false, true);
		doCreateMonster("Poison Ancient Scarab", {x=980, y=2456, z=8}, false, true);

    elseif (item.itemid == 1946) then
		doCreatureSay(cid, "Este item já está na posição correta.", TALKTYPE_ORANGE_1, false, 0, toPosition)
    end
    return true
end