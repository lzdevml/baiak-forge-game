function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) then
		doCreatureAddHealth(cid, -1000)
		doSendAnimatedText(getThingPos(cid), "- 1000", 186)
		doSendMagicEffect(getCreaturePosition(cid),15)
	end
	return true
end