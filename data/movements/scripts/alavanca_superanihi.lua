local magic_sulphur = {x=201, y=118, z=11, stackpos=255}
local playernewPos =  {x=200, y=120, z=11}
local playerposcancel = {x=198, y=116, z=11}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	local coin = getThingfromPos(magic_sulphur)
	if isPlayer(cid) and coin.itemid == 12422 then
		if doRemoveItem(coin.uid, 10) then
			doTeleportThing(cid, playernewPos)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doSendMagicEffect(magic_sulphur, CONST_ME_FIREAREA)
		else
			doCreatureSay(cid, "Você precisa por 10 chaos essences na forja como sacrificio para os deuses.", TALKTYPE_ORANGE_1)
			doTeleportThing(cid, playerposcancel)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	else
		doCreatureSay(cid, "Os Deuses cobram 10 chaos essences como ritual de passagem.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, playerposcancel)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end