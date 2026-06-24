function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end
	
	local position = getCreaturePosition(target)
	local t = getThingPos(target)
    if isPlayer(cid) and bit.band(flags, 1) == 1 then
		if getCreatureName(target) == "Liqour Spirit" and not(getCreatureByName("Leiden")) then
			doCreateMonster("Leiden", t, false, true);
			doCreatureSay(cid, "IT'S NOT THAT EASY, MORTALS! FEEL THE POWER OF A GOD!", TALKTYPE_ORANGE_1, false, 0, position)
		elseif getCreatureName(target) == "Leiden" and not(getCreatureByName("Leiden")) then
			doCreateMonster("Leiden", t, false, true);
			doCreatureSay(cid, "IT'S NOT THAT EASY, MORTALS! FEEL THE POWER OF A GOD!", TALKTYPE_MONSTER, false, 0, position)
		elseif getCreatureName(target) == "Leiden" and not(getCreatureByName("Ravennous Hunger")) then
			doCreateMonster("Ravennous Hunger", t, false, true);
			doCreatureSay(cid, "IT'S NOT THAT EASY, MORTALS! FEEL THE POWER OF A GOD!", TALKTYPE_MONSTER, false, 0, position)
		end
	end
    return true
end