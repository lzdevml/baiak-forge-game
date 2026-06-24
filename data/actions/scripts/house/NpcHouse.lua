npcHouse = {
	["Xodet"] = {itemid = 12637, type = "npc"},
	["Grizzly Adams"] = {itemid = 12638, type = "npc"},
	["Traveler"] = {itemid = 12639, type = "npc"},
	["Banker"] = {itemid = 12640, type = "npc"},
	["Rashid"] = {itemid = 12641, type = "npc"},

	["Ferumbras Soul"] = {itemid = 11390, fakename = "Ferumbras Soul"},
	["Mummified Mummy"] = {itemid = 11201, fakename = "Mummified Mummy"},
	["Leviathan"] = {itemid = 10529, fakename = "Leviathan"},

}
local storage = 923555
local time = 5

function onUse(cid, item, fromPosition, itemEx, toPosition)
	---- EXHAUST -------------------------------------------------------
	if(getPlayerStorageValue(cid,storage) >= os.time()) then
		doPlayerSendCancel(cid, "Wait " .. tonumber(getPlayerStorageValue(cid,storage))-tonumber(os.time()) + 1 .. " seconds to perform this action again.")
		return TRUE
	end
---- -------- -------------------------------------------------------

	for j, k in pairs (npcHouse) do
		if item.itemid == npcHouse[j].itemid then			
			if toPosition.y > 100 then
				house = getHouseFromPos(toPosition)
				if house then
					for i,v in pairs(doors) do
						toPosition.stackpos = 1
				        if getThingFromPos(toPosition).itemid == doors[i] or getThingFromPos(toPosition).itemid == i then
				        	doPlayerSendCancel(cid, "You cannot create an NPC on a door entry.")
				        	return true
				        else
				        	toPosition.stackpos = 2
				        	if getThingFromPos(toPosition).itemid == doors[i] or getThingFromPos(toPosition).itemid == i then
				        		doPlayerSendCancel(cid, "You cannot create an NPC on a door entry.")
				        		return true
				        	end
				        end
				    end

					if isNpc(getTopCreature(toPosition).uid) or isMonster(getTopCreature(toPosition).uid) then
						doPlayerSendCancel(cid, "You cannot create one NPC inside another.")
						return true
					elseif isPlayer(getTopCreature(toPosition).uid) then
						doPlayerSendCancel(cid, "You cannot create an NPC with players on top.")
						return true
					else
						doSendMagicEffect(toPosition, 10)
						doRemoveItem(item.uid)
						if npcHouse[j].type == "npc" then
							doCreateNpc(j, toPosition, false, true)
							addNpc(j,toPosition)
						else
							doCreateMonster(j, toPosition, false, true)
							addNpc(npcHouse[j].fakename,toPosition)
						end
						doPlayerSetStorageValue(cid, storage, os.time() + time)
						doSaveHouse({getHouseFromPos(fromPosition)})
						doPlayerSave(cid)
						return true
					end
				else
					doPlayerSendCancel(cid, "Use o item dentro da house!")
					return true
				end
			end
		end
	end
	return true
end

function addNpc(name, pos, dir)
	if not dir then dir = 1 end
    pos = pos.x .. ", " .. pos.y .. ", " .. pos.z
    local inf = assert(io.open("data/sistemas/npcHouse.txt", "rw"), "Failed to open input file") -- what textfile to read
    local lines = name .. " = " .. pos .. ", ".. dir .."\n"
    while(true) do
        local line = inf:read("*line")
        if not line then break end
        lines = lines .. line .. "\n"
    end
    inf:close()
    file = io.open("data/sistemas/npcHouse.txt", "w") --what textfile to write
    file:write(lines)
    file:close()
end

function removeNpc(pos)
    pos = pos.x .. ", " .. pos.y .. ", " .. pos.z
    local inf = assert(io.open("data/sistemas/npcHouse.txt", "rw"), "Failed to open input file") -- what textfile to read
    local lines = ""
    while(true) do
        local line = inf:read("*line")
        if not line then break end
        if not string.find(line, pos, 1) then --if string not found
            lines = lines .. line .. "\n"
        end
    end
    inf:close()
    file = io.open("data/sistemas/npcHouse.txt", "w") --what textfile to write
    file:write(lines)
    file:close()
