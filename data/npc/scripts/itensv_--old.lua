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
if(msgcontains(msg, 'change')) then 
selfSay('Eu troco {mega boots por mega amulet} | {mega amulet por mega boots} | {mega staff por mega blade} | {mega staff por mega hammer} | {mega staff por mega axe}, {mega staff por mega slingshot} {mega slingshot por mega staff} {mega slingshot por mega blade}, {mega slingshot por mega hammer}, {warrior`s sweat}, {simon the beggar`s favorite staff}, {Waterhose}, {Ceiron`s Wolf Tooth Chain}, {fighting spirit}, {elane`s} {crossbow}, {spool of yarn}, {voodoo doll}, {demon horns}, {vampiric crest}, {ankh} e {Nilsor`s waterskin}.', cid) 
elseif(msgcontains(msg, 'mega boots por mega amulet')) then 
selfSay('Voc\ê quer trocar uma mega boots por um mega amulet?', cid) 
talkState[talkUser] = 1 
elseif(msgcontains(msg, 'mega amulet por mega boots')) then 
selfSay('Voc\ê quer trocar um mega amulet por uma mega boots?', cid) 
talkState[talkUser] = 2 
elseif(msgcontains(msg, 'mega staff por mega blade') )then 
selfSay('Voc\ê quer trocar uma mega staff por uma mega blade?', cid) 
talkState[talkUser] = 3 
elseif(msgcontains(msg, 'mega staff por mega hammer')) then 
selfSay('Voc\ê quer trocar uma mega staff por uma mega hammer?', cid) 
talkState[talkUser] = 4 
elseif(msgcontains(msg, 'mega staff por mega axe')) then 
selfSay('Voc\ê quer trocar um mega staff por mega axe?', cid) 
talkState[talkUser] = 5 
elseif(msgcontains(msg, 'mega staff por mega slingshot')) then 
selfSay('Voc\ê quer trocar uma mega staff por mega slingshot?', cid) 
talkState[talkUser] = 6 
elseif(msgcontains(msg, 'mega slingshot por mega staff')) then 
selfSay('Voc\ê quer trocar uma mega slingshot por mega staff?', cid) 
talkState[talkUser] = 7 
elseif(msgcontains(msg, 'mega slingshot por mega blade')) then 
selfSay('Voc\ê quer trocar uma mega slingshot por mega blade?', cid) 
talkState[talkUser] = 8 
elseif(msgcontains(msg, 'mega slingshot por mega hammer')) then 
selfSay('Voc\ê quer trocar uma mega slingshot por mega hammer?', cid) 
talkState[talkUser] = 9 
elseif(msgcontains(msg, 'mega slingshot por mega ')) then 
selfSay('Voc\ê quer trocar uma mega slingshot por mega ?', cid) 
talkState[talkUser] = 10 
elseif(msgcontains(msg, 'Waterhose')) then 
selfSay('Voc\ê quer trocar uma Knight Legs por um Waterhose?', cid) 
talkState[talkUser] = 11 
elseif(msgcontains(msg, 'fighting spirit')) then 
selfSay('Voc\ê quer trocar DOIS Royal Helmets por um Fighting Spirit?', cid) 
talkState[talkUser] = 12 
elseif(msgcontains(msg, 'elane`s crossbow')) then 
selfSay('Voc\ê quer trocar um Vampire Shield por um elane`s crossbow?', cid) 
talkState[talkUser] = 13 
elseif(msgcontains(msg, 'Nilsor`s waterskin')) then 
selfSay('Voc\ê quer trocar 20 Fire Sword por um Nilsor`s waterskin?', cid) 
talkState[talkUser] = 14 
elseif(msgcontains(msg, 'vampiric crest')) then 
selfSay('Voc\ê quer trocar uma Golden Legs por um Vampiric Crest?', cid) 
talkState[talkUser] = 15 
elseif(msgcontains(msg, 'ankh')) then 
selfSay('Voc\ê quer trocar um Crystal coins por um Ankh?', cid) 
talkState[talkUser] = 16
elseif(msgcontains(msg, 'spool of yarn')) then 
selfSay('Voc\ê quer trocar um Crystal coins por um Spool of Yarn?', cid) 
talkState[talkUser] = 17
elseif(msgcontains(msg, 'voodoo doll')) then 
selfSay('Voc\ê quer trocar 200k por um voodoo doll?', cid) 
talkState[talkUser] = 18
elseif(msgcontains(msg, 'demon horns')) then 
selfSay('Voc\ê quer trocar 20k por um demon horns?', cid) 
talkState[talkUser] = 19

 
-- Confirmação da Compra  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then  
if(doPlayerRemoveItem(cid, 9931, 1) == true) then  
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 8266, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voc\ê n\ão tem uma mega boots.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then 
if(doPlayerRemoveItem(cid, 8266, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 9931, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voc\ê n\ão tem um mega amulet.', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then 
if(doPlayerRemoveItem(cid, 7958, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 8932, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem uma mega staff.', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 4) then 
if(doPlayerRemoveItem(cid, 7958, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7450, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem uma mega staff.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 5) then 
if(doPlayerRemoveItem(cid, 7958, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7455, 1)  
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem uma mega staff.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 6) then 
if(doPlayerRemoveItem(cid, 7958, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5907, 1)  
talkState[talkUser] = 0 
else  
selfSay('Voc\ê n\ão tem uma mega staff.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 7) then 
if(doPlayerRemoveItem(cid, 5907, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7958, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voc\ê n\ão tem um mega slingshot.', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 8) then 
if(doPlayerRemoveItem(cid, 5907, 4) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 8932, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem QUATRO Warrior Helmets.', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 9) then 
if(doPlayerRemoveItem(cid, 5907, 2) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 7450, 1)  
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem DUAS Skull Staff.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 10) then 
if(doPlayerRemoveItem(cid, 2401, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 6107, 1)  
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem uma Staff.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 11) then  
if(doPlayerRemoveItem(cid, 2477, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5938, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voc\ê n\ão tem uma Knight Legs.', cid) 
talkState[talkUser] = 0  
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 12) then 
if(doPlayerRemoveItem(cid, 2498, 2) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5884, 1) 
talkState[talkUser] = 0 
else  
selfSay('Voc\ê n\ão tem DOIS Royal Helmets.', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 13) then 
if(doPlayerRemoveItem(cid, 2534, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5947, 1)  
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem um Vampire Shield.', cid) 
talkState[talkUser] = 0 
end  
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 14) then 
if(doPlayerRemoveItem(cid, 2392, 20) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5939, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem 20 Fire Sword.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 15) then 
if(doPlayerRemoveItem(cid, 2470, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 9955, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem uma Golden Legs.', cid) 
talkState[talkUser] = 0 
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 16) then 
if(doPlayerRemoveItem(cid, 2160, 1) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 2193, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem um Crystal coins.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 17) then 
if(doPlayerRemoveItem(cid, 2160, 5) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5886, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem um Crystal coins.', cid) 
talkState[talkUser] = 0 
end 
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 18) then 
if(doPlayerRemoveItem(cid, 2160, 20) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 3955, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem um Crystal coins.', cid) 
talkState[talkUser] = 0 
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 19) then 
if(doPlayerRemoveItem(cid, 2160, 2) == true) then 
selfSay('Obrigado por comprar!', cid) 
doPlayerAddItem(cid, 5954, 1) 
talkState[talkUser] = 0 
else 
selfSay('Voc\ê n\ão tem um Crystal coins.', cid) 
talkState[talkUser] = 0 
end
end 
return TRUE 
end 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())