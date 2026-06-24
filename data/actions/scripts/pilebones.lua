function onUse(cid, item, frompos, item2, topos)
	local rand = math.random(1,100)
	if (item.itemid == 11253 and item.actionid == 45492) then
		if rand > 40 then
			doTransformItem(item.uid, 11122)
			doDecayItem(item.uid)
			local effect_Monster = doCreateMonster("guzzlemaw", {x=getCreaturePosition(cid).x - math.random(-1,1), y=getCreaturePosition(cid).y - math.random(-1,1), z=getCreaturePosition(cid).z}, false, true);
			if effect_Monster then
				doSendMagicEffect(getCreaturePosition(effect_Monster), CONST_ME_TELEPORT)
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Amidst the pile of various bones you find a large, hollow part, similar to a pipe.");
				doSendMagicEffect(topos, CONST_ME_MAGIC_GREEN)
				return true
			end

			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You ransack the pile but fail to find any useful parts.");
			doSendMagicEffect(topos, CONST_ME_MAGIC_RED)
		else
			doTransformItem(item.uid, 11122)
			doDecayItem(item.uid)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Amidst the pile of various bones you find a large, hollow part, similar to a pipe.");
			doSendMagicEffect(topos, CONST_ME_MAGIC_GREEN)
		end
	end
	return true
end