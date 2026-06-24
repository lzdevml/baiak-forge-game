--edit by Banco dla tnp --

function onStepIn(cid, item, pos)
if item.uid == 61229 then

local pos = getPlayerPosition(cid)
local tppos = {x=144, y=567, z=0}

doTeleportThing(cid,tppos)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)


end
return 1
end