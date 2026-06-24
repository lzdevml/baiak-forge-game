local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|. Eu vendo todas as montarias do jogo! Basta dizer {montarias} ou {ajuda} se voce não sabe o que fazer.")
 
function playerBuyMountNPC(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
if (parameters.confirm ~= true) and (parameters.decline ~= true) then
if(getPlayerPremiumDays(cid) >= 1) and (parameters.premium == true) then
npcHandler:say('Desculpe, mas esta montaria e apenas para jogadores premium!', cid)
npcHandler:resetNpc()
return true
end
if (getPlayerStorageValue(cid, parameters.storageID) ~= -1) then
npcHandler:say('Voce ja tem esta montaria!', cid)
npcHandler:resetNpc()
return true
end
local itemsTable = parameters.items
local items_list = ''
if table.maxn(itemsTable) > 0 then
for i = 1, table.maxn(itemsTable) do
local item = itemsTable
items_list = items_list .. item[2] .. ' ' .. getItemNameById(item[1])
if i ~= table.maxn(itemsTable) then
items_list = items_list .. ', '
end
end
end
local text = ''
if (parameters.cost > 0) and table.maxn(parameters.items) then
text = items_list .. '' .. parameters.cost .. ' gp'
elseif (parameters.cost > 0) then
text = parameters.cost .. ' gp'
elseif table.maxn(parameters.items) then
text = items_list
end
npcHandler:say('Voce quer pagar ' .. text .. ' pelo ' .. keywords[1] .. '?', cid)
return true
elseif (parameters.confirm == true) then
local mountNode = node:getParent()
local mountinfo = mountNode:getParameters()
local items_number = 0
if table.maxn(mountinfo.items) > 0 then
for i = 1, table.maxn(mountinfo.items) do
local item = mountinfo.items
if (getPlayerItemCount(cid,item[1]) >= item[2]) then
items_number = items_number + 1
end
end
end
if(getPlayerMoney(cid) >= mountinfo.cost) and (items_number == table.maxn(mountinfo.items)) then
doPlayerRemoveMoney(cid, mountinfo.cost)
if table.maxn(mountinfo.items) > 0 then
for i = 1, table.maxn(mountinfo.items) do
local item = mountinfo.items
doPlayerRemoveItem(cid,item[1],item[2])
end
end
doPlayerAddMount(cid, mountinfo.mountid)
setPlayerStorageValue(cid,mountinfo.storageID,1)
npcHandler:say('Aqui esta.', cid)
else
npcHandler:say('Voce nao tem o dinheiro necessario, joga no bet!', cid)
end
npcHandler:resetNpc()
return true
elseif (parameters.decline == true) then
npcHandler:say('Este nao lhe interessa? Experimente outro!', cid)
npcHandler:resetNpc()
return true
end
return false
end
 
local noNode = KeywordNode:new({'no'}, playerBuyMountNPC, {decline = true})
local yesNode = KeywordNode:new({'yes'}, playerBuyMountNPC, {confirm = true})
 
-- battle badger (done)(custom)
local mount_node = keywordHandler:addKeyword({'whitelion'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,30}, mountid = 173, storageID = 54645665454657})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Donkey (done)(custom)
local mount_node = keywordHandler:addKeyword({'waterbuffalo'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,10}, mountid = 35, storageID = 54641665454658})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse (done)(custom)
local mount_node = keywordHandler:addKeyword({'walker'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,10}, mountid = 43, storageID = 54641665454659})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)


-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'uniwheel'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,40}, mountid = 15, storageID = 54641665454660})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)


-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'ursagrodon'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 38, storageID = 54641665454661})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'undeadcavebear'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,40}, mountid = 12, storageID = 54641665454662})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'tinlizzard'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 8, storageID = 54641665454663})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'thehellgrip'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,16}, mountid = 39, storageID = 54641665454664})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'azudocus'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 44, storageID = 54641665454665})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'tamedpanda'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,10}, mountid = 19, storageID = 54641665454666})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'stampor'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,10}, mountid = 11, storageID = 54641665454667})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'antelope'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,80}, mountid = 162, storageID = 54641665454668})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'battlebadger'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,16}, mountid = 152, storageID = 54641665454669})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'coralrhea'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 167, storageID = 54641665454670})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)


