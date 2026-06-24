local areafrom1 = {x = 584, y = 406, z = 9} -- ENTRADA from
local areato1 = {x = 588, y = 410, z = 9} -- ENTRADA to
local newpos1 = {x = 552, y = 409, z = 9} -- POS ONDE OS PLAYERS VAO

local from1 = {x = 540, y = 398, z = 9} -- SALA DO BOSS
local to1 = {x = 565, y = 420, z = 9} -- SALA DO BOSS
local kickpos1 = {x = 484, y = 444, z = 9} -- PARA ONDE O PLAYER VAI AO SER KIKADO
local timetokick1 = {11, "min"} -- tempo para ser teleportado para sala de recompensa
local timelever1 = {15, "min"} -- tempo da LEVER
local nobug1 = {x = 578, y = 439, z = 8} -- NÂO MECHA
local leverpos1 = {x = 586, y = 409, z = 9}

local function convertTime1(a)
  if(type(tonumber(a)) == "number" and a > 0) then
    if (a <= 3599) then
      local minute = math.floor(a/60)
      local second = a - (60 * minute)
      if(second == 0) then
        return ((minute)..((minute > 1) and " minutos" or " minuto"))
      else
        return ((minute ~= 0) and ((minute>1) and minute.." minutos e " or minute.." minuto e ").. ((second>1) and second.." segundos" or second.." segundo") or ((second>1) and second.." segundos" or second.. " segundo"))
      end
    else
      local hour = math.floor(a/3600)
      local minute = math.floor((a - (hour * 3600))/60)
      local second = (a - (3600 * hour) - (minute * 60))
      if (minute == 0 and second > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(second..((second > 1) and " segundos" or " segundo"))
      elseif (second == 0 and minute > 0) then
        return (hour..((hour > 1) and " horas e " or " hora e "))..(minute..((minute > 1) and " minutos" or " minuto"))
      elseif (second == 0 and minute == 0) then
        return (hour..((hour > 1) and " horas" or " hora"))
      end
      return (hour..((hour > 1) and " horas, " or " hora, "))..(minute..((minute > 1) and " minutos e " or " minuto e "))..(second..((second > 1) and " segundos" or " segundo"))
    end
  end
end

local function kickPlayerFromArea1(cid, p)
	for _, pid in ipairs(getPlayersOnline()) do
		if isPlayer(pid) and isInRange(getPlayerPosition(pid), p[1], p[2]) then
			doTeleportThing(pid, p[3])
			doSendMagicEffect(p[3], CONST_ME_TELEPORT)
			doPlayerSendTextMessage(pid, 27, "Parabéns! Você só poderá escolher 1 item. Ao clicar no baú, você será teleportado.")
		end
	end
end

local function getCreaturesFromArea1(fromPos, toPos, checkFunction1)
    local grwe1 = {};
    checkFunction1 = checkFunction1 or function(arg) return true; end;
    for fx = fromPos.x, toPos.x do
        for fy = fromPos.y, toPos.y do
            for fz = fromPos.z, toPos.z do
                local tmp1 = getTopCreature({x=fx,y=fy,z=fz}).uid;
                if(checkFunction1(tmp1))then
                    table.insert(grwe1, tmp1);
                end
            end
        end
    end
    local tmp1 = getTopCreature(nobug1).uid;
    if(checkFunction1(tmp1))then
        table.insert(grwe1, tmp1);
    end
    return grwe1;
end

local function getPlayersInArea1(fromPos, toPos)
local players = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if isInRange(getPlayerPosition(pid), fromPos, toPos) then
            table.insert(players, pid)
        end
    end
   
	return players
end

local function mathtime1(table) -- by dwarfer
local unit = {"sec", "min", "hour", "day"}
	for i, v in pairs(unit) do
		if v == table[2] then
			return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
		end
	end
	
	return error("Bad declaration in mathtime function.")
end

local function changeBack1(posp)
	doTransformItem(getTileItemById(posp, 1946).uid, 1945)
	return true
end

local function FirstWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);	
end

local function SecondWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function ThirdWave1(cid)
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Guzzlemaw", {x = 556, y = 407, z = 9}, false, true);	
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);

	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);	
end

local function FourthWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Guzzlemaw", {x = 556, y = 407, z = 9}, false, true);	

	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function FifthWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Guzzlemaw", {x = 556, y = 407, z = 9}, false, true);	
	doCreateMonster("Hellfire Fighter", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function SixthWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);

	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function SeventhWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Guzzlemaw", {x = 556, y = 407, z = 9}, false, true);	
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function OctaveWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Guzzlemaw", {x = 556, y = 407, z = 9}, false, true);	
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function NineWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Juggernaut", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

