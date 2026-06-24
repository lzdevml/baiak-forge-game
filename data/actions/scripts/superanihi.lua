function onUse(cid, item, fromPosition, itemEx, toPosition)
local daysvalue = 1 * 24 * 60 * 60
storage = 81923
local daily = getPlayerStorageValue(cid, 81923)


if getPlayerStorageValue(cid, storage) <= os.time() then
        
            setPlayerStorageValue(cid, storage, os.time() + daysvalue)
            local item = doPlayerAddItem(cid, 1990)
                doItemSetAttribute(item, "description", " Gratz! Que os Deuses lhe deem boa sorte.")
                doItemSetAttribute(item, 'aid', 12468)
                doSendMagicEffect(getThingPos(cid), 29)


    else
        local left = getPlayerStorageValue(cid, storage) - os.time()
        left = {hour = math.floor(left/3600), minutes = math.ceil((left % 3600)/60)}
        doPlayerSendCancel(cid, 'Espere um pouco '.. left.hour ..'h and '..left.minutes..'min [Apenas um personagem por conta diariamente].')
        doSendMagicEffect(getThingPos(cid), 2)
    end
return true
end