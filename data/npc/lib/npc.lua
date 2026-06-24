function selfSayChannel(cid, message)
	return selfSay(message, cid, false)
end

function selfMoveToThing(id)
	errors(false)
	local thing = getThing(id)

	errors(true)
	if(thing.uid == 0) then
		return
	end

	local t = getThingPosition(id)
	selfMoveTo(t.x, t.y, t.z)
	return
end

function selfMoveTo(x, y, z)
	local position = {x = 0, y = 0, z = 0}
	if(type(x) ~= "table") then
		position = Position(x, y, z)
	else
		position = x
	end

	if(isValidPosition(position)) then
		doSteerCreature(getNpcId(), position)
	end
end

function selfMove(direction, flags)
	local flags = flags or 0
	doMoveCreature(getNpcId(), direction, flags)
end

function selfTurn(direction)
	doCreatureSetLookDirection(getNpcId(), direction)
end

function getNpcDistanceTo(id)
	errors(false)
	local thing = getThing(id)

	errors(true)
	if(thing.uid == 0) then
		return nil
	end

	local c = getCreaturePosition(id)
	if(not isValidPosition(c)) then
		return nil
	end

	local s = getCreaturePosition(getNpcId())
	if(not isValidPosition(s) or s.z ~= c.z) then
		return nil
	end

	return math.max(math.abs(s.x - c.x), math.abs(s.y - c.y))
end

function doMessageCheck(message, keyword, exact)
	local exact = exact or false
	if(type(keyword) == "table") then
		return isInArray(keyword, message, exact)
	end

	if(exact) then
		return message == keyword
	end

	local a, b = message:lower(), keyword:lower()
	return a == b or (a:find(b) and not a:find('(%w+)' .. b))
end

function doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
	local amount = amount or 1
	local subType = subType or 0
	local ignoreCap = ignoreCap or false
	local inBackpacks = inBackpacks or false
	local backpack = backpack or 1988
	local item = 0

	if isItemStackable(itemid) then
		if(inBackpacks) then
			stuff = doCreateItemEx(backpack, 1)
			item = doAddContainerItem(stuff, itemid, math.min(100, amount))
		else
			stuff = doCreateItemEx(itemid, math.min(100, amount))
		end
		
		local ret = doPlayerAddItemEx(cid, stuff, ignoreCap)
		if ret == RETURNVALUE_NOERROR then
			return amount,0
		end
	end

	local a = 0
	if inBackpacks then
		local container, b = doCreateItemEx(backpack, 1), 1
		for i = 1, amount do
			item = doAddContainerItem(container, itemid, subType)
			if(itemid == ITEM_PARCEL) then
				doAddContainerItem(item, ITEM_LABEL)
			end

			if(isInArray({(getContainerCapById(backpack) * b), amount}, i)) then
				if(doPlayerAddItemEx(cid, container, ignoreCap) ~= RETURNVALUE_NOERROR) then
					b = b - 1
					break
				end

				a = i
				if(amount > i) then
					container = doCreateItemEx(backpack, 1)
					b = b + 1
				end
			end
		end

		return a, b
	end

	for i = 1, amount do
		item = doCreateItemEx(itemid, subType)
		if(itemid == ITEM_PARCEL) then
			doAddContainerItem(item, ITEM_LABEL)
		end

		if(doPlayerAddItemEx(cid, item, ignoreCap) ~= RETURNVALUE_NOERROR) then
			break
		end

		a = i
	end

	return a, 0
end

function doRemoveItemIdFromPosition(id, n, position)
	local thing = getTileItemById(position, id)
	if(thing.itemid < 101) then
		return false
	end

	doRemoveItem(thing.uid, n)
	return true
end

function getNpcName()
	return getCreatureName(getNpcId())
end

function getNpcPosition()
	return getThingPosition(getNpcId())
end

function selfGetPosition()
	local t = getThingPosition(getNpcId())
	return t.x, t.y, t.z
end

msgcontains = doMessageCheck
moveToPosition = selfMoveTo
moveToCreature = selfMoveToThing
selfMoveToCreature = selfMoveToThing
selfMoveToPosition = selfMoveTo
isPlayerPremiumCallback = isPremium
doPosRemoveItem = doRemoveItemIdFromPosition
doRemoveItemIdFromPos = doRemoveItemIdFromPosition
doNpcBuyItem = doPlayerRemoveItem
doNpcSetCreatureFocus = selfFocus
getNpcCid = getNpcId
getDistanceTo = getNpcDistanceTo
getDistanceToCreature = getNpcDistanceTo
getNpcDistanceToCreature = getNpcDistanceTo
getNpcPos = getNpcPosition

if not eventDelayedSay then eventDelayedSay = {} end
 
local func = function(pars)
        if isCreature(pars.cid) == TRUE and isPlayer(pars.pcid) == TRUE then
                doCreatureSay(pars.cid, pars.text, pars.type, false, pars.pcid, getCreaturePosition(pars.cid))
        end
end
 
function doCreatureSayWithDelay(cid, text, type, delay, e, pcid)
        if isCreature(cid) == TRUE and isPlayer(pcid) == TRUE then
                e.event = addEvent(func, delay < 1 and 1000 or delay, {cid=cid, text=text, type=type, e=e, pcid=pcid})
        end
end
 
function cancelNPCTalk(events)
        for i = 1, #events do
                stopEvent(events[i].event)
        end
        events = nil
end
 
function doNPCTalkALot(msgs, interval, pcid)
        if eventDelayedSay[pcid] then
                cancelNPCTalk(eventDelayedSay[pcid])
        end
        if isPlayer(pcid) == TRUE then
                eventDelayedSay[pcid] = {}
                local ret = {}
                for i = 1, #msgs do
                        eventDelayedSay[pcid][i] = {}
                        doCreatureSayWithDelay(getNpcCid(), msgs[i], TALKTYPE_PRIVATE_NP, ((i-1) * (interval or 10000)) + 1000, eventDelayedSay[pcid][i], pcid)
                        table.insert(ret, eventDelayedSay[pcid][i])
                end
                return(ret)
        end
end