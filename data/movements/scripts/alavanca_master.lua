local magic_sulphur = {x = 589, y = 403, z = 9, stackpos=255}
local playernewPos =  {x = 585, y = 407, z = 9}
local playerposcancel = {x = 585, y = 403, z = 9}
 
function onStepIn(cid, item, position, fromPosition)
if (not isPlayer(cid)) then
	return false
end

	local coin = getThingfromPos(magic_sulphur)
	if isPlayer(cid) and coin.itemid == 6527 then
		if doRemoveItem(coin.uid, 5) then
			doTeleportThing(cid, playernewPos)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doSendMagicEffect(magic_sulphur, CONST_ME_FIREAREA)
		else
			doCreatureSay(cid, "Você precisa por 5 Event Coins na forja como sacrificio para os deuses.", TALKTYPE_ORANGE_1)
			doTeleportThing(cid, playerposcancel)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	else
		doCreatureSay(cid, "Os Deuses cobram 5 Event Coins como ritual de passagem.", TALKTYPE_ORANGE_1)
		doTeleportThing(cid, playerposcancel)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end