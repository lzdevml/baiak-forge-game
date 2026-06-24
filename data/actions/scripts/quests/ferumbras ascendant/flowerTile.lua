local posFlowerOne = {x = 33386, y = 32326, z = 10}
local posFlowerTwo = {x = 33397, y = 32353, z = 11}
local posFlowerTree = {x = 33393, y = 32395, z = 11}

function onUse(cid, item, fromPosition, itemEx, toPosition, target)
	local slots = {1,2,3,4,5,6,7,8,9,10}
	for i=1, #slots do
        check = getPlayerSlotItem(cid, slots[i]).itemId
        if check == itemEx.itemId and getPlayerItemCount(cid, 2747) >= 1 then
        	--doSendMagicEffect(getCreaturePosition(cid),2)
        else
        	doRemoveItem(getTileThingByPos(fromPosition).uid, 1)
			doPlayerAddItem(cid, 2747, 1)
            doSendMagicEffect(getCreaturePosition(cid),13)
			addEvent(function()
				doCreateItem(2747, 1 ,fromPosition)
			end, 60000)
        end
    end
end