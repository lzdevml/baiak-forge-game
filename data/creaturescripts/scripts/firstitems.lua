local commonItems = {
	-- ITEMS ALL VOCS RECEIVE
	{itemid=2160, count=3}, 
	{itemid=5710, count=1}, 
	{itemid=2120, count=1}, 
	{itemid=2420, count=1}, 
	{itemid=2789, count=20}, 
}

local firstItems = {
	{ -- SORC ITEMS
		{itemid=2131, count=1}, 
		{itemid=2175, count=1}, 
		{itemid=2124, count=1}, 
		{itemid=7620, count=35},
        {itemid=7618, count=15}, 		
		{itemid=2190, count=1}, 
		{itemid=8870, count=1}, 
		{itemid=2643, count=1}, 
		{itemid=8820, count=1}, 
		
	},
	{ -- DRUID ITEMS
		{itemid=2131, count=1}, 
		{itemid=2175, count=1}, 
		{itemid=2124, count=1}, 
		{itemid=7620, count=35},
        {itemid=7618, count=15}, 	
		{itemid=2182, count=1}, 
		{itemid=8870, count=1},
		{itemid=2643, count=1}, 
		{itemid=8820, count=1}, 
		
	},
	{ -- PALADIN ITEMS
		{itemid=2131, count=1}, 
		{itemid=2525, count=1}, 
		{itemid=2124, count=1}, 
		{itemid=2460, count=1},
		{itemid=7620, count=35},
        {itemid=7618, count=15}, 
		{itemid=2660, count=1}, 	
		{itemid=8923, count=1}, 
		{itemid=2643, count=1}, 
		{itemid=2389, count=1}, 
		
	},
	{ -- KNIGHT ITEMS
		{itemid=2131, count=1}, 
		{itemid=2515, count=1},
		{itemid=2124, count=1},
		{itemid=2497, count=1},
		{itemid=2489, count=1}, 
		{itemid=2647, count=1}, 
		{itemid=2423, count=1}, 
		{itemid=7385, count=1}, 
		{itemid=2428, count=1}, 
		{itemid=2643, count=1}, 
		{itemid=7620, count=35},
        {itemid=7618, count=15}, 
		
	}
}

for _, items in ipairs(firstItems) do
	for _, item in ipairs(commonItems) do
		table.insert(items, item)
	end
end



function onLogin(cid)
    if getPlayerGroupId(cid) < 2 then
        local hasReceivedFirstItems = getPlayerStorageValue(cid, 40046)

        if hasReceivedFirstItems == -1 then
            doPlayerAddItem(cid, 2002, 1)

            local giveItems = firstItems[getPlayerVocation(cid)] or firstItems[getPlayerVocation(cid) - 4]

            if giveItems ~= nil then
                for _, v in ipairs(giveItems) do
                    doPlayerAddItem(cid, v.itemid, v.count or 1)
                end

                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Bem-vindo ao Styller-OTS! Você acaba de receber seus primeiros equipamentos.")
                doPlayerSendTextMessage(cid,22,"Voce Ganhou Cave Explorer Outfit.") 
				if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 574, 3)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 575, 3)
			end
			
			 -- letter
            local c = {
                text = "- Bem Vindo ".. getPlayerName(cid) .."!\n\n> Todo o OTserv com muitas aventuras diferente dos iguais, vinhemos para revolucionar.\n\n-> Sorcerers, Druids, Knights e Paladins, recebem armas ao upar, até o level 30. Queremos melhorar ao máximo sua aventura.\n\n-> Para comprar bless ou aol, digite o comando: [!bless] ou [!aol].\n\n->Liberamos Quatro Montarias Free.\n\n->Nosso servidor é totalmente FREE. Basta se dedicar e jogar para conquistar tudo dentro do jogo.\n\nBoa sorte e um otimo jogo!",
                writer = "Styller-OTserv",
                date = os.time()
            }
			--/letter
            local item = doCreateItemEx(2598, 1)
            doSetItemText(item, c.text, c.writer, c.date)
            doPlayerAddItemEx(cid, item, true)
            --/fim letter

              -- Adicione uma montaria com base no sexo do jogador
                if getPlayerSex(cid) == 1 then
                    doPlayerAddMount(cid, 1) -- Widow Queen
                elseif getPlayerSex(cid) == 0 then
                    doPlayerAddMount(cid, 1) -- Widow Queen
                end
				  -- Adicione uma montaria com base no sexo do jogador
                if getPlayerSex(cid) == 1 then
                    doPlayerAddMount(cid, 2) -- Racing Bird
                elseif getPlayerSex(cid) == 0 then
                    doPlayerAddMount(cid, 2) -- Racing Bird
                end
				 -- Adicione uma montaria com base no sexo do jogador
                if getPlayerSex(cid) == 1 then
                    doPlayerAddMount(cid, 3) -- War Bear
                elseif getPlayerSex(cid) == 0 then
                    doPlayerAddMount(cid, 3) -- War Bear
                end
				 -- Adicione uma montaria com base no sexo do jogador
                if getPlayerSex(cid) == 1 then
                    doPlayerAddMount(cid, 4) -- Black Sheep
                elseif getPlayerSex(cid) == 0 then
                    doPlayerAddMount(cid, 4) -- Black Sheep
                end
				-- Adicione uma montaria com base no sexo do jogador
                if getPlayerSex(cid) == 1 then
                    doPlayerAddMount(cid, 226) -- NEW STYLLER
                elseif getPlayerSex(cid) == 0 then
                    doPlayerAddMount(cid, 226) -- NEW STYLLER
                end

                setPlayerStorageValue(cid, 40046, 1)
                setPlayerStorageValue(cid, 1010118887, 7)
                setPlayerStorageValue(cid, STORAGEVALUE_WARSQUARE_STATUS, 1)
            end
        end
    end
    return true
end
            				

