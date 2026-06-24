local MIN_HEALTH = 800
local MAX_HEALTH = 1150
local MIN_MANA = 530
local MAX_MANA = 780
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

	if((not(isPaladin(itemEx.uid)) or getPlayerLevel(itemEx.uid) < 80) and getPlayerCustomFlagValue(itemEx.uid, PlayerCustomFlag_GamemasterPrivileges) == FALSE) then
		doCreatureSay(itemEx.uid, "Apenas paladinos de nível 80 ou acima podem beber esse fluido.", TALKTYPE_RED_1)
		return TRUE
	end

	if doCreatureAddHealth(itemEx.uid, math.random(MIN_HEALTH, MAX_HEALTH)) == LUA_ERROR or doPlayerAddMana(itemEx.uid, math.random(MIN_MANA, MAX_MANA)) == LUA_ERROR then
		return FALSE
	end

	doAddCondition(cid, exhaust)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Aaaah meu cu...", TALKTYPE_ORANGE_1)
	return TRUE
end
