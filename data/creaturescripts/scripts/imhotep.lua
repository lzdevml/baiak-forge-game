local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2500)
setConditionFormula(condition, -0.75, 0, -0.80, 0)

local haste = createConditionObject(CONDITION_HASTE)
setConditionParam(haste, CONDITION_PARAM_TICKS, math.random(1000,5000))
setConditionFormula(haste, 2.00, 50, 4.00, 100)

local invisible = createConditionObject(CONDITION_INVISIBLE)
setConditionParam(invisible, CONDITION_PARAM_TICKS, math.random(1000,5000))

local pos = getCreaturePosition

local fields = {
	[1] = {item_id = {1497,1499}, effect = CONST_ME_TELEPORT},
	[2] = {item_id = {1492,1493,1494,1500,1501,1502}, effect = CONST_ME_MAGIC_RED},
	[3] = {item_id = {1495,1504}, effect = CONST_ME_MAGIC_BLUE},
	[4] = {item_id = {1496}, effect = CONST_ME_MAGIC_GREEN}
}

local function zabijansko2(p)
	local cid = p.cid
	local loc = p.loc
		doSendMagicEffect(loc, CONST_ME_SMALLPLANTS) 
		local creatureFound = getThingFromPos(loc) 
		if isCreature(creatureFound.uid) and creatureFound.uid ~= cid and getCreatureMaster(creatureFound.uid) ~= cid and getCreatureName(creatureFound.uid) ~= "elite scarab" then
			local hp = getCreatureHealth(creatureFound.uid)
			doCreatureSay(cid, "DOOOOMMM!", TALKTYPE_ORANGE_1, false, 0, getCreaturePosition(cid))
			doCreatureAddHealth(cid, hp*4)
			doSendAnimatedText(pos(cid), hp*4, COLOR_LIGHTGREEN)
			doTargetCombatHealth(cid, creatureFound.uid, COMBAT_EARTHDAMAGE, -hp/3, -hp/4, CONST_ME_CARNIPHILA)
			doTargetCombatHealth(cid, creatureFound.uid, COMBAT_EARTHDAMAGE, -200, -750, CONST_ME_CARNIPHILA)
		end
end

local function efekty(p) 
	local cid = p.cid
	local loc = p.loc
	if isCreature(cid) then
		doSendMagicEffect(loc, CONST_ME_HITBYPOISON)
		doSendMagicEffect(loc, CONST_ME_GREEN_RINGS)
			if p.s < 6 then
				addEvent(efekty, 250, p)
				p.s = p.s + 1
			else
				addEvent(zabijansko2, 1000, {cid = cid, loc = loc} ) 
			end
	end
end

local function zabijansko(p)
	local cid = p.cid
	if isCreature(cid) then
		for nx = (pos(cid).x - 1), (pos(cid).x + 1) do
			for ny = (pos(cid).y - 1), (pos(cid).y + 1) do
				doSendMagicEffect({x=nx,y=ny,z=pos(cid).z}, CONST_ME_BIGPLANTS)
				doSendMagicEffect({x=nx,y=ny,z=pos(cid).z}, CONST_ME_SMALLPLANTS)
				local creatureFound = getThingFromPos( { x = nx, y = ny, z = pos(cid).z, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE }) 
					if isCreature(creatureFound.uid) and creatureFound.uid ~= cid and getCreatureMaster(creatureFound.uid) ~= cid and isInArray({"elite scarab"}, getCreatureName(creatureFound.uid)) == false then
						local hp = getCreatureHealth(creatureFound.uid)
						doCreatureAddHealth(cid, hp*3)
						doSendAnimatedText(pos(cid), hp*3, COLOR_LIGHTGREEN)
						doTargetCombatHealth(cid, creatureFound.uid, COMBAT_EARTHDAMAGE, -hp/3, -hp/4, CONST_ME_SMALLPLANTS)
						doTargetCombatHealth(cid, creatureFound.uid, COMBAT_EARTHDAMAGE, -400, -800, CONST_ME_CARNIPHILA)
					end
			end
		end
	end
end

local function efekt(p) 
	local cid = p.cid
	if isCreature(cid) then
		for nx = (pos(cid).x - 1), (pos(cid).x + 1) do 
			for ny = (pos(cid).y - 1), (pos(cid).y + 1) do 
				doSendMagicEffect( { x = nx, y = ny, z = pos(cid).z }, CONST_ME_SMALLPLANTS)
				if p.n < 5 then
					p.n = p.n + 1
					addEvent(efekt, 500, p)
				end
			end
		end
	end
end

