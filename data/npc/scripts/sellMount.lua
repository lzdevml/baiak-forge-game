 -- By Wes
local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end 
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end 
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end 
function onThink()  
                      npcHandler:onThink()    end
local focuses = {}
local function isFocused(cid)
    for i, v in pairs(focuses) do
        if(v == cid) then
            return true
        end
    end
    return false
end

local function addFocus(cid)
    if(not isFocused(cid)) then
        table.insert(focuses, cid)
    end
end
local function removeFocus(cid)
    for i, v in pairs(focuses) do
        if(v == cid) then
            table.remove(focuses, i)
            break
        end
    end
end
local function lookAtFocus()
    for i, v in pairs(focuses) do
        if(isPlayer(v)) then
            doNpcSetCreatureFocus(v)
            return
        end
    end
    doNpcSetCreatureFocus(0)
end
 
function onCreatureDisappear(cid)
    if(isFocused(cid)) then
        selfSay("Goodbye.")
        removeFocus(cid)
    end
end
 
local config = {
   StorageFreePack = 88005,
   mountLevel = 100,
   coin = 2160,
   count = 100,
}
-- Storage IDs -- 
citizen = 22001  
hunter        = 22004     

mountFreePack = 88005
countFreePack = 1

-- function onCreatureSay(cid, type, msg)
    -- if((msg == "free pack") and not (isFocused(cid))) then
	
    -- addon = getPlayerStorageValue(cid,mountFreePack) 
    -- if addon == -1 then 
        -- if getPlayerItemCount(cid,10559) >= 1 then 
        -- if doPlayerRemoveItem(cid,10559,1) then 
            -- selfSay(newaddon, cid) 
            -- doSendMagicEffect(getCreaturePosition(cid), 13) 
            -- setPlayerStorageValue(cid,mountFreePack,1) 
        -- end 
        -- else 
            -- selfSay(noitems, cid) 
        -- end 
    -- else 
        -- selfSay(already, cid) 
    -- end 
    -- end
-- end

function onCreatureSay(cid, type, msg)
    if((msg == "hi") and not (isFocused(cid))) then
        selfSay("Ola, ".. getCreatureName(cid) ..".", cid, true)
        selfSay("Eu vendo {free pack} de montarias, gostaria de comprar? Para usar as Mounts diga !mount, é necessário ter o cliente próprio.", cid)
        addFocus(cid)
        status = 1
    elseif((isFocused(cid)) and (msg == "free pack")  or (msg == "Free Pack") or (msg == "free")  and (status == 1)) then
	
        if (getPlayerStorageValue(cid, config.StorageFreePack)) then
            -- if (getPlayerLevel(cid) >= config.mountLevel) then
			if getPlayerLevel(cid) >= config.mountLevel then
                if getPlayerItemCount(cid, config.coin) >= config.count then
                    selfSay("Tem certeza que deseja comprar free pack por ".. config.count .. " Crystal Coins?", cid)
                    status = 2
                else
                    selfSay("Você não tem " .. config.count .. " Crystal Coins.", cid)
                    status = 1
                end
                else
                    selfSay("Você precisa estar pelo menos no nivel " .. mountLevel .. ".", cid)
                status = 1
            end
        end
		
    elseif((isFocused(cid)) and (msg == "yes") and (status == 2)) then
	    doPlayerRemoveItem(cid, config.coin, config.count)
        selfSay("Ok, eu vou lhe vender.", cid)
		setPlayerStorageValue(cid, config.StorageFreePack,1)
        removeFocus(cid)
    elseif((isFocused(cid)) and (msg == "no") and (status == 2)) then
        selfSay("Talvez um dia você se torne sábio e mude de ideia!", cid)
        status = 1
    elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya")) then
        selfSay("Goodbye!", cid, true)
        removeFocus(cid)
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
