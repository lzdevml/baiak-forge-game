local areafrom = {x = 189, y = 586, z = 0} -- ENTRADA from
local areato = {x = 194, y = 591, z = 0} -- ENTRADA to
local newpos = {x = 191, y = 597, z = 1} -- POS ONDE OS PLAYERS VAO

local from = {x = 182, y = 580, z = 1} -- SALA DO BOSS
local to = {x = 199, y = 597, z = 1} -- SALA DO BOSS
local kickpos = {x = 191, y = 580, z = 0} -- PARA ONDE O PLAYER VAI AO SER KIKADO
local timetokick = {10, "min"} -- tempo para ser kikado da sala do boss
local boss = {x = 196, y = 588, z = 1} -- ONDE O BOSS VAI SER SUMONADO
local nobug = {x = 191, y = 588, z = 1} -- NÂO MECHA
local leverpos = {x = 193, y = 592, z = 0}

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

local function kickPlayerFromArea(cid, p)
	for _, pid in ipairs(getPlayersOnline()) do
		if isPlayer(pid) and isInRange(getPlayerPosition(pid), p[1], p[2]) then
			doTeleportThing(pid, p[3])
			doSendMagicEffect(p[3], CONST_ME_TELEPORT)
			doCreatureSay(pid, 'Você foi expulso da sala.', TALKTYPE_ORANGE_1)
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
	
	return error("Declaração incorreta na função de cálculo de tempo.")
end

local function changeBack(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

function onUse(cid, item, frompos, item2, topos)
local players = getPlayersInArea(areafrom, areato);
local players_boss = getCreaturesFromArea(from, to, isPlayer);

	if item.itemid == 1945 then
        if #players_boss > 0 then
			doCreatureSay(cid, "Outra pessoa está na sala.", TALKTYPE_ORANGE_1)
			return true
        else
			doRemoveMonstersInArea(from, to)
			for i = 1, #players do
				doTeleportThing(players[i], newpos, false)
				doSendMagicEffect(getCreaturePosition(cid), 10)
			end
			
			doTransformItem(item.uid, item.itemid + 1)
			addEvent(changeBack, mathtime(timetokick) * 1000, leverpos)
			doCreateMonster("Snake God Essence", boss, false, true);
			doCreatureSay(cid, "Você será expulso da sala do Boss em " .. timetokick[1] .. " "..timetokick[2]..".", TALKTYPE_MONSTER, nil, cid, newpos)
			addEvent(kickPlayerFromArea, mathtime(timetokick) * 1000, cid, {from, to, kickpos})
		end
		
	elseif item.itemid == 1946 then
		doCreatureSay(cid, "Você precisa esperar " .. timetokick[1] .. " "..timetokick[2].." para usar a alavanca novamente.", TALKTYPE_ORANGE_1)
	end
	return true    
end
 