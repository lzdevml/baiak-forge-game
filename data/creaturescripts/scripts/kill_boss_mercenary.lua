local function countTextRed(cid, pos, tempo)
	if tempo > 0 then
		doSendAnimatedText(pos, tempo, TEXTCOLOR_RED)
		doSendMagicEffect(pos, CONST_ME_MAGIC_RED)
		addEvent(countTextRed, 1000, cid, pos, tempo-1)
	else
		doSendMagicEffect(pos, 2)
	end
end

local function countTutorialArrow(cid, pos, tempo)
	if tempo > 0 then
		doSendMagicEffect(pos, CONST_ME_TUTORIALARROW)
		addEvent(countTutorialArrow, 10000, cid, pos, tempo-10)
	end
end

function onKill(cid, target, damage, flags)
if isPlayer(target) then
	return true
end

	local position = getCreaturePosition(target)
	if getCreatureName(target) == "Mercenary" and bit.band(flags, 1) == 1 then
		doCreatureSay(cid, "O teleport vai fechar em 2 minutos.", TALKTYPE_MONSTER, false, 0, position)
		countTextRed(cid, position, 120)
		countTutorialArrow(cid, position, 120)
	end
	return true
end