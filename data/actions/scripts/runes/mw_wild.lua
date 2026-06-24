function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storageEx = 123505
	local time = 1	

---- EXHAUST -------------------------------------------------------
	if(getPlayerStorageValue(cid,storageEx) >= os.time()) then
		--doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		return false
	end
	doPlayerSetStorageValue(cid, storageEx, os.time() + time)
---- -------- -------------------------------------------------------

   	if (not getTileInfo(getCreaturePosition(cid)).protection) and (not getTileInfo(toPosition).protection) then
   		alvo = getThingFromPos(toPosition).uid
		if isPlayer(alvo) then
			if isPlayerProtected(alvo) then
				for i = 0, 255 do
		            toPosition.stackpos = i
		            wall1 = getThingFromPos(toPosition)
		            if wall1.itemid == 12661 or wall1.itemid == 12662 then	
						return false
					end
		      
		        end
				if getThingFromPos(toPosition).itemid ~= 12661 and getThingFromPos(toPosition).itemid ~= 12662 then
					if item.itemid == 2293 then
						doPlayerRemoveItem(cid, 2293,1)
						wall = doCreateItem(12662,1, toPosition)
						time = 20000
					elseif item.itemid == 2269 then
						doPlayerRemoveItem(cid, 2269,1)
						wall = doCreateItem(12661,1, toPosition)
						time = 45000
					end
					doItemSetAttribute(wall, "owner", cid)
					addEvent(function()
						for i = 0, 255 do
				            toPosition.stackpos = i
				            wall2 = getThingFromPos(toPosition)
				            if wall2.itemid == 12661 or wall2.itemid == 12662 then	
								doRemoveItem(getThingFromPos(toPosition).uid, 1)
							end
				      
				        end
						
					end, time)
				end
			end
		end
   		if item.itemid == 2293 then
   			doSendDistanceShoot(fromPosition, toPosition, 4)
   			
   		elseif item.itemid == 2269 then
   			doSendDistanceShoot(fromPosition, toPosition, 29)
   		end

   	end
	return false
end
