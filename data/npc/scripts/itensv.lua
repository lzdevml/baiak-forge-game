local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 
local talkState = {} 
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end 
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end 
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end 
function onThink() npcHandler:onThink() end 
 
function creatureSayCallback(cid, type, msg) 
if(not npcHandler:isFocused(cid)) then 
return false  
end  
 
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid  
 
-- Conversa Jogador/NPC  
if(msgcontains(msg, 'vip')) then 
selfSay('Voce deseja trocar {vip itens} ou {outros} itens', cid) 
elseif(msgcontains(msg, 'change')) then 
selfSay('Lembre-se eu troco todos os itens porem {nao se esqueca de tirar todos equipamentos vip inclusive do corpo, existe um depot no andar de cima. A Troca funciona assim, voce me diz o nome do item que voce quer ex: vip boots, e eu removerei um item equivalente que voce esteja usando ou na backpack, por tanto, cuidado!', cid) 
elseif(msgcontains(msg, 'outros')) then
selfSay('Diga qual item {Waterhose}, {Ceiron`s Wolf Tooth Chain}, {fighting spirit}, {elane`s} {crossbow}, {spool of yarn}, {voodoo doll}, {demon horns}, {vampiric crest}, {ankh} e {Nilsor`s waterskin}.', cid)
elseif(msgcontains(msg, 'vip boots')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {vip boots} em troca de um item vip?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'wand vip')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {wand vip} em troca de um item vip?', cid) 
talkState[talkUser] = 2
elseif(msgcontains(msg, 'stin lingue vip')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {stin lingue vip} em troca de um item vip?', cid) 
talkState[talkUser] = 3
elseif(msgcontains(msg, 'vip warlord sword')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {vip warlord sword} em troca de um item vip?', cid) 
talkState[talkUser] = 4
elseif(msgcontains(msg, 'vip hammer of prophecy')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {vip hammer of prophecy} em troca de um item vip?', cid) 
talkState[talkUser] = 5
elseif(msgcontains(msg, 'vip mythril axe')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {vip mythril axe} em troca de um item vip?', cid) 
talkState[talkUser] = 6
elseif(msgcontains(msg, 'vip god amulet')) then 
selfSay('Nao esqueca de guardar todos os itens vip. Tem certeza que quer receber uma {vip god amulet} em troca de um item vip?', cid) 
talkState[talkUser] = 7
elseif(msgcontains(msg, 'ultimate warrior shield')) then 
selfSay('Shield e obtido por quest por tanto nao trocamos.', cid) 
talkState[talkUser] = 8
elseif(msgcontains(msg, 'ultimate mage shield')) then 
selfSay('Shield e obtido por quest por tanto nao trocamos.', cid) 
talkState[talkUser] = 9

 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 12692, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7958, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5907, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 8932, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7450, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7455, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then  
if(doPlayerRemoveItem(cid, 12692, 1) == true or doPlayerRemoveItem(cid, 8266, 1) == true or doPlayerRemoveItem(cid, 7958, 1) == true or doPlayerRemoveItem(cid, 8932, 1) == true or doPlayerRemoveItem(cid, 7450, 1) == true or doPlayerRemoveItem(cid, 7455, 1) == true or doPlayerRemoveItem(cid, 5907, 1) == true ) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 8266, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voce nao tem nenhum item vip para trocar.', cid) 
talkState[talkUser] = 0  
end  
elseif(talkState[talkUser] == 8 or talkState[talkUser] == 9) then  
talkState[talkUser] = 0 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then 
if(doPlayerRemoveItem(cid, 2401, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 6107, 1)  
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem uma Staff.', cid) 
talkState[talkUser] = 0 
end
end 
return TRUE 
end 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())