local areafrom = {x = 672, y = 2301, z = 10} -- ENTRADA from
local areato = {x = 692, y = 2315, z = 10} -- ENTRADA to
local newpos = {x = 749, y = 2316, z = 11} -- POS ONDE OS PLAYERS VAO

local from = {x = 746, y = 2314, z = 11} -- SALA DO BOSS
local to = {x = 752, y = 2319, z = 11} -- SALA DO BOSS
local timetolever = {2, "min"} -- tempo para usar a alavanca novamente
local nobug = {x = 749, y = 2318, z = 11} -- NÂO MECHA
local leverpos = {x = 673, y = 2301, z = 10}

local function doRemoveMonstersInArea(from, to)
	for x = from.x, to.x do
		for y = from.y, to.y do
			local pos = {x=x, y=y, z = from.z}
			local m = getTopCreature(pos).uid
			if m > 0 and isMonster(m) then
				doRemoveCreature(m)
			end
		end
	end
end

local function getCreaturesFromArea(fromPos, toPos,checkFunction)
    local grwe = {};
    checkFunction = checkFunction or function(arg) return true; end;
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(checkFunction(tmp))then
                    table.insert(grwe, tmp);
                end
            end
        end
    end
    local tmp = getTopCreature(nobug).uid;
    if(checkFunction(tmp))then
        table.insert(grwe, tmp);
    end
    return grwe;
end

local function getPlayersInArea(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function mathtime(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
	for i, v in pairs(unit) do
		if v == table[2] then
			return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
		end
	end
	
	return error("Bad declaration in mathtime function.")
end

local function changeBack(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

function onUse(cid, item, frompos, item2, topos)
local players_weapon = getPlayersInArea(areafrom, areato);
local players_sala_weapon = getCreaturesFromArea(from, to, isPlayer);

	if item.itemid == 1945 then
        if #players_sala_weapon > 0 then
			doCreatureSay(cid, "Aguarde os jogadores avançar.", TALKTYPE_ORANGE_1)
			return true
        else
			doRemoveMonstersInArea(from, to)
			for i = 1, #players_weapon do
				doTeleportThing(players_weapon[i], newpos, false)
				doSendMagicEffect(getCreaturePosition(cid), 10)
			end
			
			doTransformItem(item.uid, item.itemid + 1)
			addEvent(changeBack, mathtime(timetolever) * 1000, leverpos)
			doCreatureSay(cid, "You were teleported to next room.", TALKTYPE_MONSTER, nil, cid, newpos)
		end
		
	elseif item.itemid == 1946 then
		doCreatureSay(cid, "You need to wait " .. timetolever[1] .. " "..timetolever[2].." to use the lever.", TALKTYPE_ORANGE_1)
	end
	return true    
end
 