function onThink(cid)
	if isMonster(cid) then
		if math.random(1, 100) <= 25 then
			for nx = (pos(cid).x - 1), (pos(cid).x + 1) do 
				for ny = (pos(cid).y - 1), (pos(cid).y + 1) do 
					doSendMagicEffect( { x = nx, y = ny, z = pos(cid).z }, CONST_ME_SMALLPLANTS) 
				end
			end
			addEvent(zabijansko, 3000, {cid = cid}) 
			addEvent(efekt, 500, {cid = cid, n = 1}) 
			atakuje = true
		end

		if math.random(1, 100) <= 40 then 
				for nx = (pos(cid).x - 1), (pos(cid).x + 1) do 
					for ny = (pos(cid).y - 1), (pos(cid).y + 1) do 
						for i=1, 254 do
							stackpos = i
							local fieldFound = getThingFromPos({x = nx, y = ny, z = pos(cid).z, stackpos = stackpos}) 
							for k=1, #fields do
							if fieldFound.uid ~= 0 and isInArray(fields[k].item_id, fieldFound.itemid) then
								if fieldFound.itemid == 1496 then
									if math.random(1,100) <= 25 then
										doCreateMonster("Elite Scarab", getThingPos(fieldFound.uid), false, true);
										doSendMagicEffect(getThingPos(fieldFound.uid), CONST_ME_GREEN_RINGS)
									else
										doSendMagicEffect(getThingPos(fieldFound.uid), fields[k].effect)
									end
								else
									doSendMagicEffect(getThingPos(fieldFound.uid), fields[k].effect)
								end
								doRemoveItem(fieldFound.uid)
							end
							end
						end
					end
				end
		end
		 
		if math.random(1, 100) <= 15 then 
			if getCreatureHealth(cid) >= 10000 then
				for nx = (pos(cid).x - 5), (pos(cid).x + 5) do 
					for ny = (pos(cid).y - 5), (pos(cid).y + 5) do 
						local creatureFound = getThingFromPos( { x = nx, y = ny, z = pos(cid).z, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE })
						if isCreature(creatureFound.uid) and creatureFound.uid ~= cid and creatureFound.uid == getCreatureTarget(cid) and isSightClear(pos(cid), pos(creatureFound.uid), true) then 
							if math.random(1,5) <= 1 then
								doTeleportThing(cid, getThingPos(creatureFound.uid)) 
								doSendMagicEffect(getThingPos(creatureFound.uid), CONST_ME_TELEPORT) 
							end
						end
					end
				end
			end
		end

		if math.random(1, 100) <= 15 then 
			if getCreatureHealth(cid) <= 10000 then
				if math.random(1,100) <= 50 then
					doAddCondition(cid, haste)
					doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
				end
				if math.random(1,100) <= 25 then
					doAddCondition(cid, invisible)
				end
				if math.random(1,100) <= 25 then
					for nx = (pos(cid).x - 7), (pos(cid).x + 7) do 
					for ny = (pos(cid).y - 7), (pos(cid).y + 7) do 
						local creatureFound = getThingFromPos( { x = nx, y = ny, z = pos(cid).z, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE }) 
						if isPlayer(creatureFound.uid) and creatureFound.uid ~= cid and creatureFound.uid == getCreatureTarget(cid) and isSightClear(pos(cid), pos(creatureFound.uid), true) then
							doAddCondition(creatureFound.uid, condition)
							doSendMagicEffect(getThingPos(creatureFound.uid), CONST_ME_POISONAREA)
							doSendDistanceShoot(getThingPos(cid), getThingPos(creatureFound.uid), CONST_ANI_POISON)
						end
					end
					end
				end
			end
		end

		if math.random(1, 100) <= 20 then 
			for nx = (pos(cid).x - 5), (pos(cid).x + 5) do 
				for ny = (pos(cid).y - 5), (pos(cid).y + 5) do 
					local creatureFound = getThingFromPos( { x = nx, y = ny, z = pos(cid).z, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE }) 
					if isCreature(creatureFound.uid) and creatureFound.uid ~= cid and getCreatureMaster(creatureFound.uid) ~= cid then
						if math.random(1, 3) == 1 then 
							local poss = getThingPos(creatureFound.uid)
							if not(getTilePzInfo(poss) == true or getTileHouseInfo(poss) == true) then
								if isCreature(creatureFound.uid) and creatureFound.uid == getCreatureTarget(cid) and isSightClear(pos(cid), pos(creatureFound.uid), true) then
									doSendDistanceShoot(pos(cid), pos(creatureFound.uid), CONST_ANI_EARTH) 
									doSendMagicEffect(poss, CONST_ME_HITBYPOISON)
									doSendMagicEffect(poss, CONST_ME_GREEN_RINGS)
									doAddCondition(creatureFound.uid, condition)
									addEvent(efekty, 250, {cid = cid, loc = pos(creatureFound.uid), s = 0})
								end
							end
						end
					end
				end
			end
		end
	end
	return true
end