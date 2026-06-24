function onDeath(cid, corpse, deathList) 
    local killers = deathList
    local mostDamageKiller = #killers > 1 and killers[2] or killers[1]
    if not isPlayer(mostDamageKiller) then 
        return true
    end 

    -- Ungreez
    if getCreatureName(cid) == "Ungreez" then
        if getPlayerStorageValue(mostDamageKiller, 100078 < 21) then
            doSendAnimatedText(getThingPos(cid), getPlayerName(mostDamageKiller), 215)
            setPlayerStorageValue(mostDamageKiller, 100078,21)
            setPlayerStorageValue(mostDamageKiller, 61112, -1)
        end
    end

    -- Omruc
    if getCreatureName(cid) == "Omruc" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145781) == -1 then
                setPlayerStorageValue(deathList[i], 145781,1)
                doPlayerAddItem(deathList[i], 2352,1)
            end
        end
    end

    if getCreatureName(cid) == "Thalas" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145782) == -1 then
                setPlayerStorageValue(deathList[i], 145782,1)
                doPlayerAddItem(deathList[i], 2351,1)
            end
        end
    end

    if getCreatureName(cid) == "Dipthrah" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145783) == -1 then
                setPlayerStorageValue(deathList[i], 145783,1)
                doPlayerAddItem(deathList[i], 2354,1)
            end
        end
    end

    if getCreatureName(cid) == "Mahrdis" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145784) == -1 then
                setPlayerStorageValue(deathList[i], 145784,1)
                doPlayerAddItem(deathList[i], 2353,1)
            end
        end
    end

    if getCreatureName(cid) == "Vashresamun" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145785) == -1 then
                setPlayerStorageValue(deathList[i], 145785,1)
                doPlayerAddItem(deathList[i], 2349,1)
            end
        end
    end

    if getCreatureName(cid) == "Morguthis" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145786) == -1 then
                setPlayerStorageValue(deathList[i], 145786,1)
                doPlayerAddItem(deathList[i], 2350,1)
            end
        end
    end

    if getCreatureName(cid) == "Rahemos" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145787) == -1 then
                setPlayerStorageValue(deathList[i], 145787,1)
                doPlayerAddItem(deathList[i], 2348,1)
            end
        end
    end

    if getCreatureName(cid) == "Ashmunrah" then
        for i,v in pairs(deathList) do
            if getPlayerStorageValue(deathList[i], 145788) == -1 then
                setPlayerStorageValue(deathList[i], 145788,1)
                doPlayerAddItem(deathList[i], 2348,1)
            end
        end
    end
    return true
end