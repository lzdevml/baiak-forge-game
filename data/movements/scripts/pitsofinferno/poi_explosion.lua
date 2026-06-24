function onStepIn(cid, item, frompos, item2, topos) 

storage = 45114

elo1 = {x = 207, y = 450, z = 13}
elo2 = {x = 207, y = 451, z = 13}
elo3 = {x = 207, y = 452, z = 13}
elo4 = {x = 207, y = 453, z = 13}
elo5 = {x = 207, y = 454, z = 13}
elo6 = {x = 207, y = 455, z = 13}
if getPlayerStorageValue(cid, storage) == -1 then
         setPlayerStorageValue(cid, storage, 1)
if item.uid == 14551 then
 doSendMagicEffect(elo1,4)
 doSendMagicEffect(elo2,4)
 doSendMagicEffect(elo3,4)
 doSendMagicEffect(elo4,4)
 doSendMagicEffect(elo5,4)
 doSendMagicEffect(elo6,4)
end 
end
end
