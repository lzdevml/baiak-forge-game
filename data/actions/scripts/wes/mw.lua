local function isWalkable(pos, creature, proj, pz)-- by Nord
	if (getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0) then return false end
	if (getTopCreature(pos).uid > 0 and creature) then return false end
	if (getTileInfo(pos).protection and pz) then return false, true end
	local n = not proj and 3 or 2
	for i = 0, 255 do
		pos.stackpos = i
		local tile = getTileThingByPos(pos)
		if (tile.itemid ~= 0 and not isCreature(tile.uid)) then
			if (hasProperty(tile.uid, n) or hasProperty(tile.uid, 7)) then
				return false
			end
		end
	end
	return true
end
 
local function doSendAnimatedText2(pos, value, color, player)
    if(not tonumber(value))then
        return error("arg #2 in doSendAnimatedText is not a number")
    end
 
    if(isPlayer(player))then
        doPlayerSendTextMessage(player, MESSAGE_EXPERIENCE, "", value, color, pos)
    else
        for _, v in ipairs(getSpectators(pos, 7, 5, true)) do
            if(isPlayer(v))then
                doPlayerSendTextMessage(v, MESSAGE_EXPERIENCE, "", value, color, pos)
            end
        end
    end
end
 
local version_check = 03 --if you use 0.3.7, then write 037! or if you use 0.3, write 03!
 
local random_txt_onsay = true -- When casting a wall, should the player cast random catch phrases?
 
local cyko = {
	timer = 15, -- How long will the magic wall stay
	cooldown = 1, -- How long to cast another one
    	words = {"I LOVE MAGIC WALL!","HAHA YOU CANT GET ME","BIATCH","BOOM"}, -- Here can you add or edit the catch phrases!
	txt = "END", -- Text when it removes
    	color_on_timer = TEXTCOLOR_BLUE, -- Color on countdown
    	empty_storage = 1000 -- Please set a unused storage
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
    	if(getPlayerStorageValue(cid, cyko.empty_storage) > os.time()) then
		return (doPlayerSendCancel(cid, "You are exhausted."))
	end                  
	if (getTileInfo(getThingPos(cid)).protection or getTileInfo(toPosition).protection) then
		return (doPlayerSendCancel(cid, "You can't cast magic wall while your inside protection zone."))
	end
	local function removemw()
		if(getTileItemById(toPosition, 1497).uid > 0) then
			if (version_check == 03) then
				return (doSendAnimatedText(toPosition,cyko.txt, TEXTCOLOR_RED) and doSendMagicEffect(toPosition, CONST_ME_ENERGYHIT) and doRemoveItem(getTileItemById(toPosition, 1497).uid))
			else
				return (doSendMagicEffect(toPosition, CONST_ME_ENERGYHIT) and doRemoveItem(getTileItemById(toPosition, 1497).uid))
			end
		end
	end 
	for mw = 1, cyko.timer do
		local o = cyko.timer - mw
		if (version_check == 03) then
			addEvent(doSendAnimatedText, mw * 1000, toPosition, o > 0 and tostring(o), cyko.color_on_timer)
		else
			addEvent(doSendAnimatedText2, mw * 1000, toPosition, o > 0 and tostring(o), cyko.color_on_timer)
		end
	end 
	if (isWalkable(toPosition, false, false, true, true, true)) then 
		doCreateItem(1497, toPosition)
		setPlayerStorageValue(cid, cyko.storage, os.time() + cyko.cooldown)
		addEvent(removemw, cyko.timer * 1000)
		doSendMagicEffect(toPosition, CONST_ME_ENERGYAREA) 
		if (random_txt_onsay == true) then
			doCreatureSay(cid, cyko.words[math.random(#cyko.words)], TALKTYPE_ORANGE_1)
		end
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHROOM)
	end
	return true
end