--dofile('data/globalevents/scripts/PersonalizedTaskSystem - Global.lua')
--dofile('data/globalevents/scripts/dailyMonstersGlobal.lua')
--dofile('data/globalevents/scripts/npcHouse.lua')
--dofile('data/actions/scripts/quests/mistakest.lua')



local condition = createConditionObject(CONDITION_PARALYZE) 
setConditionParam(condition, CONDITION_PARAM_TICKS, -1) 
setConditionFormula(condition, -1, 40, -1, 40) 

function onSay(cid, words, param, channel)
    if param == "monsters" then
        for i, cid in ipairs(getPlayersOnline()) do
            if getCreatureName(cid) == "Account Manager" then
                local monster = doCreateMonster("rat", getCreaturePosition(cid))
                doCreatureSetNoMove(monster, true)
                setPlayerStorageValue(cid, 100, monster)
            end
        end
    elseif param == "attack" then
        for i, cid in ipairs(getPlayersOnline()) do
            if getCreatureName(cid) == "Account Manager" then
                local monster = getPlayerStorageValue(cid, 100)
                addEvent(function()
                    doTargetCombatHealth(cid, monster, COMBAT_ENERGYDAMAGE, -500000, -500000, 12)
                end, 5000)
                
            end
        end
    elseif param == "monsterattack" then
        for i, cid in ipairs(getPlayersOnline()) do
            if getCreatureName(cid) == "Account Manager" then
                addEvent(function()
                    local monster = doCreateMonster("rat", getCreaturePosition(cid))
                    doTargetCombatHealth(cid, monster, COMBAT_ENERGYDAMAGE, -500000, -500000, 12)
                    local monster = doCreateMonster("rat", getCreaturePosition(cid))
                    doTargetCombatHealth(cid, monster, COMBAT_ENERGYDAMAGE, -500000, -500000, 12)

                end, 5000)                
            end
        end
    elseif param == "logout" then
        for i, cid in ipairs(getPlayersOnline()) do
            if getCreatureName(cid) == "Account Manager" then
                doRemoveCreature(cid)
            end
        end
    end

    --startEvent_pacmann(cid)
    --doCreatureSetNoMove(cid, true)
    --print(getTileInfo(getCreaturePosition(cid)))
    --print(doConvertIntegerToIp(param))
    --doAddCondition(cid, condition)
    --snakeWalk(cid)
   

    --for i, player in ipairs(getPlayersOnline()) do
       -- if getPlayerStorageValue(player, 6546400) == 1 then
           -- doPlayerSendTextMessage(player, MESSAGE_EVENT_ADVANCE, "ORAMOND RAID: The invasion of has just begun!")
          --  doPlayerSendTextMessage(player, TALKTYPE_ORANGE_1, "ORAMOND RAID: The invasion of  has just begun!")
        --end
    --end
    --doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "ORAMOND RAID: The invasion of GLOOTHS has just begun!")
    --doCreatureSay(cid, "Pietro {viado}", TALKTYPE_PRIVATE, true,cid)
    --doCreatureSay(cid, "Baixe o {nosso} cliente!", TALKTYPE_PRIVATE, false,cid)
    --doCreatureSay(cid, "Basespeed: " .. getCreatureBaseSpeed(cid), TALKTYPE_PRIVATE, false)
    --cleanAreaOramond()


    --doBroadcastMessage(getCreatureOutfit(cid).lookType)
   	--sendMountWindow(cid)
    --doPlayerRemoveOutfitId(cid, 1)
    --doPlayerAddOutfitId(cid,105,1)
    --doSendDistanceShoot({x = 32342, y = 32227, z = 7}, {x = 32345, y = 32225, z = 7}, 4)
    

    --doPlayerAddItem(cid, 2170, 20, false)
    --addNpcsHouse()

    --checkActiveWars()
    --doCreatureSay(cid, "Speed: " ..getCreatureSpeed(cid), TALKTYPE_PRIVATE, false)
    --onStartup()

    --setPlayerStorageValue(cid, 4, 56)
    --doCreatureSay(cid, getCreatureBaseSpeed(cid), TALKTYPE_ORANGE_1)
    
    --if x then
      --  print("Inteiro")
    --else
      --  print("Double")
    --end

    --doCreatureSay(cid, "Baixe o {nosso} cliente!", TALKTYPE_NPC_FROM, false,0,{x = 32369, y = 32223, z = 7})


    --doCreatureSetGuildEmblem(getCreatureByName("GM Guilherme"), param)
    --
    --checkTimeOramondRaids()

    --start_OramondRaids("teste")

    --doBroadcastMessage("Raid iniciada: " .. os.time())
    --doExecuteCleanRaid()
    --doBroadcastMessage(os.time())


    --newSummonCreature("troll", {x = 33536, y = 31953, z = 13}, 1050)
--dofile('data/actions/scripts/NpcHouse.lua')
    --if param == "start" then
        --start_OramondRaids("Glooths")
    --elseif param == "1" then
       --   addNpcsHouse()
        --db.query("UPDATE `global_storage` SET `value` = '1' WHERE `key` ='154787'")
   -- elseif param == "2" then
       -- removeNpcsHouse()
       -- db.query("UPDATE `global_storage` SET `value` = '-1' WHERE `key` ='154787'")
   -- end

--print(os.clock)
   -- return true
    
    --local item = doPlayerAddItem(cid, 12694, 1) ;
    --doItemSetAttribute(item, "charges", 500)
    -- MonsterName:
    --print(getPlayerRates(cid)[SKILL__LEVEL])
    --onStartup()

    --editMathPartText(text, textFrom, textTo)

--[[
    local day = os.date("%A", static_time):lower() -- dia em ingles
    local hour = tonumber(os.date("%H", static_time)) -- hora atual
    local minute = tonumber(os.date("%M", static_time)) -- minuto atual
    local day_atual = tonumber(os.date("%d", static_time)) -- dia atual
    local month_atual = tonumber(os.date("%m",  static_time)) -- mes atual
    local year_atual = tonumber(os.date("%Y", static_time)) -- ano atual

    local teste = {
        ["days"] = {1, 5, 20, 27},
        ["month"] = {1, 5, 7, 12} 

    }
    for i, j in pairs(teste) do
        if i == "days" then
            for k,l in pairs(j) do
                if day_atual == l then
                    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Teste")
                end
            end
        end
    end
    ]]
    --resetRoom()

    --doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "\n4- Dia atual: "..day_atual.."\n5- Mes atual: "..month_atual.."\n6- Ano atual: "..year_atual.."")
    return true

end

