function onUse(cid, item, fromPosition, itemEx, toPosition)

    if (item.itemid == 1945) then
		doTransformItem(item.uid, item.itemid + 1)
		doCreateMonster("Poison Ancient Scarab", {x=965, y=2485, z=8}, false, true);
		doCreateMonster("Poison Ancient Scarab", {x=970, y=2477, z=8}, false, true);

    elseif (item.itemid == 1946) then
		doCreatureSay(cid, "Este item já está na posição correta.", TALKTYPE_ORANGE_1, false, 0, toPosition)
    end
    return true
end