function onUse(cid, item, frompos, item2, topos)

itempos = {x=165, y=53, z=7, stackpos=1}
itemid = 1387
item3 = getThingfromPos(itempos)

if item.itemid == 1945 then
doTransformItem(item.uid,1946)
doRemoveItem(item3.uid,1)
elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
doCreateTeleport(itemid, {x=182, y=209, z=7}, itempos)
end

return 1
end