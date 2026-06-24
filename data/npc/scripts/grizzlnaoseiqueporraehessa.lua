local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}

local data = {
	[14001] = {'elf', 'I want you to kill 100 of them. If you succeed, I\'ll provide you some pretty experience.', 'You have already smashed %u elfs. Come back to me when you are done.', 'Another option if you want to do a task would be to repeat killing 100 elfs. Would that suit your taste better? Ask me for a {task}.', 10000, 1},
	[14002] = {'orc', 'If you could kill 150 orcs for us, that\'d be a good start.', 'You have already smashed %u orcs. Come back to me when you are done.', 'Congratulations, you\'ve fought well against the orcs plague. Thank you! Here is your reward!  Would that suit your taste better? Ask me for a {task}.', 25000, 1},
	[14003] = {'rotworm', 'If you could kill 300 rotworms for us, maybe you have noticed the numerous rotworms. They\'re quite a pest. You look strong enough to be able to vanquish a few for us.', 'You have already smashed %u rotworms. Come back to me when you are done.', 'Well done! Thanks to you the city is a bit safer. Here\'s your reward! Ask me for a {task}.', 30000, 1},
	[14004] = {'cyclops', 'If you could kill 500 of them. We\'re always looking for adventurers who\'d help us decimate the number of cyclopes.', 'You have already smashed %u cyclops. Come back to me when you are done.', 'Very good job. You\'ve been a great help. Here\'s your reward! Ask me for a {task}.', 45000, 1},
	[14005] = {'crocodile', 'Happy hunting, old chap! Come back to me when you are through with your task.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u crocodiles. Come back to me when you are done.', 'Spiffing work, old chap. Now I have a special task for you. Recently several citizens of Port Hope have vanished. It is rumoured that they were killed by a crocodile. The people call it \'Snapper\'. Hunt down and kill that evil man eating beast.', 35000, 1, 'Snapper'},
    [14006] = {'tarantula', 'Happy hunting, old chap! Come back to me when you are through with your task.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u tarantulas. Come back to me when you are done.', 'Nicely done! Now I shall assign you a special task. Rumour has it that there is an ancient and evil tarantula who preys on humans. She is called \'Hide\'. Track her down and kill her! Good luck, old chap.', 35000, 1, 'Hide'},
    [14007] = {'carniphila', 'Good show, old chap! Speak to me again when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u carniphilas. Come back to me when you are done.', 'That took some time, huh? Good hunting though. If you\'re up for another hunting mission just ask me for a {task}.', 50000, 1},
    [14008] = {'stone golem', 'Happy hunting, friend! When you have finished hunting, return here. ', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u stone golems. Come back to me when you are done.', 'Good show, old chap. If you\'re up for another hunting mission just ask me for a task.', 50000, 1},
    [14009] = {'mammoth', 'Happy hunting, friend! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u mammoths. Come back to me when you are done.', 'Jolly good job you did there, but now I have a special task for you. The citizens of Svargrond live in fear because of a frightfully bad-tempered mammoth they call \'Blood Tusk\'. Go there and put an end to him. Happy hunting!', 40000, 1, 'Bloodtusk'},
    [14010] = {'ice golem', 'Happy hunting, friend! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u ice golems. Come back to me when you are done.', 'As i see it, you need more of a challenge! I have heard that there is an ice golem the hunters in Svargrond call \'Shardhead\'. He is an extremely dangerous example of his kind! I believe you are equal to the task, %s!', 50000, 1, 'Shardhead'},
	[14011] = {'quara constrictor scout', 'Happy hunting, friend! Come back to me when you are done hunting.', 'Alright, then you should go on with your task. You have already killed %u quara scouts in total. Come back to me when you are done.', 'Jolly good show! What a hunter! If you\'re up for another hunting mission just ask me for a {task}.', 65000, 1}, -- ?
    [14012] = {'quara constrictor', 'Happy hunting, friend! Come back to me when you are done hunting.', 'Alright, then you should go on with your task. You have already killed %u underwater quaras in total. Come back to me when you are done.', 'Superb work. However, there is something else I want you to do. It is said that there is a Quara general named \'Thul\' who is responsible for the attacks on Liberty Bay. Find him and kill him and bring peace to Liberty bay!', 50000, 1, 'Thul'}, -- OK
    [14013] = {'water elemental', 'Happy hunting, my old mocker! Come back to me when you are done hunting. ', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u water elementals. Come back to me when you are done.', 'Fantastic! If you\'re up for another hunting mission just ask me for a {task}.', 50000, 1},
    [14014] = {'earth elemental', 'Happy hunting, friend! Come back to me when you are done hunting. ', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u earth elementals. Come back to me when you are done.', 'Fantastic! If you\'re up for another hunting mission just ask me for a {task}.', 50000, 1},
    [14015] = {'elephant', 'Happy hunting, pal! Come back to me when you are done hunting. ', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u elephants. Come back to me when you are done.', 'Fantastic! If you\'re up for another hunting mission just ask me for a {task}.', 50000, 1},
    [14016] = {'killer caiman', 'Happy hunting, old friend! Come back to me when you are done hunting. ', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u killer caimans. Come back to me when you are done.', 'Fantastic! If you\'re up for another hunting mission just ask me for a {task}.', 60000, 1},
    [14017] = {'mutated rat', 'Happy hunting, old chap! Come back to me when you are done hunting. ', 'Alright, then stop dilly dallying here and go on with your task. You have already exterminated %u mutated rats. Come back to me when you are done.', {'Very good work, old chap. Lucky you are here - I have just been told of a task which is perfect for you. ...', 'The Yalaharians are having a spot of bother with a huge mutated rat. They call it \'Esmeralda\' and you should find her somewhere in the sewers. Good hunting!'}, 40000, 1, 'Esmeralda'}, -- OK
    [14018] = {'giant spider', 'Jolly good show! Come back to me when you are done hunting. ', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u giant spiders. Come back to me when you are done.', 'Well THAT was a hunt. Good job. Have you heared about \'The Old Widow\'? It must have a hideout. Try to find it and slay the beast.', 60000, 1, 'Old Widow'},
	[14019] = {'hydra', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u hydras. Come back to me when you are done.', {'With Nornur the God of Fate as my witness, you are truly born to hunt. If anyone can do this task, you can! Listen: ...', 'It is said that the Lizards of Chor are training hydras for attacks against us. They have already successfully bred a hydra named \'The Many\'. Find her and kill her!'}, 120000, 2, 'Many'},
    [14020] = {'sea serpent', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u sea serpents. Come back to me when you are done.', 'Good job, old chap! Are you up for a challenge? Have you heard of the legendary sea serpent called \'The Leviathan\'? It must be somewhere near the spot you found. This is a true test of your hunting skills - find it and kill it. Good hunting!', 120000, 2, 'Leviathan'},
    [14021] = {'behemoth', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u behemoths. Come back to me when you are done.', 'Such marvellous hunting skills! Perhaps you can help me with this one. Have you heard about \'Stonecracker\'? ...', 135000, 2, 'Stonecracker'}, -- OK
    [14022] = {'serpent spawn', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u serpent spawns. Come back to me when you are done.', 'My - you can be proud of yourself! However, you\'re not finished yet. There are rumours about a being called \'The Noxious Spawn\' which was seen deep down in the ruins of Banuta. Try to find its hideout.', 120000, 2, 'Noxious Spawn'},
	[14025] = {'pirate ghost', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u pirates. Come back to me when you are done.', 'My - you can be proud of yourself! However, you\'re not finished yet. There are rumours about a being called \'Captains Pirates\' which was seen deep down in the ruins of Banuta. Try to find its hideout.', 75000, 2, 'Captains Pirates'},
	[14026] = {'minotaur', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u minotaurs. Come back to me when you are done.', 'My - you can be proud of yourself! However, you\'re not finished yet. There are rumours about a being called \'The Horned Fox\' which was seen deep down in the ruins of Banuta. Try to find its hideout.', 75000, 2, 'Horned Fox'},
	[14027] = {'necromancer', 'Happy hunting, old chap! Come back to me when you are done hunting.', 'Alright, then return to your duties! Day light is a-wasting! You have already smashed %u necromancers or priestess. Come back to me when you are done.', 'My - you can be proud of yourself! However, you\'re not finished yet. There are rumours about a being called \'Necropharus\' which was seen deep down in the ruins of Banuta. Try to find its hideout.', 150000, 2, 'Necropharus'}
}
 
