local talk_state = 0

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()  npcHandler:onThink() end



function creatureSayCallback(cid, type, msg)


------------------- MISSOES MISSOES -----------------

--------------- PEGANDO INFORMACAO DA MISSAO Q PAROU
if msgcontains(msg, 'missoes') or msgcontains(msg, 'missao') then

if getPlayerLevel(cid) >= 100 and getPlayerStorageValue(cid, 88389) == -1 then
selfSay('Espere um pouco, voce ja e level 100 ou maior e pode pular as tasks inicais de rotworm, cyclops e dragon. Escolha {pular} ou {seguir}!  ', cid)
return true
end

if getPlayerStorageValue(cid, 88889) == -1 then
selfSay('Ola, estamos com problemas no bueiro da cidade, existe muitos rotworms por la, que tal matar alguns e trazer 40 {lump of dirt}?', cid)
elseif getPlayerStorageValue(cid, 88889) == 1 then
selfSay('Nas montanhas fora da cidade existem uns gigantes naquela area, traga para mim 30 {cyclops toe}.', cid)
elseif getPlayerStorageValue(cid, 88889) == 2 then
selfSay('Preciso da cauda daqueles dragoes para uma porcao, voce poderia trazer para mim 28 {Dragons Tail}?', cid)
elseif getPlayerStorageValue(cid, 88889) == 3 then
selfSay('Dizem que com aqueles cacos de gelo se pode fazer armas valiosas, poderia buscar para mim 25 {shard} dos frost dragons?', cid)
elseif getPlayerStorageValue(cid, 88889) == 4 then
selfSay('Aqueles sorceres tem um grande poder, parece que vem de seu anel. Traga para mim 5 {ring of the sky}', cid)
elseif getPlayerStorageValue(cid, 88889) == 5 then
selfSay('Grim reapers sao almas malignas, com sua foice causam medo e dor, como para-los? usando sua propria foice contra eles. Preciso de 2 {scythe} e 200 {demonic essence}', cid)
elseif getPlayerStorageValue(cid, 88889) == 6 then
selfSay('Demons sao servos do mal e nao podemos deixar-los vivos, se encontrar algum mate, aproveite e traga 100 {demon horn}', cid)
elseif getPlayerStorageValue(cid, 88889) == 7 then
selfSay('Aguarde novas missoes no proximo update.', cid)
end
end



if msgcontains(msg, 'pular') and getPlayerStorageValue(cid, 88389) == -1 then
selfSay('Ok, digite {missoes} para prosseguir...', cid)
setPlayerStorageValue(cid, 88389, 1)
setPlayerStorageValue(cid, 88889, 4)
elseif msgcontains(msg, 'seguir') and getPlayerStorageValue(cid, 88389) == -1 then
selfSay('Ok, digite {missoes} para prosseguir...', cid)
setPlayerStorageValue(cid, 88389, 1)
end



	
			---	PRIMEIRA rotworm - lump of dirt
			
			
			

						if msgcontains(msg, 'storage') then
						selfSay(getPlayerStorageValue(cid, 88889), cid)
						end
			
----- Primeira - rotworm
			
