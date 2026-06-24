local posBoss = {x = 33408, y = 32420, z = 14}
local posToBoss = {x = 33398, y = 32421, z = 14}
local check = 0

function teleportBoss(cid)
	for x = posBoss.x, posBoss.x  do
		for y = posBoss.y, posBoss.y do
			if isMonster(getThingFromPos({x = x, y = y, z = posBoss.z, stackpos = 253}).uid) then
				doTeleportThing(getThingFromPos({x = x, y = y, z = posBoss.z, stackpos = 253}).uid, posToBoss)
			end
		end
	end
	doTransformItem(getTileThingByPos({x = 33390, y = 32408, z = 14, stackpos = 1}).uid, 9825)
	doTransformItem(getTileThingByPos({x = 33405, y = 32393, z = 14, stackpos = 1}).uid, 9825)
	doTransformItem(getTileThingByPos({x = 33432, y = 32420, z = 14, stackpos = 1}).uid, 9825)
	doTransformItem(getTileThingByPos({x = 33412, y = 32443, z = 14, stackpos = 1}).uid, 9825)
	check = 0
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 47049 and item.itemid == 9825 and getPlayerStorageValue(cid, 320987) <= os.time() then
		setPlayerStorageValue(cid,320987,os.time()+5)
		check = check + 1
		doTransformItem(getTileThingByPos(fromPosition).uid, 9826)
		if check == 4 then
			addEvent(function()
				teleportBoss(cid)
			end, 1000)
		end
	else
		doPlayerSendCancel(cid, "Try the next lever.")
	end
	return true
end