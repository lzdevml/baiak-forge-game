
local storageEx = 523532
local time = 1

function onEquip(cid, item, slot) -- Inserir item no slot
	---- EXHAUST -------------------------------------------------------
    if(getPlayerStorageValue(cid,storage) >= os.time()) then
        return TRUE
    end
    doPlayerSetStorageValue(cid, storage, os.time() + time)
---- -------- -------------------------------------------------------
	--item = getPlayerSlotItem(cid, CONST_SLOT_FEET).uid
	--doBroadcastMessage(getItemAttribute(item, "description"))	

	if getItemAttribute(item.uid, "description") then
        local itemDesc = getItemAttribute(item.uid, "description")
        local serial = doCutText(itemDesc,"*")

        local countSerial = 0
        local newSerial = {}

       	for i, v in pairs(serial) do
       		countSerial = i
       	end
       	countSerial = countSerial/2
       	--doBroadcastMessage(countSerial)

       	if countSerial >= 2 then
	       	for j=1, countSerial do
	       		if j==1 then
	       			newSerial[j] = serial[j]
	       			
	      		else
	      			bonusId = doCutText(serial[j],",")[1]
	      			bonusType = doCutText(serial[j],",")[2]
	      			timeBonus = tonumber(doCutText(serial[j],",")[3])	

					newSerial[j] = "\n*"..bonusId..",".. bonusType .."," ..timeBonus + os.time()
	      		end
	      		--doBroadcastMessage("New Serial ["..j.."]: "..newSerial[j] )
	       	end

	       	for k=1, countSerial do
	       		if k==1 then
	       			doItemSetAttribute(item.uid, "description", serial[k])
	       		else
	       			doItemSetAttribute(item.uid, "description", getItemAttribute(item.uid, "description") .. newSerial[k])
	       		end
	        end
	    end
	    --doBroadcastMessage("New Serial: " .. newSerial[1] .. " | Hora atual: " .. os.time())

    end
    return true
end

function onDeEquip(cid, item, slot) -- retirar item

	if getItemAttribute(item.uid, "description") then
		local itemDesc = getItemAttribute(item.uid, "description")
        local serial = doCutText(itemDesc,"*")

        local countSerial = 0
        local newSerial = {}

       	for i, v in pairs(serial) do
       		countSerial = i
       	end
       	countSerial = countSerial/2
       	--doBroadcastMessage(countSerial)

       	if countSerial >= 2 then
       		--if tonumber(doCutText(serial[2],",")[3]) > 800000 then
       		--doBroadcastMessage(tonumber(doCutText(serial[2],",")[3]))
	       	for j=1, countSerial do
	       		
		       		if j==1 then
		       			newSerial[j] = serial[j]
		       			
		      		else
		      			bonusId = doCutText(serial[j],",")[1]
		      			bonusType = doCutText(serial[j],",")[2]
		      			timeBonus = tonumber(doCutText(serial[j],",")[3])	

						newSerial[j] = "\n*"..bonusId..",".. bonusType .."," ..timeBonus - os.time()
		      		end
		      		--doBroadcastMessage("New Serial ["..j.."]: "..newSerial[j] )
	       	end

	       	for k=1, countSerial do

		       		if k==1 then
		       			doItemSetAttribute(item.uid, "description", serial[k])
		       		else
		       			doItemSetAttribute(item.uid, "description", getItemAttribute(item.uid, "description") .. newSerial[k])
		       		end
	        end
		    --end
	    end
	end
    return true
end