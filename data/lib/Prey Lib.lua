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

function capitalizeAll(str)
    return str:lower():gsub("%w+", 
        function(w) 
          return w:sub(1,1):upper() .. w:sub(2)
    end)
end

-- Converte Número para Casas Milhar [1200000 to 1.200.000]
function milharFormat(valor)
    local formatado = valor
    while true do  -- O "." entre "%1" e "%2" é o separador
        formatado, n = string.gsub(formatado, "^(-?%d+)(%d%d%d)", '%1.%2')
        if ( n ==0 ) then
            break
        end
    end
    return formatado
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

function getPlayerLastLogout(cid, date_string)
    local query = db.getResult("SELECT `lastlogout` as `logout_time` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. ";")
    if query:getID() == -1 then
        return false
    end
    local logoutTime = query:getDataInt("logout_time")
    return not date_string and logoutTime or os.date("%d %B %Y %X", logoutTime)
end

---

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