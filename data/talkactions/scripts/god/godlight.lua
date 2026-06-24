local lightFull = createConditionObject(CONDITION_LIGHT)
setConditionParam(lightFull, CONDITION_PARAM_LIGHT_LEVEL, 16)
setConditionParam(lightFull, CONDITION_PARAM_LIGHT_COLOR, 215)
setConditionParam(lightFull, CONDITION_PARAM_TICKS, -1)

local blue = createConditionObject(CONDITION_LIGHT)
setConditionParam(blue, CONDITION_PARAM_LIGHT_LEVEL, 7)
setConditionParam(blue, CONDITION_PARAM_LIGHT_COLOR, 35)
setConditionParam(blue, CONDITION_PARAM_TICKS, -1)

local gold = createConditionObject(CONDITION_LIGHT)
setConditionParam(gold, CONDITION_PARAM_LIGHT_LEVEL, 7)
setConditionParam(gold, CONDITION_PARAM_LIGHT_COLOR, 205)
setConditionParam(gold, CONDITION_PARAM_TICKS, -1)

local pink = createConditionObject(CONDITION_LIGHT)
setConditionParam(pink, CONDITION_PARAM_LIGHT_LEVEL, 7)
setConditionParam(pink, CONDITION_PARAM_LIGHT_COLOR, 185)
setConditionParam(pink, CONDITION_PARAM_TICKS, -1)

local green = createConditionObject(CONDITION_LIGHT)
setConditionParam(green, CONDITION_PARAM_LIGHT_LEVEL, 7)
setConditionParam(green, CONDITION_PARAM_LIGHT_COLOR, 30)
setConditionParam(green, CONDITION_PARAM_TICKS, -1)

local red = createConditionObject(CONDITION_LIGHT)
setConditionParam(red, CONDITION_PARAM_LIGHT_LEVEL, 7)
setConditionParam(red, CONDITION_PARAM_LIGHT_COLOR, 180)
setConditionParam(red, CONDITION_PARAM_TICKS, -1)



function onSay(cid, words, param)
	if param == "0" then
		doRemoveCondition(cid, CONDITION_LIGHT)
	elseif param == "full" then doAddCondition(cid, lightFull)
	elseif param == "blue" then doAddCondition(cid, blue)	
	elseif param == "gold" then doAddCondition(cid, gold)	
	elseif param == "pink" then doAddCondition(cid, pink)
	elseif param == "green" then doAddCondition(cid, green)
	elseif param == "red" then doAddCondition(cid, red)

	end
	return true
end

