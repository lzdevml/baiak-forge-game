function onLogin(cid)
	if not isPlayer(cid) then return true end
	if getPlayerGroupId(cid) == 1 and getPlayerStorageValue(cid, 30001) == -1 then
		if isSorcerer(cid) then
			local bag = doPlayerAddItem(cid, 2002, 1)
	
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 5710, 1)
			doAddContainerItem(bag, 2160, 15)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 7620, 1)
			doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 1949, 1)
			
		
			doPlayerAddItem(cid, 2534, 1)
			doPlayerAddItem(cid, 7426, 1)
			doPlayerAddItem(cid, 8871, 1)
			doPlayerAddItem(cid, 2323, 1)
			doPlayerAddItem(cid, 7896, 1)
			doPlayerAddItem(cid, 2195, 1)
			doPlayerAddItem(cid, 2173, 1)
			doPlayerAddItem(cid, 7590, 1)
			doPlayerAddItem(cid, 2124, 1)
			

		setPlayerStorageValue(cid, 30001, 1)

		elseif isDruid(cid) then
			local bag = doPlayerAddItem(cid, 2002, 1)
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 5710, 1)
			doAddContainerItem(bag, 2160, 15)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 7620, 1)
			doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 1949, 1)
		
			doPlayerAddItem(cid, 2534, 1)
			doPlayerAddItem(cid, 7426, 1)
			doPlayerAddItem(cid, 8871, 1)
			doPlayerAddItem(cid, 2323, 1)
			doPlayerAddItem(cid, 7896, 1)
			doPlayerAddItem(cid, 2195, 1)
			doPlayerAddItem(cid, 2173, 1)
			doPlayerAddItem(cid, 7590, 1)
			doPlayerAddItem(cid, 2124, 1)

			setPlayerStorageValue(cid, 30001, 1)

		elseif isPaladin(cid) then
			local bag = doPlayerAddItem(cid, 10522, 1)
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 5710, 1)
			doAddContainerItem(bag, 2160, 15)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 7620, 1)
			doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 1949, 1)
		
			doPlayerAddItem(cid, 7366, 1)
			doPlayerAddItem(cid, 2519, 1)
			doPlayerAddItem(cid, 7368, 1)
			doPlayerAddItem(cid, 2195, 1)
			doPlayerAddItem(cid, 2488, 1)
            doPlayerAddItem(cid, 2487, 1)
			doPlayerAddItem(cid, 2491, 1)
			doPlayerAddItem(cid, 2173, 1)
			doPlayerAddItem(cid, 8472, 1)
			doPlayerAddItem(cid, 2124, 1)
			
			setPlayerStorageValue(cid, 30001, 1)

		elseif isKnight(cid) then
			local bag = doPlayerAddItem(cid, 10522, 1)
			doAddContainerItem(bag, 2120, 1)
			doAddContainerItem(bag, 5710, 1)
			doAddContainerItem(bag, 2160, 15)
			doAddContainerItem(bag, 2789, 50)
			doAddContainerItem(bag, 7620, 1)
			doAddContainerItem(bag, 7618, 1)
			doAddContainerItem(bag, 12610, 1)
			doAddContainerItem(bag, 7428, 1)
			doAddContainerItem(bag, 1949, 1)
			
		    doPlayerAddItem(cid, 8924, 1)
	        doPlayerAddItem(cid, 2519, 1)
			doPlayerAddItem(cid, 2195, 1)
			doPlayerAddItem(cid, 2488, 1)
            doPlayerAddItem(cid, 2487, 1)
			doPlayerAddItem(cid, 2491, 1)
			doPlayerAddItem(cid, 2173, 1)
			doPlayerAddItem(cid, 8473, 1)
			doPlayerAddItem(cid, 2124, 1)

			setPlayerStorageValue(cid, 30001, 1)
		end
	end
 	return TRUE
end