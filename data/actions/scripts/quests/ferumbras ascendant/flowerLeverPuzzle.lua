local config = {
	Tp = {
		{x = 33477, y = 32698, z = 14},
		{x = 33435, y = 32801, z = 13}
	}
}

local tileAccept = {
	[1] = {x= 33452, y= 32721, z= 14, itemid = 12656},
	[2] = {x= 33455, y= 32721, z= 14, itemid = 12656},
	[3] = {x= 33458, y= 32721, z= 14, itemid = 12656},
	[4] = {x= 33461, y= 32721, z= 14, itemid = 12656},
	[5] = {x= 33464, y= 32721, z= 14, itemid = 12659},
	[6] = {x= 33467, y= 32721, z= 14, itemid = 12656},
	[7] = {x= 33452, y= 32724, z= 14, itemid = 12659},
	[8] = {x= 33455, y= 32724, z= 14, itemid = 12658},
	[9] = {x= 33458, y= 32724, z= 14, itemid = 12657},
	[10] = {x= 33461, y= 32724, z= 14, itemid = 12658},
	[11] = {x= 33464, y= 32724, z= 14, itemid = 12657},
	[12] = {x= 33467, y= 32724, z= 14, itemid = 12659},
	[13] = {x= 33452, y= 32727, z= 14, itemid = 12656},
	[14] = {x= 33455, y= 32727, z= 14, itemid = 12657},
	[15] = {x= 33458, y= 32727, z= 14, itemid = 12656},
	[16] = {x= 33461, y= 32727, z= 14, itemid = 12656},
	[17] = {x= 33464, y= 32727, z= 14, itemid = 12656},
	[18] = {x= 33467, y= 32727, z= 14, itemid = 12658}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local accessook = 0
	local stackItem =  getTileThingByPos({x = 33476, y = 32700, z = 14, stackpos = 1})
	setPlayerStorageValue(cid, 320987, os.time() + 5)
	if stackItem.itemid == 10030 then --nao deixa puxar alavanca
		return false
	else 
		for j, k in pairs(tileAccept) do
			if (getThingfromPos({x = tileAccept[j].x, y = tileAccept[j].y, z = tileAccept[j].z, stackpos = 0}).itemid) == tileAccept[j].itemid then
				accessook = accessook + 1
			end
		end
		
		if accessook == 18 then
			doCreateTeleport(1387, config.Tp[2], config.Tp[1])
			doTransformItem(item.uid, 10030) --transforma item
			addEvent(function()
				doTransformItem(getTileThingByPos({x = 33476, y = 32700, z = 14, stackpos = 1}).uid, 10029)
				doRemoveItem(getTileThingByPos({x = 33477, y = 32698, z = 14, stackpos = 1}).uid, 1)
			end, 5*60*1000)
				
			for i, v in pairs(tileAccept) do -- lipar os tiles
				if (getThingfromPos({x = tileAccept[i].x, y = tileAccept[i].y, z = tileAccept[i].z, stackpos = 0}).itemid) ~= 12656 then
					doTransformItem(getThingfromPos({x = tileAccept[i].x, y = tileAccept[i].y, z = tileAccept[i].z, stackpos = 0}).uid, 12656)
				end
			end
		else
			doSendMagicEffect(fromPosition, 2)
			doPlayerSendTextMessage(cid, 22, "The colors are incorrect.")
		end
	end
end