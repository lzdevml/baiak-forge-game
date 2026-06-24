local function tameMonster(cid, item, itemEx, tame, run, broken)
	n = math.random(100)
	if n <= broken then
		doCreatureSay(cid, "Lost item", TALKTYPE_ORANGE_1)
		doRemoveItem(item.uid)
	elseif n > broken and n <= (tame+broken) then
		doRemoveItem(item.uid)
		doCreatureSay(cid, "You tamed", TALKTYPE_ORANGE_1)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You tamed "..getCreatureName(itemEx.uid)..".")
		return true
	elseif n > (tame+broken) and n <= (tame+broken+run) then
		doCreatureSay(cid, "Fled", TALKTYPE_ORANGE_1)
		doRemoveCreature(itemEx.uid)
	else
		doCreatureSay(cid, "Try again", TALKTYPE_ORANGE_1)
	end
	return false
end
 
local function inArray(table, value)
	for i,v in pairs(table) do
		if (v.name == string.lower(value)) then
			return i
		end
	end
	return 0
end
 
local mounts = {
{item = 23557, name = "walker", id = 43, tame=50, run=35, broken=25},
{item = 13298, name = "terror bird", id = 2, tame=40, run=35, broken=25},
{item = 13295, name = "black sheep", id = 4, tame=40, run=35, broken=25},
{item = 2376, name = "bear", id = 3, tame=40, run=35, broken=25},
{item = 13247, name = "boar", id = 10, tame=40, run=35, broken=25},
{item = 13305, name = "crustacea gigantica", id = 7, tame=40, run=35, broken=25},
{item = 13307, name = "wailing widow", id = 147, tame=40, run=35, broken=25},
{item = 13498, name = "sandstone scorpion", id = 21, tame=40, run=35, broken=25},
{item = 13508, name = "slug", id = 14, tame=40, run=35, broken=25},
{item = 13535, name = "dromedary", id = 20, tame=40, run=35, broken=25},
{item = 13536, name = "crystal wolf", id = 16, tame=40, run=35, broken=25},
{item = 13537, name = "donkey", id = 13, tame=40, run=35, broken=25},
{item = 13538, name = "panda", id = 19, tame=40, run=35, broken=25},
{item = 13539, name = "white deer", id = 18, tame=40, run=35, broken=25},
{item = 13936, name = "horse", id = 17, tame=40, run=35, broken=25},
{item = 13535, name = "dromedary", id = 20, tame=40, run=35, broken=25},
{item = 13937, name = "uniwheel", id = 15, tame=40, run=35, broken=25},
{item = 15545, name = "manta ray", id = 28, tame=40, run=35, broken=25},
{item = 15546, name = "lady bug", id = 27, tame=40, run=35, broken=25},
{item = 18516, name = "gnarlhound", id = 32, tame=40, run=35, broken=25},
{item = 20138, name = "water buffalo", id = 35, tame=40, run=35, broken=25},
{item = 21452, name = "gravedigger", id = 39, tame=40, run=35, broken=25},
{item = 22608, name = "shock head", id = 42, tame=40, run=35, broken=25},
{item = 22726, name = "ursagrodon", id = 38, tame=40, run=35, broken=25},
{item = 23810, name = "noble lion", id = 40, tame=40, run=35, broken=25},
{item = 32491, name = "flying book", id = 165, tame=40, run=35, broken=25},
{item = 36411, name = "gryphon", id = 114, tame=40, run=35, broken=25},
{item = 34808, name = "lacewing moth", id = 169, tame=40, run=35, broken=25},
{item = 34809, name = "hibernal moth", id = 170, tame=40, run=35, broken=25},
{item = 30840, name = "mole", id = 184, tame=40, run=35, broken=25},
{item = 27628, name = "stone rhino", id = 191, tame=40, run=35, broken=25},
{item = 39053, name = "white lion", id = 137, tame=40, run=35, broken=25},
{item = 18448, name = "magma crawler", id = 30, tame=40, run=35, broken=25},
{item = 18447, name = "ironblight", id = 29, tame=40, run=35, broken=25},
{item = 13293, name = "midnight panther", id = 5, tame=40, run=35, broken=25},
{item = 16296, name = "undead cavebear", id = 12, tame=40, run=35, broken=25},
{item = 13294, name = "draptor", id = 6, tame=40, run=35, broken=25}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isCreature(itemEx.uid) then
local creature = getCreatureName(itemEx.uid)
local itemName = getItemName(item.uid)
 
		if inArray(mounts, getCreatureName(itemEx.uid)) > 0 then
			i = inArray(mounts, getCreatureName(itemEx.uid))
			if item.itemid == mounts[i].item then
				if tameMonster(cid, item, itemEx, mounts[i].tame, mounts[i].run, mounts[i].broken) then
	doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
	doRemoveCreature(itemEx.uid)
	doPlayerAddMount(cid, mounts[i].id)
				else
doCreatureSay(cid, "Fail! Try again.", TALKTYPE_ORANGE_1)
doSendMagicEffect(toPosition, CONST_ME_POFF)
				end
else
doCreatureSay(cid, "The ".. itemName .." is not meant to tame a ".. creature .." mount!", TALKTYPE_ORANGE_1)
doSendMagicEffect(toPosition, CONST_ME_POFF)
 
 
			end
 
		end
 
 
	end
	return true
end