end

function addNpcsHouse()
	Query1 = db.getResult("SELECT `value` FROM `global_storage` WHERE `key` = '154787'")
	local valueQuery = Query1:getDataString("value")

	print(">> Adicionando NPCS nas houses.")
    line_points = {}
    npc_data = ''

    local rfile = io.open("data/sistemas/npcHouse.txt", "r")
    for line in rfile:lines() do
        npcInfo = line:match("^(.-)$")
        npc_data = npcInfo
        line_points[#line_points + 1] = npc_data
    end

    for i = 1, #line_points do
        local name = doCutText(line_points[i],"=")[1]
        local pos = (doCutText(line_points[i],"=")[2])

        posx = tonumber(doCutText(pos, ",")[1])
        posy = tonumber(doCutText(pos, ",")[2])
        posz = tonumber(doCutText(pos, ",")[3])

        dir = tonumber(doCutText(pos, ",")[4])

        pos = {x = posx, y = posy, z = posz}

        for j,k in pairs (npcHouse) do
        	if not isNpc(getTopCreature(pos).uid) and not isMonster(getTopCreature(pos).uid) then
        		if tonumber(valueQuery) and tonumber(valueQuery) == -1 then -- Caso tenha fechado o OT normalmente:
	                for index = 1, 255 do
				        pos.stackpos = index
				        local thing = getThingfromPos(pos)        
				        if thing.itemid == npcHouse[j].itemid then
				            if npcHouse[j].type == "npc" and j == name then                
			                	doCreateNpc(j, pos, false, true)   
			                	doRemoveItem(thing.uid)     
			                	break        	
			                elseif npcHouse[j].fakename == name then
			            		monster = doCreateMonster(j, pos, false, true)
			                    doCreatureSetLookDirection(monster,dir)
			                    doRemoveItem(thing.uid)
			                    break
			                end
				        end
				    end
			    elseif tonumber(valueQuery) and tonumber(valueQuery) == 1 then -- Caso o OT Tenha caido
			    	if npcHouse[j].type == "npc" and j == name then                
	                	doCreateNpc(j, pos, false, true)     
	                elseif npcHouse[j].fakename == name then
	            		monster = doCreateMonster(j, pos, false, true)
	                    doCreatureSetLookDirection(monster,dir)
	                end

	                for index = 1, 255 do
			        	pos.stackpos = index   
			        	local thing = getThingfromPos(pos)  
			        	if thing.itemid == npcHouse[j].itemid then  
			        		doRemoveItem(thing.uid)     
		                	break
		                end
		            end 
			    end
            end
        end
    end
end

function removeNpcsHouse()
	print(">> Transformando NPCS nas houses")
	line_points = {}
	npc_data = ''

	local rfile = io.open("data/sistemas/npcHouse.txt", "r")
    for line in rfile:lines() do
        npcInfo = line:match("^(.-)$")
        npc_data = npcInfo
        line_points[#line_points + 1] = npc_data
    end


    for i = 1, #line_points do
        local name = doCutText(line_points[i],"=")[1]
        local pos = (doCutText(line_points[i],"=")[2])

        posx = tonumber(doCutText(pos, ",")[1])
        posy = tonumber(doCutText(pos, ",")[2])
        posz = tonumber(doCutText(pos, ",")[3])

        dir = tonumber(doCutText(pos, ",")[4])

        pos = {x = posx, y = posy, z = posz}

        for j,k in pairs (npcHouse) do
        	if isNpc(getTopCreature(pos).uid) or isMonster(getTopCreature(pos).uid) then
        		--[[if npcHouse[j].type == "npc" and j == name then                
                	
                elseif npcHouse[j].fakename == name then
            		doRemoveCreature(getTopCreature(pos).uid)
                	doCreateItem(npcHouse[j].itemid, 1, pos)
                end]]
                if getCreatureName(getTopCreature(pos).uid) == j or getCreatureName(getTopCreature(pos).uid) == j.fakename then
	                doRemoveCreature(getTopCreature(pos).uid)
	                doCreateItem(npcHouse[j].itemid, 1, pos)
	            end
                
                
            end
            
        end
    end
end






