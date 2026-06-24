local talk_state = 0

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)end
function onThink()  npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if msgcontains(msg, 'blood city') then
selfSay('Sim, a cidade principal...', cid)
end

if msgcontains(msg, 'biblioteca') then
selfSay('Sim, depois do teleport que voce encontrar nos warlocks procure por uma pequena biblioteca, la contem livros importantes sobre a historia do ring...', cid)
end

if msgcontains(msg, 'a') then
selfSay('as'..getPlayerStorageValue(cid, 48001)..'a', cid)
end

if msgcontains(msg, 'reset') then
setPlayerStorageValue(cid, 48001, -1)
end

if msgcontains(msg, 'fling') then 
if getPlayerStorageValue(cid, 48001) == -1 then
selfSay('Caro amigo, essa cidade esconde muitos segredos a maior delas e sobre o {Fling Ring}, mas disso conversamos outra hora.', cid)
selfSay('Gostei de voce mas para visitar minha cidade eu gostaria que voce me fizesse um favor, pode ir ate {blood city} em meu barco onde esqueci uma garrafa de {vinho} e traze-la para mim.', cid)
elseif getPlayerStorageValue(cid, 48001) == 1 then
selfSay('Voce novamente? Bom creio que se interessou pelo Fling Ring, mas voce ja explorou a cidade? Dentro da cidade voce vai encontrar a sala principal do {labirinto} de fling, assim que encontrar volte aqui.',cid)
elseif getPlayerStorageValue(cid, 48001) == 2 then
selfSay('Encontrou o labirinto! Bom como voce deve ter visto existem 5 locais para acessar o labirinto, mas voce precisa de uma chave, eu conheco 3 baus em fling. Um ao north perto dos Frost Dragons, um ao Sul nos Hellspawns e o ultimo no West na {biblioteca} dos Warlocks. Em um dos 3 baus vai estar uma {chave}.',cid)
elseif getPlayerStorageValue(cid, 48001) == 4 then
selfSay('Bom o que eu posso dizer agora e que voce precisa de um total de 5 aventureiros para acessar o labirinto, os 5 devem ter essa chave para entrar la. Cuidado para se librar do local e preciso ser sabio!',cid)
return true
end
end
----------------- DUNGEONS ---------
--- Vinho
if msgcontains(msg, 'vinho') then
if getPlayerStorageValue(cid, 48001) == -1 then
if getPlayerItemCount(cid,2007) >= 1 then
doPlayerRemoveItem(cid,2007,1)
selfSay('Obrigado, agora lhe darei acesso a minha ilha, BEM VINDO a {Fling}! Qualquer duvida sobre {fling} voce pode vir ate mim.', cid)
setPlayerStorageValue(cid, 48001, 1)
else
selfSay('Estou esperando minha garra de vinho',  cid)
return true
end
else
selfSay('Se voce nao fez essa missao, voce a pulou, diga {fling}', cid)
return true
end
end


--- Exploracao
if msgcontains(msg, 'labirinto') then
if getPlayerStorageValue(cid, 48001) == 2 then
selfSay('Parabens esta explorando bem a cidade, caso se interesse pelo ring fale comigo novamente sobre {fling}.', cid)
setPlayerStorageValue(cid, 48001, 3)
else
selfSay('Voce ainda nao encontrou a sala principal do labirinto de fling, volte quando achar.!', cid)
return true
end
selfSay('Se voce nao fez essa missao, voce a pulou, diga {fling}', cid)
return true
end

if msgcontains(msg, 'chave') then
if getPlayerStorageValue(cid, 48001) == 4 then
selfSay('Bom o que eu posso dizer agora e que voce precisa de um total de 5 aventureiros para acessar o labirinto, os 5 devem ter essa chave para entrar la. Cuidado para se librar do local e preciso ser sabio!', cid)
setPlayerStorageValue(cid, 48001, 5)
else
selfSay('Voce ainda nao encontrou a sala principal do labirinto de fling, volte quando achar.!', cid)
return true
end
selfSay('Se voce nao fez essa missao, voce a pulou, diga {fling}', cid)
return true
end



return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())