-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'eventidenandu'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 168, storageID = 54641665454671})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'savannaostrich'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 166, storageID = 54641665454672})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'blazebringer'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,15}, mountid = 9, storageID = 54641665454673})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'bluerollingbarrel'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,26}, mountid = 155, storageID = 54641665454674})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)
 
-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'carpacosaurus'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,20}, mountid = 45, storageID = 54641665454675})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'cerberuschampion'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,60}, mountid = 145, storageID = 54641665454676})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'crimsonray'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,60}, mountid = 33, storageID = 54641665454677})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'donkey'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,14}, mountid = 13, storageID = 54641665454679})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'dragonling'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,14}, mountid = 31, storageID = 54641665454680})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'dromedary'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,18}, mountid = 20, storageID = 54641665454681})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'gloothglider'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,35}, mountid = 71, storageID = 54641665454682})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'gnarlhound'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,35}, mountid = 32, storageID = 54641665454683})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'redrollingbarrel'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,25}, mountid = 156, storageID = 54641665454684})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'greenrollingbarrel'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,25}, mountid = 157, storageID = 54641665454685})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'haze'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,30}, mountid = 161, storageID = 54641665454686})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'hibernalmoth'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,40}, mountid = 131, storageID = 54641665454687})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  


-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'lacewingmoth'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,40}, mountid = 130, storageID = 54641665454688})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'ironblight'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,26}, mountid = 29, storageID = 54641665454689})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'joustingeagle'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,60}, mountid = 144, storageID = 54641665454690})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'kinglydeer'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,60}, mountid = 18, storageID = 54641665454691})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'ladybug'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,30}, mountid = 27, storageID = 54641665454692})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'magmacrawler'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,30}, mountid = 30, storageID = 54641665454693})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'mantaray'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,8}, mountid = 28, storageID = 54641665454694})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'midnightpanther'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,30}, mountid = 5, storageID = 54641665454695})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'mole'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,80}, mountid = 119, storageID = 54641665454696})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'noblenion'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,8}, mountid = 40, storageID = 54641665454696})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  

-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'patesaurian'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,42}, mountid = 37, storageID = 54641665454697})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  


-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'rapidboar'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,15}, mountid = 10, storageID = 54641665454698})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  


-- Rented Horse done)(custom)
local mount_node = keywordHandler:addKeyword({'shockhead'}, playerBuyMountNPC, {premium = false, cost = 0, items = {10559,15}, mountid = 42, storageID = 54641665454699})
mount_node:addChildKeywordNode(yesNode)
mount_node:addChildKeywordNode(noNode)  




keywordHandler:addKeyword({'montarias'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te vender {shockhead}, {rapidboar}, {patesaurian}, {midnightpanther}, {noblenion}, {mole}, {mantaray}, {magmacrawler}, {kinglydeer}, {joustingeagle}, {ironblight}, {lacewingmoth}, {hibernalmoth}, {haze}, {greenrollingbarrel}, {redrollingbarrel}, {gnarlhound}, {gloothglider}, {dragonling}, {donkey}, {crystalwolf}, {crimsonray}, {cerberuschampion}, {carpacosaurus}, {bluerollingbarrel}, {blazebringer}, {savannaostrich}, {coralrhea}, {battlebadger}, {antelope}, {thehellgrip}, {tinlizzard}, {undeadcavebear}, {ursagrodon}, {uniwheel}, {walker}, {whitelion}, {tamedpanda}, {undeadcavebear}, {eventidenandu}, {waterbuffalo}, {stampor}, {uniwheel} e o grande {rei scorpiao}.'})
keywordHandler:addKeyword({'ajuda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Para ter a montaria fale um dos nomes da lista (falando {montarias}) .'})
 
npcHandler:addModule(FocusModule:new())