local function TenWave1(cid)
	doCreateMonster("Pharaoh", {x = 560, y = 400, z = 9}, false, true);
	doCreateMonster("Daily Hellspawn", {x = 562, y = 406, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 559, y = 405, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 405, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 548, y = 401, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 545, y = 412, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 545, y = 400, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Cursed Human", {x = 547, y = 414, z = 9}, false, true);
	doCreateMonster("Energetic Human", {x = 542, y = 417, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 551, y = 409, z = 9}, false, true);
	doCreateMonster("Master Hamses", {x = 542, y = 404, z = 9}, false, true);
	doCreateMonster("Spirit Cursed", {x = 546, y = 411, z = 9}, false, true);
	doCreateMonster("Juggernaut", {x = 562, y = 414, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 557, y = 416, z = 9}, false, true);
	doCreateMonster("Burning Spirit", {x = 554, y = 413, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 551, y = 403, z = 9}, false, true);
	doCreateMonster("Burning Human", {x = 549, y = 418, z = 9}, false, true);
	doCreateMonster("Pharaoh", {x = 553, y = 400, z = 9}, false, true);
	doCreateMonster("Icecold Human", {x = 557, y = 413, z = 9}, false, true);
end

function onUse(cid, item, frompos, item2, topos)
local players1 = getPlayersInArea1(areafrom1, areato1);
local players_boss1 = getCreaturesFromArea1(from1, to1, isPlayer);

	if item.itemid == 1945 then
        if #players_boss1 > 0 then
			doCreatureSay(cid, "Possui jogadores na sala.", TALKTYPE_ORANGE_1)
			return true
        else
			local monsters1 = getCreaturesFromArea1(from1,to1,isMonster);
			while(#monsters1 > 0)do
				for _,m1 in pairs(monsters1)do
					doRemoveCreature(m1);
				end
				monsters1 = getCreaturesFromArea1(from1,to1,isMonster);
			end
			for i = 1, #players1 do
				doTeleportThing(players1[i], newpos1, false)
				doSendMagicEffect(getCreaturePosition(cid), 10)
			end
			
			doTransformItem(item.uid, item.itemid + 1)
			setGlobalStorageValue(cid, 42012, os.time()+15*60)
			addEvent(changeBack1, mathtime1(timelever1) * 1000, leverpos1)
			doCreatureSay(cid, "Você deve sobreviver ou acabar com todas as WAVES(1 minuto por WAVE).", TALKTYPE_ORANGE_1, false, 0, newpos1)
			addEvent(valid(doCreatureSay), 5*1000, cid, "WAVE 1 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(FirstWave1, 15*1000, 0, true)
			addEvent(valid(doCreatureSay), 60*1000, cid, "WAVE 2 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(SecondWave1, 70*1000, 0, true)
			addEvent(valid(doCreatureSay), 120*1000, cid, "WAVE 3 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(ThirdWave1, 130*1000, 0, true)
			addEvent(valid(doCreatureSay), 180*1000, cid, "WAVE 4 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(FourthWave1, 190*1000, 0, true)
			addEvent(valid(doCreatureSay), 240*1000, cid, "WAVE 5 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(FifthWave1, 250*1000, 0, true)
			addEvent(valid(doCreatureSay), 300*1000, cid, "WAVE 6 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(SixthWave1, 310*1000, 0, true)
			addEvent(valid(doCreatureSay), 360*1000, cid, "WAVE 7 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(SeventhWave1, 370*1000, 0, true)
			addEvent(valid(doCreatureSay), 420*1000, cid, "WAVE 8 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(OctaveWave1, 430*1000, 0, true)
			addEvent(valid(doCreatureSay), 480*1000, cid, "WAVE 9 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(NineWave1, 490*1000, 0, true)
			addEvent(valid(doCreatureSay), 540*1000, cid, "WAVE 10 EM 10 SEGUNDOS!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(TenWave1, 550*1000, 0, true)
			addEvent(valid(doCreatureSay), 600*1000, cid, "TODOS QUE SOBREVIVERAM VÃO SER TELEPORTADOS EM 1 MINUTO!", TALKTYPE_ORANGE_1, false, 0, {x = 552, y = 409, z = 9})
			addEvent(kickPlayerFromArea1, mathtime1(timetokick1) * 1000, cid, {from1, to1, kickpos1})
		end
		
	elseif item.itemid == 1946 then
		doCreatureSay(cid, "Para usar novamente a alavanca, aguarde ".. convertTime1(getGlobalStorageValue(cid, 42012) - os.time()) ..".", TALKTYPE_ORANGE_1, false, 0, {x = 586, y = 409, z = 9})
	end
	return true    
end



