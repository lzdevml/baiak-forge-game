MAX_DROPSET_RATE = 1000
LEGEND_SCENARIO_TILES = 7

protectLevers = {
	[43578] = {
		winPosition = {x=161, y=42, z=6},
		items = {
			[5903] =	{rate = 0.01, rare = true}, -- feru hat
			[9693] =	{rate = 0.02, rare = true}, -- addon doll
			[13111] =	{rate = 0.04, rare = true}, -- soulmagic
			[13113] =	{rate = 0.05, rare = true}, -- soultower
			[7443] =	{rate = 0.06}, -- ticket roll
			[13397] =	{rate = 0.07, count = 10}, -- eldritch point
			[12692] =	{rate = 0.08}, -- vip boots
			[8981] =	{rate = 0.09, count = 50}, -- fractal ticket
			[10559] =	{rate = 0.10, count = 5}, -- diamond coin
			[2160] =	{rate = 0.11, count = 100}, -- 1kk
			[13215] =	{rate = 0.12, count = 100}, -- potona kina
			[13214] =	{rate = 0.12, count = 100}, -- potona druid
			[13213] =	{rate = 0.13, count = 100} -- potona spirit
		}
	}
}

if not legendLever then
	legendLever = {}
end

function legendLever:random(cid, obj, item)
	if not rawequal(type(obj), 'table') then
		return error('table of items not found.')
	end

	local position = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
	for i = 1, LEGEND_SCENARIO_TILES do
		local dummy = getTopCreature(position).uid
		if dummy ~= 0 then
			doSendMagicEffect(position, CONST_ME_POFF)
			doRemoveCreature(dummy)
		end
		position.x = position.x + 1
	end

	obj.wonLegend = false
	obj.busy = true
	obj.ownerName = getPlayerName(cid)
	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)

	if not obj.discardLog then
		local log = 'Player: ' .. obj.ownerName
		doWriteLogFile('data/logs/legend_drops_rolled.log', log)
	end
	
	doSendMagicEffect(obj.winPosition, CONST_ME_TUTORIALSQUARE)
	for t = 1, 10 do
		addEvent(doSendMagicEffect, t * 1000, obj.winPosition, CONST_ME_TUTORIALSQUARE)
	end
	
	local addEventSpeed = 10.625
	local rollSpeed = 4100
	local fixPosition = {x = obj.winPosition.x + (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}

	local function randomize()
		local sort = math.random(MAX_DROPSET_RATE)
		local choice = obj.chances[sort]

		local formula = 1.075 + (addEventSpeed / 5000)
		addEventSpeed = addEventSpeed * formula
		if addEventSpeed > 400 then addEventSpeed = addEventSpeed / 1.02 end
		rollSpeed = rollSpeed / formula

		local position = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
		for i = 1, LEGEND_SCENARIO_TILES do
			local dummy = getTopCreature(position).uid
			if dummy ~= 0 then
				if position.x == obj.winPosition.x - math.floor(LEGEND_SCENARIO_TILES/2) then
					doRemoveCreature(dummy)
				else
					doChangeSpeed(dummy, rollSpeed)
					doMoveCreature(dummy, WEST)
				end
			end
			position.x = position.x + 1
		end

		local dummy = doCreateMonster('castledummy', fixPosition, false, true)
		if dummy then
			doChangeSpeed(dummy, rollSpeed)
			doSetCreatureOutfit(dummy, {lookTypeEx = choice})
		end

		if addEventSpeed < 1000 then
			addEvent(randomize, addEventSpeed)
		else
			addEvent(function()
				local pos1 = {x = obj.winPosition.x + (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
				local pos2 = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
				doSendDistanceShoot(pos1, obj.winPosition, 37)
				doSendDistanceShoot(pos2, obj.winPosition, 37)
				doSendMagicEffect(obj.winPosition, 6)
			end, 1000)

			addEvent(function()
				local owner = getCreatureByName(obj.ownerName)
				local rewardId
				local position = obj.winPosition
					local dummy = getTopCreature(position).uid
					if dummy ~= 0 then
						rewardId = getCreatureOutfit(dummy).lookTypeEx
						local addItem
						if owner then
							addItem = doPlayerAddItem(owner, rewardId, obj.items[rewardId].count or 1)
							local rewardStr = (obj.items[rewardId].count or 1) .. 'x ' .. getItemInfo(rewardId).name
							doPlayerSendTextMessage(owner, MESSAGE_INFO_DESCR, 'Parabéns, você encontrou ' .. rewardStr .. '.')
							doCreatureSetNoMove(cid, false)
							if not obj.discardLog then
								local log = 'Player: ' .. getCreatureName(owner) .. ' | Reward: ' .. rewardStr
								doWriteLogFile('data/logs/legend_drops_completed.log', log)
							end
						end
						local foundRare = obj.items[rewardId].rare
						if foundRare then
							local pos = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
							for i = 1, LEGEND_SCENARIO_TILES do
								local dummy = getTopCreature(pos).uid
								if dummy ~= 0 then
									doSetCreatureOutfit(dummy, { lookTypeEx = rewardId })
									doSendMagicEffect(getThingPos(dummy), 37)
									doSendMagicEffect(getThingPos(dummy), CONST_ME_TUTORIALSQUARE)
								end
								pos.x = pos.x + 1
							end
							if owner then
								local itemName = getItemInfo(rewardId).name
								doBroadcastMessage('[Roleta Lever]: O jogador ' .. getCreatureName(owner) .. ' encontrou um ' .. itemName .. ', Parabéns.', MESSAGE_EVENT_ADVANCE)
							end
							obj.wonLegend = true
							self:drawEffects(obj)
						else
							doSendMagicEffect(position, 36)
						end
					end

				obj.busy = false
			end, 1500)
		end
	end

	randomize()
	return true
end

function legendLever:drawEffects(obj)
	local n = 0
	local function decrease()
		if not obj.wonLegend then
			return
		end
		local time = 20 - n
		if time > 0 then
			n = n + 1
			local position = {x = obj.winPosition.x - (math.floor(LEGEND_SCENARIO_TILES/2)), y = obj.winPosition.y, z = obj.winPosition.z}
			for i = 1, LEGEND_SCENARIO_TILES do
				doSendMagicEffect(position, math.random(28, 31))
				position.x = position.x + 1
			end
			addEvent(decrease, 850)
		end
	end

	decrease()
end

function getLegendTable(cid, item)
	if not protectedLevers then -- SEM Tabela Criada
		protectedLevers = protectLevers		
		for aid, lever in pairs(protectedLevers) do
			lever.chances = {}

			for id, content in pairs(lever.items) do
				local rate = content.rate * MAX_DROPSET_RATE
				for i = 1, rate do
					if i < MAX_DROPSET_RATE then
						lever.chances[#lever.chances + 1] = id
					end
				end
			end

			if #lever.chances ~= MAX_DROPSET_RATE then
				print(('>> Warning:LegendaryLever %d is not precise drop, result: %f.'):format(aid, #lever.chances/MAX_DROPSET_RATE))
			end
		end
		return protectedLevers
	else -- Tabela Já Criada
		return protectedLevers
	end
end