if msgcontains(msg, 'lump of dirt') or msgcontains(msg, 'rotworm')  then
	if getPlayerItemCount(cid, 10609) >= 40 then
	if getPlayerStorageValue(cid, 88889) == -1 then
		doPlayerRemoveItem(cid,10609,40)
		setPlayerStorageValue(cid, 88889, 1)
		doPlayerAddItem(cid,2160,5)
		doPlayerAddExp(cid,65000)
		selfSay('Voce recebeu 65,000 de xp, 50k. Tenho mais {missoes} para voce. Nao se esqueca de pedir sua promocao ao rei.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end

------ Segunda - Cyclops

if msgcontains(msg, 'cyclops toe') or msgcontains(msg, 'cyclops')  then
	if getPlayerItemCount(cid, 10574) >= 30 then
	if getPlayerStorageValue(cid, 88889) == 1 then
		doPlayerRemoveItem(cid,10574,30)
		setPlayerStorageValue(cid, 88889, 2)
		doPlayerAddItem(cid,2160,3)
		doPlayerAddExp(cid,150000)
		selfSay('Voce recebeu 150,000 de xp, 30k. Tenho mais {missoes} para voce.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end


------ Terceira - Dragons

if msgcontains(msg, 'dragons tail') or msgcontains(msg, 'dragon')  then
	if getPlayerItemCount(cid, 12413) >= 28 then
	if getPlayerStorageValue(cid, 88889) == 2 then
		doPlayerRemoveItem(cid,12413,28)
		setPlayerStorageValue(cid, 88889, 3)
		doPlayerAddItem(cid,2160,2)
		doPlayerAddItem(cid,2475,1)
		doPlayerAddExp(cid,150000)
		selfSay('Voce recebeu 150,000 de xp, 20k e warrior helmet. Tenho mais {missoes} para voce.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end


------ Quarta - Frost Dragon

if msgcontains(msg, 'shard') or msgcontains(msg, 'frost dragon')  then
	if getPlayerItemCount(cid, 7290) >= 25 then
	if getPlayerStorageValue(cid, 88889) == 3 then
		doPlayerRemoveItem(cid,12413, 25)
		setPlayerStorageValue(cid, 88889, 4)
		doPlayerAddItem(cid,2160,2)
		doPlayerAddItem(cid,7902,1)
		doPlayerAddExp(cid,200000)
		selfSay('Voce recebeu 250,000 de xp, 20k e glacier mask. Tenho mais {missoes} para voce.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end


------ Quinta - Warlock

if msgcontains(msg, 'ring of the sky') or msgcontains(msg, 'warlock')  then
	if getPlayerItemCount(cid, 2123) >= 5 then
	if getPlayerStorageValue(cid, 88889) == 4 then
		doPlayerRemoveItem(cid,2123, 5)
		setPlayerStorageValue(cid, 88889, 5)
		doPlayerAddItem(cid,2160,10)
		doPlayerAddItem(cid,8903,1)
		doPlayerAddItem(cid,6527,1) -- event coin
		doPlayerAddExp(cid,500000)
		selfSay('Voce recebeu 500.000 de xp, 100k e spellbook of the lost souls. Tenho mais {missoes} para voce.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end


----- Sexta - Grim Reaper

if msgcontains(msg, 'scythe') or msgcontains(msg, 'demonic essence') or msgcontains(msg, 'grim reaper')  then
	if getPlayerItemCount(cid, 2550) >= 2 and getPlayerItemCount(cid, 6500) >= 200 then
	if getPlayerStorageValue(cid, 88889) == 5 then
		doPlayerRemoveItem(cid,2550, 2)
		doPlayerRemoveItem(cid,6500, 150)
		setPlayerStorageValue(cid, 88889, 6)
		doPlayerAddItem(cid,6527,2) -- event coin
		doPlayerAddExp(cid,700000)
		selfSay('Voce recebeu 700.000 de xp, 2 event coin e 50 demonic essence. Tenho mais {missoes} para voce.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end



------ Setima --- Demons

if msgcontains(msg, 'demon horn') or msgcontains(msg, 'demon')  then
	if getPlayerItemCount(cid, 5954) >= 100 then
	if getPlayerStorageValue(cid, 88889) == 6 then
		doPlayerRemoveItem(cid,2550, 2)
		doPlayerRemoveItem(cid,6500, 150)
		setPlayerStorageValue(cid, 88889, 7)
		doPlayerAddItem(cid,2444,1)
		doPlayerAddItem(cid,6527,3) -- event coin
		doPlayerAddExp(cid,1000000)
		selfSay('Voce recebeu 1.000.000 de xp, 3 event coin e hammer of wrath. Tenho mais {missoes} para voce.', cid)
	else
	selfSay('Desculpe, voce ja fez essa missao.', cid)
	end
	else
	selfSay('Desculpe, voce nao tem a quantidade correta dos itens necessarios.', cid)
	end
end








return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())