local curTask = 14500
local points = 14501
local rank = 14502
local questLog = 14503
local tiquanda = 14505
local demodras = 14506
 
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end
 

function greetCallback(cid)
    local cur, r, msg = getPlayerStorageValue(cid, points), getPlayerStorageValue(cid, rank)
    if cur >= 5 and r < 1 then
        msg = 'Welcome back |PLAYERNAME|. You have completed 5 tasks for our society. Ask me for a {promotion} to advance your rank!'
    elseif cur >= 10 and r < 2 then
        msg = 'Good to see you again |PLAYERNAME|. You have completed 10 tasks for our society. Ask me for a {promotion} to advance your rank!'
    elseif cur >= 20 and r < 3 then
        msg = 'Salutations |PLAYERNAME|. You have completed 20 tasks for our society. Ask me for a {promotion} to advance your rank!'
    elseif cur >= 30 and r < 4 then
        msg = 'Always good to welcome you back, |PLAYERNAME|. You have completed 30 tasks for our society. Ask me for a {promotion} to advance your rank!'
    elseif cur >= 50 and r < 5 then
        msg = 'By the gods....50 hunting tasks....this is astounding! Ask me for a {promotion} to advance your rank! And while you are here, I also have another {special} task for you.'
    else
        msg = 'Welcome back |PLAYERNAME|. What brings you here this time? Say {task}.'
    end
    npcHandler:setMessage(MESSAGE_GREET, msg)
    Topic[cid] = 0
    return true
