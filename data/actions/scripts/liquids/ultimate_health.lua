local MIN = 1650
local MAX = 2000
local EMPTY_POTION = 7635

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isPlayer(itemEx.uid) == FALSE then
		return FALSE
	end

	if hasCondition(cid, CONDITION_EXHAUST_HEAL) == TRUE then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return TRUE
	end

	if((not(isKnight(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 130) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "
Somente cavaleiros de nível 130 ou acima podem beber esse fluido.", TALKTYPE_GREEN_1)
		return TRUE
	end

	if doCreatureAddHealth(itemEx.uid, math.random(MIN, MAX)) == LUA_ERROR then
		return FALSE
	end

	doAddCondition(cid, exhaust)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Aaaah meu cu...", TALKTYPE_ORANGE_1)
	return TRUE
end
