-- *****************************************************************************************************************************
-- © Copyright All rights deserved - Scriptzone 2019, Brazil
-- Website: www.scriptzone.com.br
-- *****************************************************************************************************************************
-- Esta biblioteca é propriedade dos clientes da Scriptzone
-- É proibida a venda ou distribuição em qualquer situação
-- A violação e identificaçao do violador implica punição legal
-- Para bom funcionamento dos scripts relacionados a essa biblioteca de funções não devem existir funções repetidas no arquivo
-- Caso já possua outra biblioteca de funções da Scriptzone, una-as em um só arquivo
-- *****************************************************************************************************************************
-- This library is Scriptzone's clients property
-- It is prohibited sale or distribution in any situation
-- Violation and identification of the violator implies legal punishment
-- For proper scripts operation related to this library of functions shouldn't have repeated function in the file
-- In case of there is another Scriptzone library of functions, join them in a single file
-- *****************************************************************************************************************************

-- All functions by Scriptzone

function mathtime(table)
local unit = {"sec", "min", "hour", "day"}
for i, v in pairs(unit) do
if v == table[2] then
return table[1]*(60^(v == unit[4] and 2 or i-1))*(v == unit[4] and 24 or 1)
end
end
return error("Bad declaration in mathtime function.")
end

function getStrTime(table)
local unit = {["sec"] = "second",["min"] = "minute",["hour"] = "hour",["day"] = "day"}
return tostring(table[1].." "..unit[table[2]]..(table[1] > 1 and "s" or ""))
end