end
 
function creatureSayCallback(cid, _type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end
 
    if msgcontains(msg, 'task') then
        local cur = getPlayerStorageValue(cid, curTask)
        if cur < 1 or (cur ~= 14023 and getPlayerStorageValue(cid, cur) == tasks[data[cur][1]].amount + 1 and getPlayerStorageValue(cid, cur + 100) == -1) then
            local v, lvl = '', getPlayerLevel(cid)
            if lvl < 50 then
                v, Topic[cid] = '{Elfs}, {Orcs}, {Rotworms}, {Cyclops}, {Crocodiles}, {Tarantulas}, {Carniphilas}, {Stone golems} or {Mammoths}', 1
            elseif lvl < 90 then
                v, Topic[cid] = '{Ice golems}, {Quaras}, {Elementals}, {Elephant}, {Killer Caiman}, {Mutated Rats} or {Giant Spiders}', 2
            elseif 90 <= lvl then
                v, Topic[cid] = '{Minotaurs}, {Necromancers}, {Pirates}, {Hydras}, {Sea serpents}, {Behemoths}' .. (getPlayerStorageValue(cid, rank) == 5 and ', {Serpent Spawns} or {Demons}' or ' or {Serpent Spawns}'), 3
            end
            selfSay('All right, what would you like to hunt? ' .. v .. '?', cid)
        elseif cur == 14023 and getPlayerStorageValue(cid, cur) == tasks['demon'].amount then
            selfSay({'Such derring do deserves a special reward! Take this holy icon. It neutralizes great evil and gives you access to areas which are protected by those forces. But remember ...', 'This is a one time opportunity! You won\'t get the holy icon twice.'}, cid)
            doPlayerAddItem(cid, 12710, 1)
			setPlayerStorageValue(cid, 45502, 1) -- Para liberar demon oak
            setPlayerStorageValue(cid, curTask, -1)
        elseif cur ~= 14023 and getPlayerStorageValue(cid, cur) == tasks[data[cur][1]].amount and getPlayerStorageValue(cid, cur + 100) < 1 then
            local tmp
            if type(data[cur][4]) == 'table' then
                tmp = {}
                for i = 1, #data[cur][4] do
                    tmp[i] = string.format(data[cur][4][i], getCreatureName(cid))
                end
            end
            selfSay(tmp or string.format(data[cur][4], getCreatureName(cid)), cid)
            if data[cur][5] > 0 then
                doPlayerAddExp(cid, data[cur][5])
                doSendAnimatedText(getThingPos(cid), data[cur][5], 215)
            end
            if data[cur][6] then
                setPlayerStorageValue(cid, points, getPlayerStorageValue(cid, points) + 1)
            end
            if data[cur][7] then -- special task (he sends you to kill the boss)
                setPlayerStorageValue(cid, cur + 100, 1)
            end
            setPlayerStorageValue(cid, cur, getPlayerStorageValue(cid, cur) + 1)
            Topic[cid] = 0
        elseif getPlayerStorageValue(cid, cur + 100) == 2 then
            setPlayerStorageValue(cid, points, getPlayerStorageValue(cid, points) + (isInArray({14001, 14002, 14021, 14022}, cur) and 2 or 1))
            selfSay('Fantastic! If you\'re up for another hunting mission just ask me for a {task}.', cid)
            setPlayerStorageValue(cid, cur + 100, -1)
        else
            selfSay(getPlayerStorageValue(cid, cur + 100) < 1 and 'You are not done with your task yet. Come back to me when you are. Or do you want to abort your task to start a different one?' or string.format('Find %s\'s hideout. I hope for you that you are skilled enough to kill him. Or do you want to abort your task to start a different one?', data[cur][7]), cid)
            Topic[cid] = 4
        end
    elseif msgcontains(msg, 'trade') and getPlayerStorageValue(cid, rank) >= 1 then
        local huntsMan_rank = {
			{name='obsidian knife', id=5908, buy=10000},
            {name='antlers', id=11214, sell=55},
            {name='bloody pincers', id=10550, sell=110},
            {name='crab pincers', id=11189, sell=40},
            {name='cyclops toe', id=10574, sell=60},
            {name='frosty ear of a troll', id=10565, sell=35},
            {name='hydra head', id=11199, sell=650},
            {name='lancer beetle shell', id=11372, sell=95},
            {name='mutated bat ear', id=10579, sell=450},
            {name='sabretooth', id=11228, sell=450},
            {name='sandcrawler shell', id=11373, sell=30},
            {name='scarab pincers', id=10548, sell=310},
            {name='terramite legs', id=11371, sell=85},
            {name='terramite shell', id=11369, sell=190},
            {name='terrorbird beak', id=11190, sell=115},
            {name='cyclops trophy', id=7398, sell=500},
            {name='minotaur trophy', id=7401, sell=500},
        }
        if getPlayerStorageValue(cid, rank) >= 3 then
			table.insert(huntsMan_rank, {name='blessed wooden stake', id=5942, buy=25000})
			table.insert(huntsMan_rank, {name='bat decoration', id=6492, buy=5000})
			table.insert(huntsMan_rank, {name='badger fur', id=7965, buy=2000})
            table.insert(huntsMan_rank, {name='deer trophy', id=7397, sell=3000})
            table.insert(huntsMan_rank, {name='lion trophy', id=7400, sell=3000})
            table.insert(huntsMan_rank, {name='wolf trophy', id=7394, sell=3000})
        end
        if getPlayerStorageValue(cid, rank) >= 4 then
			table.insert(huntsMan_rank, {name='pirate tapestry', id=5616, buy=20000})
			table.insert(huntsMan_rank, {name='demon backpack', id=10518, buy=5000})
			table.insert(huntsMan_rank, {name='blood skull', id=9448, buy=5000})
            table.insert(huntsMan_rank, {name='behemoth trophy', id=7396, sell=20000})
            table.insert(huntsMan_rank, {name='demon trophy', id=7393, sell=40000})
            table.insert(huntsMan_rank, {name='dragon lord trophy', id=7399, sell=10000})
        end
        
		local items = {}
		for _, item in ipairs(huntsMan_rank) do
			items[item.id] = {storage = item.storage, item_id = item.id, buyPrice = item.buy, sellPrice = item.sell, subType = 0, realName = item.name}
		end
 
		local onBuy = function(cid, item, subType, amount, ignoreCap, inBackpacks)
			if getPlayerStorageValue(cid, 45815) >= os.time() then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant sell it so fast.")
				return false
			end
			
			if items[item].buyPrice ~= 0 then
				if doPlayerRemoveMoney(cid, amount * items[item].buyPrice) then
					for i = 1, amount do
						doPlayerAddItem(cid, items[item].item_id, amount)
					end
					
					selfSay("You bought "..amount.." "..items[item].realName.." for "..items[item].buyPrice * amount.." gold coins.", cid)
					setPlayerStorageValue(cid, 45815, os.time() + 0.1)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					setPlayerStorageValue(cid, 45815, os.time() + 0.1)
				end
			end
		end
		
		local onSell = function(cid, item, subType, amount, ignoreCap, inBackpacks)
			if getPlayerStorageValue(cid, 45815) >= os.time() then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cant sell it so fast.")
				return false
			end
		
			if items[item].sellPrice ~= 0 then
				if doPlayerRemoveItem(cid, items[item].item_id, amount) then
					doPlayerAddMoney(cid, items[item].sellPrice * amount)
					selfSay("You sell "..amount.." "..items[item].realName.." for "..items[item].sellPrice * amount.." gold coins.", cid)
					setPlayerStorageValue(cid, 45815, os.time() + 0.1)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					setPlayerStorageValue(cid, 45815, os.time() + 0.1)
				end
			end
		end
 
		openShopWindow(cid, huntsMan_rank, onBuy, onSell)
        selfSay("Alright, show me what you've got.", cid)
    elseif Topic[cid] == 4 then
        local cur = getPlayerStorageValue(cid, curTask)
        if msgcontains(msg, 'yes') or msgcontains(msg, 'abort') then
            selfSay('Alright, as you wish. Ask me for a task if you are interested in a different hunting mission.', cid)
            setPlayerStorageValue(cid, cur, -1)
            setPlayerStorageValue(cid, curTask, -1)
            if getPlayerStorageValue(cid, cur + 100) > 0 then
                setPlayerStorageValue(cid, cur + 100, -1)
            end
        else
            selfSay(cur == 14023 and string.format('Alright, then stop dilly dallying here and go on with your task. You have already exterminated %u demons. Come back to me when you are done.', getPlayerStorageValue(cid, cur)) or getPlayerStorageValue(cid, cur + 100) < 1 and string.format(data[getPlayerStorageValue(cid, curTask)][3], getPlayerStorageValue(cid, cur)) or 'Alright, then you should go on with your task.', cid)
        end
        Topic[cid] = 0
    elseif Topic[cid] == 1 and msgcontains(msg, 'elf') then
        local v = tasks['elf']
        selfSay('They are a nuisance! Hunt ' .. v.amount .. ' elfs and you\'ll get a nice reward. Interested?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 1 and msgcontains(msg, 'orc') then
        local v = tasks['orc']
        selfSay('They are a nuisance! Hunt ' .. v.amount .. ' orcs and you\'ll get a nice reward. Interested?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 1 and msgcontains(msg, 'rotworm') then
        local v = tasks['rotworm']
        selfSay('They are a nuisance! Hunt ' .. v.amount .. ' rotworms and you\'ll get a nice reward. Interested?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 1 and msgcontains(msg, 'cyclops') then
        local v = tasks['cyclops']
        selfSay('They are a nuisance! Hunt ' .. v.amount .. ' cyclops and you\'ll get a nice reward. Interested?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 1 and msgcontains(msg, 'crocodile') then
        local v = tasks['crocodile']
        selfSay('They are a nuisance! You\'ll find them here in the jungle near the river. Hunt ' .. v.amount .. ' crocodiles and you\'ll get a nice reward. Interested?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 1 and msgcontains(msg, 'tarantula') then
        local v = tasks['tarantula']
        selfSay('There is a veritable plague of tarantulas living in the caves north of the river to the east. Can you squish ' .. v.amount .. ' tarantulas for the Hunting Elite. What do you say?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 1 and msgcontains(msg, 'carniphila') then
        local v = tasks['carniphila']
        selfSay('Damn walking weed-thingies! You\'ll find them deeper in the jungle. Weed out ' .. v.amount .. ' carniphilas for our society. Alright?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 1 and msgcontains(msg, 'golem') then
        local v = tasks['stone golem']
        selfSay('They can be found all over Tibia. You\'ll find them in mountain caves or rocky dungeons. Hunt ' .. v.amount .. ' of them and come back to me. Understood?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 1 and msgcontains(msg, 'mammoth') then
        local v = tasks['mammoth']
        selfSay('This particular species are found in Svargrond. Impressive beasts, but you wouldn\'t want one in your back garden. Hunt ' .. v.amount .. ' of them. Alright?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'golem') then
        local v = tasks['ice golem']
        selfSay('The ice golems on the glacier of Hrodmir are becoming a threat to the civilians in Svargrond. Travel to the Ice Islands and hunt ' .. v.amount .. ' Ice Golems. Do you accept this task?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'quara') then
        selfSay('There are different types of quaras. The weaker {scouts} which can be found on Malada, one of the shattered Islands and the more skilled {underwater} kind which can be found in Calassa and some smaller colonies. Which one do you wish to hunt?', cid)
        Topic[cid] = 5
    elseif Topic[cid] == 5 and msgcontains(msg, 'scout') then
        local v = tasks['quara constrictor scout']
        selfSay('Good choice! Hunt down those Quara scouts - remember no less than ' .. v.amount .. '! Focus! Do you accept this task?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 5 and msgcontains(msg, 'underwater') then
        local v = tasks['quara constrictor']
        selfSay('As you wish. Seek out a Quara settlement and hunt ' .. v.amount .. ' Quaras, it doesn\'t matter which type you hunt. Alright?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'elemental') then
        selfSay({'Since the creation of the elemental shrines and the portals, the curtain separating the worlds is thin, allowing the elementals to surge into our world. They have to be contained. ...', 'The choice as to which kind of elementals you hunt is yours, as long as they are in the lands of Tibia. Hunt 70 {earth} or {water} elementals. Which one do you choose?'} , cid)
        Topic[cid] = 6
    elseif Topic[cid] == 6 and msgcontains(msg, 'water') then
        local v = tasks['water elemental']
        selfSay('Alright, go hunt ' .. v.amount .. ' water elementals or massive water elementals. Don\'t forget your umbrella! Alright?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 6 and msgcontains(msg, 'earth') then
        local v = tasks['earth elemental']
        selfSay('Good choice! I need you to slay ' .. v.amount .. ' earth elementals or massive earth elementals. There are some in the so called Taboo-area in the eastern jungle of Tiquanda and I heard about a cave in Edron where you\'ll find them. Are you game?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'elephant') then
        local v = tasks['elephant']
        selfSay('A brave hunter! Kill ' .. v.amount .. ' elephants. You\'ll find them in the mountains between Darama and Tiquanda. Are you sure you want to do this?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'killer caiman') then
        local v = tasks['killer caiman']
        selfSay('Don\'t get burnt! Your challenge, should you choose to accept it, is to kill ' .. v.amount .. ' killer caimans. Are you ready?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'mutated rat') then
        local v = tasks['mutated rat']
        selfSay('Recently, I heard of a disturbing development in Yalahar - a plague of monstrous Mutated rats! If they were to spread to the rest of Tibia.. <shudders> My task for you is to contain their numbers in Yalahar. Hunt ' .. v.amount .. ' of them. What do you say?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 2 and msgcontains(msg, 'giant spider') then
        local v = tasks['giant spider']
        selfSay('Never liked spiders. Entirely too many legs. And I always find them in my bath! Those nasty creepy crawlies are a threat to the hygiene of every living being in Tibia. Hunt ' .. v.amount .. ' of them. Okay?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 3 and msgcontains(msg, 'pirate') then
        local v = tasks['pirate ghost']
        selfSay('The pirates are located in the isle of jungle and there are several mountain caves that are inhabited by them. Your task is to hunt a mere ' .. v.amount .. ' pirates. Are you willing to do that?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 3 and msgcontains(msg, 'minotaur') then
        local v = tasks['minotaur']
        selfSay('The minotaurs are located in teleport. Your task is to hunt a mere ' .. v.amount .. ' minotaurs. Are you willing to do that?', cid)
        Topic[cid] = v.storage
	elseif Topic[cid] == 3 and msgcontains(msg, 'necromancer') then
        local v = tasks['necromancer']
        selfSay('The hydras are located in the teleport. Your task is to hunt a mere ' .. v.amount .. ' necromancers and priestess. Are you willing to do that?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 3 and msgcontains(msg, 'hydra') then
        local v = tasks['hydra']
        selfSay('The hydras are located in the eastern jungle of Tiquanda and there are several mountain caves that are inhabited by them. Your task is to hunt a mere ' .. v.amount .. ' hydras. Are you willing to do that?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 3 and msgcontains(msg, 'sea serpent') then
        local v = tasks['sea serpent']
        selfSay({'The sea serpents are a threat to honest seafarers! Captain Haba knows where to find them. ...', 'Go to Svargrond and talk to him. ' .. v.amount .. ' sea serpents should be enough to reduce the threat - but not their young though! After all, they are an endangered species! Got it?'}, cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 3 and msgcontains(msg, 'behemoth') then
        local v = tasks['behemoth']
        selfSay('Behemoths must be kept away from the settlements at all costs. You\'ll find them east of here in the taboo-area or under the cyclopolis in Edron. Go there and hunt a few of them - shall we say... ' .. v.amount .. '? Are you up for that?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 3 and msgcontains(msg, 'serpent spawn') then
        local v = tasks['serpent spawn']
        selfSay('Very dangerous, nasty, slimey creatures. They live deep in the old ruins of Banuta. I think a mere ' .. v.amount .. ' serpent spawns should do the trick. What do you say?', cid)
        Topic[cid] = v.storage
    elseif Topic[cid] == 3 and getPlayerStorageValue(cid, rank) == 5 and msgcontains(msg, 'demon') then
        local v = tasks['demon']
        selfSay('The spawn of pure evil must be erased from Tibia. You\'ll find demons lurking in the northern ruins of Edron as well as in some of other deeper dungeons of Tibia. We need to wipe them out! Slay ' .. v.amount .. ' demons for the Greater Good!', cid)
        setPlayerStorageValue(cid, curTask, v.storage)
        setPlayerStorageValue(cid, v.storage, 0)
        Topic[cid] = 0
    elseif Topic[cid] >= 14000 and msgcontains(msg, 'yes') then
        selfSay(data[Topic[cid]][2], cid)
        setPlayerStorageValue(cid, curTask, Topic[cid])
        setPlayerStorageValue(cid, Topic[cid], 0)
        if getPlayerStorageValue(cid, questLog) < 1 then
            setPlayerStorageValue(cid, questLog, 1)
            setPlayerStorageValue(cid, points, 0)
        end
        Topic[cid] = 0
    elseif msgcontains(msg, 'special') and getPlayerStorageValue(cid, rank) == 4 then
        local v, k = getPlayerStorageValue(cid, tiquanda), getPlayerStorageValue(cid, demodras)
        if v < 1 then
            if getPlayerLevel(cid) >= 90 then
                setPlayerStorageValue(cid, tiquanda, 1)
                selfSay({'Have you heard about {Tiquandas Revenge}? It is said that the jungle itself is alive and takes revenge for all the bad things people have done to it. ...', 'I myself believe that there is some truth in this clap trap. Something \'real\' which therefore must have a hideout somewhere. Go find it and take revenge yourself! Ask me about the {special} task when you\'re done.'}, cid)
            else
                selfSay('Your eagerness is commendable, and your rank within our hunting elite is great buuuut I\'m afraid you\'re a little bit too weak for the special tasks. Get more experience and the special tasks will be no match for you.', cid)
            end
        elseif v == 2 then
            selfSay('Great achievement, old chap! You are an outstanding hunter, no doubt about it!', cid)
            setPlayerStorageValue(cid, tiquanda, 3)
        elseif v == 3 and k < 1 then
            if getPlayerLevel(cid) >= 100 then
                setPlayerStorageValue(cid, demodras, 1)
                selfSay('This task is a very dangerous one. I want you to look for {Demodras}\' hideout. It might be somewhere under the {Plains of Havoc}. Good luck, old chap, come back in one piece and ask me about the {special} task when you\'re done.', cid)
            else
                selfSay('Your eagerness is commendable, and your rank within our hunting elite is great buuuut I\'m afraid you\'re a little bit too weak for the special tasks. Get more experience and the special tasks will be no match for you.', cid)
            end
        elseif k == 2 then
            selfSay('Great achievement, old chap! You are an outstanding hunter, no doubt about it!', cid)
            setPlayerStorageValue(cid, demodras, 3)
        end
    elseif msgcontains(msg, 'promotion') then
        local cur, r, msg, exp, money = getPlayerStorageValue(cid, points), getPlayerStorageValue(cid, rank)
        if cur >= 5 and r < 1 then
            msg, exp, money = {'You have completed 5 tasks! Let me promote you to the first rank: Huntsman. Congratulations! ...', 'If you find any trophies that you don\'t need, feel free to ask me for a trade.'}, 50000, 20000
        elseif cur >= 10 and r < 2 then
            msg, exp, money = {'You have completed 10 hunting tasks. It\'s time for a promotion. You advance to the rank of \'Ranger\'. Congratulations! ...', 'Oh, I made a deal with Lorek. He ships Rangers from our society - and higher ranks of course - to Banuta, Chor or near the mountain pass to Darama. Just ask him for a passage.'}, 100000, 50000
        elseif cur >= 20 and r < 3 then
            msg, exp, money = {'Good show! You have completed 20 hunting tasks for the \'Paw and Fur - Hunting Elite. You have earned the right to join the ranks of those known as \'Big game hunter\'. Congratulations! ...', 'From now on I\'ll buy more trophies from you!'}, 200000, 150000
        elseif cur >= 30 and r < 4 then
            msg, exp, money = 'Spiffing! You have done 30 hunting tasks! From now on you can call yourself a \'Trophy hunter\'. As a reward I have this special backpack for you and in addition you can sell some more rare trophies to me.', 400000, 300000
        elseif cur >= 50 and r < 5 then
            msg, exp, money = 'Congratulations! You have made the highest rank: \'Elite hunter\'. If haven\'t yet done so ask me for the {special} task.', 750000, 500000
        else
			selfSay('You dont have completed any task.', cid)
		end
		
        if msg then
            selfSay(msg, cid)
            setPlayerStorageValue(cid, rank, math.max(1, r + 1))
            if exp then
                doPlayerAddExp(cid, exp)
                doSendAnimatedText(getThingPos(cid), exp, 215)
            end
			
            if money then
                doPlayerDepositMoney(cid, money)
            end
        end
    end
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, 'Happy hunting, old chap!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Happy hunting, old chap!')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())