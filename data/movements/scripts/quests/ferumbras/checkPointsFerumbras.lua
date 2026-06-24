function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
		if position.x == 33463 and position.y == 32800 and position.z == 8 and getPlayerStorageValue(cid, 1098013) == 0 then
			setPlayerStorageValue(cid, 1098013, 1)
		end
		if position.x == 33451 and position.y == 32805 and position.z == 9 and getPlayerStorageValue(cid, 1098013) == 1 then
			setPlayerStorageValue(cid, 1098013, 2)
		end
		if position.x == 33452 and position.y == 32805 and position.z == 9 and getPlayerStorageValue(cid, 1098013) == 1 then
			setPlayerStorageValue(cid, 1098013, 2)
		end
		if position.x == 33470 and position.y == 32797 and position.z == 11 and getPlayerStorageValue(cid, 1098013) == 2 or position.x == 33470 and position.y == 32798 and position.z == 11 and getPlayerStorageValue(cid, 1098013) == 2 then
			setPlayerStorageValue(cid, 1098013, 3)
		end
		if position.x == 33476 and position.y == 32791 and position.z == 11 and getPlayerStorageValue(cid, 1098013) == 3 then
			setPlayerStorageValue(cid, 1098013, 4)
		end
		if position.x == 33490 and position.y == 32809 and position.z == 11 and getPlayerStorageValue(cid, 1098013) == 7 then
			setPlayerStorageValue(cid, 1098013, 8)
		end
		if position.x == 33420 and position.y == 32686 and position.z == 13 and getPlayerStorageValue(cid, 1098014) == 0 then
			setPlayerStorageValue(cid, 1098014, 1)
		end
		if position.x == 33443 and position.y == 32755 and position.z == 14 and getPlayerStorageValue(cid, 1098014) == 1 then
			setPlayerStorageValue(cid, 1098014, 2)
		end
		if position.x == 33460 and position.y == 32733 and position.z == 14 and getPlayerStorageValue(cid, 1098014) == 2 then
			setPlayerStorageValue(cid, 1098014, 3)
		end
		if position.x == 33233 and position.y == 31441 and position.z == 11 and getPlayerStorageValue(cid, 1098015) == 0 then
			setPlayerStorageValue(cid, 1098015, 1)
		end
		if position.x == 33228 and position.y == 31494 and position.z == 13 and getPlayerStorageValue(cid, 1098015) == 3 then
			setPlayerStorageValue(cid, 1098015, 4)
		end
		if position.x == 33642 and position.y == 32688 and position.z == 11 and getPlayerStorageValue(cid, 1098016) == 0 then
			setPlayerStorageValue(cid, 1098016, 1)
		end
		if position.x == 33630 and position.y == 32650 and position.z == 12 and getPlayerStorageValue(cid, 1098016) == 2 then
			setPlayerStorageValue(cid, 1098016, 3)
		end
		if position.x == 33615 and position.y == 32619 and position.z == 10 and getPlayerStorageValue(cid, 1098016) == 3 then
			setPlayerStorageValue(cid, 1098016, 4)
		end
		if position.x == 33614 and position.y == 32630 and position.z == 14 and getPlayerStorageValue(cid, 1098017) == 0 then
			setPlayerStorageValue(cid, 1098017, 1)
		end
		if position.x == 33663 and position.y == 32705 and position.z == 13 and getPlayerStorageValue(cid, 1098017) == 1 then
			setPlayerStorageValue(cid, 1098017, 2)
		end
		if position.x == 33430 and position.y == 32449 and position.z == 13 and getPlayerStorageValue(cid, 1098018) == 0 then
			setPlayerStorageValue(cid, 1098018, 1)
		end
		if position.x == 33407 and position.y == 32471 and position.z == 13 and getPlayerStorageValue(cid, 1098018) == 1 then
			setPlayerStorageValue(cid, 1098018, 2)
		end
		if position.x == 33399 and position.y == 32406 and position.z == 15 and getPlayerStorageValue(cid, 1098018) == 3 then
			setPlayerStorageValue(cid, 1098018, 4)
		end
		if position.x == 33406 and position.y == 32334 and position.z == 10 and getPlayerStorageValue(cid, 1098019) == 0 then
			setPlayerStorageValue(cid, 1098019, 1)
		end
		if position.x == 33384 and position.y == 32346 and position.z == 11 and getPlayerStorageValue(cid, 1098019) == 1 then
			setPlayerStorageValue(cid, 1098019, 2)
		end
		if position.x == 33436 and position.y == 32406 and position.z == 12 and getPlayerStorageValue(cid, 1098019) == 2 then
			setPlayerStorageValue(cid, 1098019, 3)
		end
		if position.x == 33415 and position.y == 32379 and position.z == 13 and getPlayerStorageValue(cid, 1098019) == 4 then
			setPlayerStorageValue(cid, 1098019, 5)
		end
		if position.x == 33275 and position.y == 32391 and position.z == 9 and getPlayerStorageValue(cid, 1098021) < 1 then
			setPlayerStorageValue(cid, 1098021, 1)
		end
	end
end