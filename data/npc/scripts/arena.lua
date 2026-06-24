domodlib('arenaFunctions')
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local focus = 0
local talk_start = 0
local TS = 0

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye then.')
focus = 0
talk_start = 0
end
end

local function BYE()
focus = 0
talk_start = 0
TS = 0
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
msg = string.lower(msg)
if (msgcontains(msg, 'hi') and (focus == 0)) then
selfSay('Hello ' .. getCreatureName(cid) .. ', do you want to make arena?')
focus = cid
talk_start = os.clock()
TS = 1
elseif msgcontains(msg, 'hi') and (focus ~= cid) then
selfSay('Im Bussy')
elseif TS == 1 and msgcontains(msg, 'yes') or msgcontains(msg, 'fight') or msgcontains(msg, 'arena') then
if getPlayerStorageValue(cid, myArenaLevel) < 3 then
local enterArena = myArenaLevelIs(cid)
if getPlayerLevel(cid) >= enterArena.RLV then
if getPlayerMoney(cid) >= enterArena.RC then
setPlayerStorageValue(cid, talkNPC, 1)
doPlayerRemoveMoney(cid, enterArena.RC)
selfSay("Now you can go to test... ".. enterArena.LN .."!")
BYE()
else
selfSay("You don\'t have "..enterArena.RC.." gp! Come back when you will be ready!")
BYE()
end
else
selfSay("You don\'t have "..enterArena.RLV.." level! Come back when you will be ready!")
BYE()
end
else
selfSay(Cancel[6])
BYE()
end
elseif TS == 1 and msgcontains(msg, 'no') then
selfSay("Bye!")
BYE()
elseif msgcontains(msg, 'bye') then
selfSay("Bye!")
BYE()
end
return true
end

function onThink()
doNpcSetCreatureFocus(focus)
if (os.clock() - talk_start) > 10 then
if focus > 0 then
selfSay('Good bye then.')
end
focus = 0
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())