function onStepIn(cid, item, pos)

local pos = {x=427, y=504, z=7} -- posição do lugar

if getGlobalStorageValue(321321) ~= getPlayerGuildId(cid) then
doTeleportThing(cid, pos)
doCreatureSay(cid, "Sua guild nao domina mais esse castelo.", TALKTYPE_ORANGE_1)
        return
end
end