function getStringTime(time, low_precision)
    local checkTime = time
    local unit = {{86400,"day"},{3600,"hour"},{60,"min"},{1,"sec"}}
    local strs, str, n = {}, "", 1
    if time == 1 then
        return string.format("1 %s", unit[4][2])
    elseif time <= 0 then
        return 0 
    end
    while time > 1 do
        local k = unit[n]
        if time > k[1] then
            local t, s = math.floor(time/k[1]), k[2]
            table.insert(strs, t.." "..(t > 1 and s.."s" or s))
            time = time % k[1]
        end
        n = n + 1
    end
    if not low_precision then
        for i = 1, #strs do
            str = str..strs[i]..(i == #strs-1 and " and " or i == #strs and "" or ", ")
        end
    else
        if #strs > 1 then
            if checkTime > 60 then
                str = "about "..strs[1]
            end
        else
            str = strs[1]
        end
    end
    return str
end

function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function doPlayerAddItemTab(cid, itemTable)
    if (not isItemStackable(itemTable[1]) and itemTable[2] > 1) then
        for k = 1, itemTable[2] do
            doPlayerAddItem(cid, itemTable[1], 1)
        end
    else
        doPlayerAddItem(cid, itemTable[1], itemTable[2])
    end
    return true
end

function addPlural(counter, windup, word)
    if counter <= 1 then return "" end
    return not word and windup or (word:sub(-1,-1) ~= windup and windup or "")
end

function count(T) local count = 0 for _ in pairs(T) do count = count + 1 end return count end

function setStorageTable(storage, tab, cid)
    local tabstr = "&"
    for i,x in pairs(tab) do
        tabstr = tabstr .. i .. "," .. x .. ";"
    end
    if not cid then
        return setGlobalStorageValue(storage, tabstr:sub(1, #tabstr-1))
    end
    return setPlayerStorageValue(cid, storage, tabstr:sub(1, #tabstr-1))
end

function getStorageTable(storage, cid)
local tabstr = getGlobalStorageValue(storage)
if cid then
    tabstr = getPlayerStorageValue(cid, storage)
end
local tab = {}
if type(tabstr) ~= "string" then
return {}
end
if tabstr:sub(1,1) ~= "&" then
return {}
end
local tabstr = tabstr:sub(2, #tabstr)
local a = string.explode(tabstr, ";")
for i,x in pairs(a) do
local b = string.explode(x, ",")
tab[tonumber(b[1]) or b[1]] = tonumber(b[2]) or b[2]
end
return tab
end

function addValueInTable(storage, value, cid)
    local x = {}
    for i = 1,#getStorageTable(storage, cid) do
        table.insert(x,getStorageTable(storage, cid)[i])
    end
    if x ~= 0 then
        table.insert(x,tonumber(value))
        setStorageTable(storage, x, cid)
    else
        setStorageTable(storage, {value}, cid)
    end
end

function getStorageTableValue(storage, index, cid)
    local tab = getStorageTable(storage, cid)
    return tab[index]
end

function setStorageTableValue(storage, index, value, cid)
    local x = {}
    local tab = getStorageTable(storage, cid)
    for i = 1, #tab do
        table.insert(x, tab[i])
    end
    if x[index] then
        x[index] = value
    end
    setStorageTable(storage, x, cid)
end

function setPlayerStorageTable(cid, storage, tab)
    local tabstr = "&"
    for i,x in pairs(tab) do
        tabstr = tabstr .. i .. "," .. x .. ";"
    end
    setPlayerStorageValue(cid, storage, tabstr:sub(1, #tabstr-1))
end
function getPlayerStorageTable(cid, storage)
    local tabstr = getPlayerStorageValue(cid, storage)
    local tab = {}
    if type(tabstr) ~= "string" then
        return {}
    end
    if tabstr:sub(1,1) ~= "&" then
        return {}
    end
    local tabstr = tabstr:sub(2, #tabstr)
    local a = string.explode(tabstr, ";")
    for i,x in pairs(a) do
        local b = string.explode(x, ",")
        tab[tonumber(b[1]) or b[1]] = tonumber(b[2]) or b[2]
    end
    return tab
end

function getGuildName(guildId)
local query = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. guildId .. ";")
if query:getID() == -1 then
    return nil
end
local guildName = query:getDataString("name")
query:free()
return tostring(guildName)
end

-- *****************************************************************************************************************************
-- © Copyright All rights deserved - Scriptzone 2019, Brazil
-- Website: www.scriptzone.com.br
-- *****************************************************************************************************************************
-- Esta biblioteca é propriedade dos clientes da Scriptzone
-- É proibida a venda ou distribuição em qualquer situação
-- A violação e identificaçao do violador implica punição legal
-- Para bom funcionamento dos scripts relacionados a essa biblioteca de funções não devem existir funções repetidas no arquivo
-- Caso já possua outra biblioteca de funções da Scriptzone, una-as em um só arquivo
-- *****************************************************************************************************************************
-- This library is Scriptzone's clients property
-- It is prohibited sale or distribution in any situation
-- Violation and identification of the violator implies legal punishment
-- For proper scripts operation related to this library of functions shouldn't have repeated function in the file
-- In case of there is another Scriptzone library of functions, join them in a single file
-- *****************************************************************************************************************************

function round(num, n)
    local m = 10^(n or 0)
    return math.floor(num*m + 0.5)/m
end

function checkContainerItems(container)
    local bp, t = getContainerItems(container), {}
    for index, item in pairs(bp) do
        if (#t >= 1 and not isInArray(t, item.itemid)) then
            return false
        end
        table.insert(t, item.itemid)
    end
    return true   
end

function getContainerSlotsFree(container)
return getContainerCap(container)-getContainerSize(container)
end

function getContainerItems(containeruid)
local items = {}
local containers = {}
if type(getContainerSize(containeruid)) ~= "number" then
return false
end
for slot = 0, getContainerSize(containeruid)-1 do
local item = getContainerItem(containeruid, slot)
if item.itemid == 0 then
break
end
if isContainer(item.uid) then
table.insert(containers, item.uid)
end
table.insert(items, item)
end
if #containers > 0 then
for i,x in ipairs(getContainerItems(containers[1])) do
table.insert(items, x)
end
table.remove(containers, 1)
end
return items
end
 
function getAllContainerFree(container)
local containers,soma = {},0
for i = 0, getContainerSize(container)-1 do
local item = getContainerItem(container, i)
if isContainer(item.uid) then
table.insert(containers, item.uid)
end
end
for _, check in pairs(containers) do
soma = soma + getContainerSlotsFree(check)
end
return (soma + getContainerSlotsFree(container))
end

function getMoneyInfo(moneycount)
    if moneycount < 1000 then
        return {id = 2148, price = moneycount}
    elseif moneycount >= 1000 and moneycount < 10000 then
        return {id = 2152, price = math.floor(moneycount / 100)*100}
    else
        return {id = 2160, price = math.floor(moneycount / 1000) * 1000}
    end
end

function capitalizeAll(str)
    return str:lower():gsub("%w+", 
        function(w) 
          return w:sub(1,1):upper() .. w:sub(2)
    end)
end

function ExistItemByName(name) 
local items = io.open("data/items/items.xml", "r"):read("*all")
local get = items:match('name="' .. name ..'"')
if get == nil or get == "" then
return false
end
return true
end 


function ExistSpellByName(name) 
local items = io.open("data/spells/spells.xml", "r"):read("*all")
local get = items:match('words="' .. name ..'"')
if get == nil or get == "" then
return false
end
return true
end 

function doRegisterInFile(cid, diretory, fileName, extension, msg, delFile)
    -- diretory: "data/lib/" // delFile, Ex: "data/lib/ind.xml" // 
    OfflineMessagesConfig = {
        messageSavingDirectory = ''..diretory..'', -- dir with saved messages (folder must exist!)
        messages = {
            messageType = MESSAGE_STATUS_CONSOLE_BLUE,
            ['cantSendMessage'] = "Error: Can't save message. Try it later.",
            ['messageSent'] = 'Ok, yours message has been sent to player %s.'
        },
        messageFormatString = '%s',
    }
    if delFile == "" then
        local file = io.open(diretory .. fileName .. '.'..extension..'', 'a+')
        if(not file) then
            -- print('[cantSendMessage]')
            return true
        end
        file:write(OfflineMessagesConfig.messageFormatString:format(msg) .. '\n')
        file:close()
        -- print('[messageSent]:format(destiny)')
    else
        os.remove(delFile)
    end
    return true
end