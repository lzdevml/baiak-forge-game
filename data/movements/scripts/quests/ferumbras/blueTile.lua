local function playerInTile(cid)
	doTransformItem(getTileThingByPos({x = 33634, y = 32680, z = 13, stackpos = 1}).uid, 12419)
	doTransformItem(getTileThingByPos({x = 33635, y = 32680, z = 13, stackpos = 1}).uid, 12420)
	doTransformItem(getTileThingByPos({x = 33634, y = 32681, z = 13, stackpos = 2}).uid, 12421)
	doTransformItem(getTileThingByPos({x = 33635, y = 32681, z = 13, stackpos = 2}).uid, 12422)
end

local function revertPlayerInTile(cid)
	doTransformItem(getTileThingByPos({x = 33634, y = 32680, z = 13, stackpos = 1}).uid, 12411)
	doTransformItem(getTileThingByPos({x = 33635, y = 32680, z = 13, stackpos = 1}).uid, 12412)
	doTransformItem(getTileThingByPos({x = 33634, y = 32681, z = 13, stackpos = 2}).uid, 12413)
	doTransformItem(getTileThingByPos({x = 33635, y = 32681, z = 13, stackpos = 2}).uid, 12414)
end

local storage = Storage.FerumbrasAscension.acessoInfernatil
local storageTile = Storage.FerumbrasAscension.storageTile

function onStepIn(cid, item, position, fromPosition)
	if item.itemid == 9563 and isPlayer(getThingFromPos({x = 33635, y = 32682, z = 13, stackpos = 253}).uid) and getPlayerStorageValue(cid, storage) ~= 3 and getPlayerStorageValue(cid, storageTile) < 1 then
		doCreatureSay(cid,"Blue access released.", TALKTYPE_MONSTER_SAY)
		doSendMagicEffect(position, 14)
		playerInTile(cid)
		setPlayerStorageValue(cid, storageTile, 1)
		setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
		addEvent(function()
			revertPlayerInTile(cid)
		end, 2000)
	elseif getPlayerStorageValue(cid, storageTile) == 1 then
		doPlayerSendCancel(cid, "Access already performed.")
	end
end