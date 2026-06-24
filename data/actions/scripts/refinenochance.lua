--- Perfect refine system by Mock the bear (MTB).
--- Email: [email]mock_otnet@hotmail.com[/email]
local gain = {
	gainArmor='&p+1',loseArmor='&p-1',
	gainShield='&s+2',loseShield='&s-2',
	gainAttack='&a+2',loseAttack='&a-2',
	gainDefense='&d+2',loseDefense='&d-2',
	maxlvl = 6,
	blocked_ids = {2488,8881}
}

-- &a = weapon attack
-- &d = weapon defense
-- &s = shield defense
-- &p = armor defense
-- # = nivel do item
-- @ = max level

if not setItemName then
	function setItemName(uid,name)
		return doItemSetAttribute(uid,'name',name)
	end
	function setItemArmor(uid,name)
		return doItemSetAttribute(uid,'armor',name)
	end
	function setItemDefense(uid,name)
		return doItemSetAttribute(uid,'defense',name)
	end
	function setItemAttack(uid,name)
		return doItemSetAttribute(uid,'attack',name)
	end
	function getItemAttack(uid)
		return getItemAttribute(uid,'attack')
	end
	function getItemDefense(uid)
		return getItemAttribute(uid,'defense')
	end
	function getItemArmor(uid)
		if type(uid) == 'number' then
			return getItemAttribute(uid,'armor')
		else
			return getItemInfo(uid.itemid).armor
		end
	end
end

function isArmor(uid) -- Function by Mock the bear.
	if (getItemArmor(uid) and getItemArmor(uid) ~= 0 and not getItemInfo(uid.itemid,'attack') and not getItemInfo(uid.itemid,'defense') and getItemWeaponType(uid.uid) == 0) then
		return true
	end
	return false
end

function isWeapon(uid) -- Function by Mock the bear.
	uid = uid or 0
	local f = getItemWeaponType(uid)
	if f == 1 or f == 2 or f == 3 or f == 4 then
		return true
	end
	return false
end

function isShield(uid) -- Function by Mock the bear.
	uid = uid or 0
	if getItemWeaponType(uid) == 5 then
		return true
	end
	return false
end
 
function getWeaponLevel(uid) -- Function by Mock the bear.
   uid = uid or 0
   local name = getItemName(uid)
   local lvl = string.match(name,'+(%d)')
   return tonumber(lvl) or 0
end

function doTransform(s,i) -- Function by Mock the bear.
    local c = string.gsub(s,'@',gain.maxlvl)
    local c = string.gsub(c,'&a',getItemAttack(i.uid) or getItemInfo(i.itemid).attack)
    local c = string.gsub(c,'&d',getItemDefense(i.uid) or getItemInfo(i.itemid).defense)
    local c = string.gsub(c,'&s',getItemDefense(i.uid) or getItemInfo(i.itemid).defense)
    local c = string.gsub(c,'&p',getItemArmor(i.uid) or getItemInfo(i.itemid).armor)
    local c = string.gsub(c,'#',getWeaponLevel(i.uid))
    local q,err = loadstring('return '..c)
    assert(q,err)
    return assert(q())
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	toPosition.stackpos = 255
	if isInArray(gain.blocked_ids, itemEx.itemid) or getItemWeaponType(itemEx.uid) > 4 or itemEx.itemid == 0 then
		doPlayerSendTextMessage(cid, 24,"You cant refine this item.")
		return true
	end
	if not isCreature(itemEx.uid) then
		local LevelItem = getWeaponLevel(itemEx.uid)
		if LevelItem <= gain.maxlvl then
			setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(LevelItem + 1))
			doPlayerSendTextMessage(cid, 24,"Your item has been upgrated to +"..(LevelItem + 1)..".")
			doSendMagicEffect(toPosition, 12)
			if isArmor(itemEx) then
				local get = doTransform(gain.gainArmor,itemEx)
				setItemArmor(itemEx.uid,get)
			elseif isWeapon(itemEx.uid) then
				setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx))
				setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx))
			elseif isShield(itemEx.uid) then
				setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx))
			else
				setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx))
			end
			doRemoveItem(item.uid,1)
		else
			doSendMagicEffect(toPosition, 2)
			doPlayerSendTextMessage(cid, 24,"Your item is on max level, you can't upgrade it.")
		end
	else
		doPlayerSendTextMessage(cid, 24,"Impossible use stone in players.")
	end
	return true
end