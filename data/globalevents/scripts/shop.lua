				local SHOP_MSG_TYPE = MESSAGE_STATUS_CONSOLE_RED
local SQL_interval = 60

local femaleOutfits = { 
	["citizen"]={136}, 
	["spirit caller"]={698}, 
	["sun priest"]={1024}, 
	["rascoohan"]={1372}, 
	["death herald"]={666}, 
	["sinister archer"]={1103}, 
	["herbalist"]={1020}, 
	["pharaoh"]={956}, 
	["champion"]={632}, 
	["sea dog"]={749}, 
	["owl keeper"]={1174}, 
	["siege master"]={1050}, 
	["hunter"]={137}, 
	["knight"]={139}, 
	["mage"]={138}, 
	["noblewoman"]={140}, 
	["summoner"]={141}, 
	["warrior"]={142}, 
	["barbarian"]={147}, 
	["druid"]={148}, 
	["wizard"]={149}, 
	["oriental"]={150}, 
	["pirate"]={155}, 
	["assassin"]={156}, 
	["beggar"]={157}, 
	["shaman"]={158}, 
	["norsewoman"]={252}, 
	["seaweaver"]={732}, 
	["jester"]={270}, 
	["ceremonial garb"]={694}, 
	["ranger"]={683}, 
	["philosopher"]={874}, 
	["entrepreneur"]={471}, 
	["evoker"]={724}, 
	["lupine warden"]={900}, 
	["royal pumpkin"]={759}, 
	["mercenary"]={1057}, 
	["trophy hunter"]={958}, 
	["grove keeper"]={909}, 
	["beastmaster"]={636}, 
	["royal costume"]={1456}, 
	["guidon bearer"]={1187}, 
	["dragon knight"]={1445}, 
	["pumpkin mummy"]={1128}, 
	["revenant"]={1323}, 
	["conjurer"]={635}, 
		["puppeteer"]={696}, 
			["frost tracer"]={1613}, 
					["winter warden"]={852}, 
	["arena champion"]={885}, 
	["chaos acolyte"]={664}, 
	["decaying defender"]={1663}, 
	["armoured archer"]={1619}, 
	["darklight evoker"]={1676}, 
	["flamefury mage"]={1681}, 
		["retro warrior"]={963}, 
	["warmaster"]={336}
	
}
local maleOutfits = { 
	["citizen"]={128}, 
		["retro warrior"]={962}, 
	["flamefury mage"]={1680}, 
	["darklight evoker"]={1675}, 
	["ranger"]={684}, 
	["armoured archer"]={1618}, 
	["decaying defender"]={1662}, 
	["chaos acolyte"]={665}, 
	["revenant"]={1322},
	["winter warden"]={853}, 
	["frost tracer"]={1612}, 
	["conjurer"]={634}, 
	["puppeteer"]={697}, 
	["pumpkin mummy"]={1127}, 
	["dragon knight"]={1444}, 
	["royal costume"]={1457}, 
	["arena champion"]={884}, 
	["beastmaster"]={637}, 
	["guidon bearer"]={1186}, 
	["trophy hunter"]={957}, 
	["grove keeper"]={908}, 
	["mercenary"]={1056}, 
	["royal pumpkin"]={760}, 
	["evoker"]={725}, 
	["lupine warden"]={899}, 
	["philosopher"]={873}, 
	["entrepreneur"]={472}, 
	["ceremonial garb"]={695}, 
	["sinister archer"]={1102}, 
	["rascoohan"]={1371}, 
	["pharaoh"]={955}, 
	["sun priest"]={1023}, 
	["herbalist"]={1021}, 
	["death herald"]={667}, 
	["spirit caller"]={699}, 
	["siege master"]={1051}, 
	["owl keeper"]={1173}, 
	["sea dog"]={751}, 
	["champion"]={633}, 
	["seaweaver"]={733}, 
	["hunter"]={129}, 
	["knight"]={131}, 
	["mage"]={130}, 
	["nobleman"]={132},
	["summoner"]={133}, 
	["warrior"]={134}, 
	["barbarian"]={143}, 
	["druid"]={144}, 
	["wizard"]={145}, 
	["oriental"]={146}, 
	["pirate"]={151}, 
	["assassin"]={152}, 
	["beggar"]={153}, 
	["shaman"]={154}, 
	["norseman"]={251}, 
	["jester"]={273}, 
	["warmaster"]={335}
	
}

local mounts = {
	["ripptor"] = {id = 225},
	["phant"] = {id = 212},
	["foxmouse"] = {id = 211},
	["gloothomotive"] = {id = 213},
	["phantasmal jade"] = {id = 169},
	["fleeting knowledge"] = {id = 126},
	["singeing steed"] = {id = 181},
	["sparkion"] = {id = 94},
	["rift runner"] = {id = 87},
	["stone rhino"] = {id = 106},
	["tiger slug"] = {id = 14},
	["vortexion"] = {id = 99},
	["arctic unicorn"] = {id = 114},
	["armoured war horse"] = {id = 23},
	["batcat"] = {id = 77},
	["black stag"] = {id = 73},
	["bloodcurl"] = {id = 92},
	["Bogwurm"] = {id = 186},
	["boreal owl"] = {id = 129},
	["bunny dray"] = {id = 139},
	["caped snowman"] = {id = 137},
	["jungle saurian"] = {id = 110},
	["jousting horse"] = {id = 199},
	["jade shrine"] = {id = 216},
	["jade pincer"] = {id = 49},
	["jade lion"] = {id = 48},
	["jackalope "] = {id = 103},
	["ivory fang"] = {id = 100},
	["ink spotted koi"] = {id = 204},
	["hyacinth"] = {id = 182},
	["holiday mammoth"] = {id = 176},
	["highland yak"] = {id = 63},
	["hailstorm fury"] = {id = 55},
	["gorongra"] = {id = 81},
	["golden dragonfly"] = {id = 59},
	["gold sphinx"] = {id = 107},
	["gloomwurm"] = {id = 187},
	["gloom widow"] = {id = 118},
	["glacier vagabond"] = {id = 64},
	["frostflare"] = {id = 89},
	["flying divan"] = {id = 65},
	["floating scholar"] = {id = 159},
	["floating sage"] = {id = 158},
	["floating kashmir"] = {id = 67},
	["floating augur"] = {id = 160},
	["flitterkatzen"] = {id = 75},
	["flamesteed"] = {id = 47},
	["brass speckled koi"] = {id = 203},
	["festive snowman"] = {id = 135},
	["festive mammoth"] = {id = 177},
	["feral tiger"] = {id = 124},
	["ether badger"] = {id = 153},
	["emperor deer"] = {id = 74},
	["emerald waccoon"] = {id = 70},
	["emerald sphinx"] = {id = 108},
	["emerald raven"] = {id = 219},
	["ember saurian"] = {id = 11},
	["ebony tiger"] = {id = 123},
	["dusk pryer"] = {id = 164},
	["dreadhare"] = {id = 104},
	["doombringer "] = {id = 53},
	["desert king"] = {id = 41},
	["death crawler"] = {id = 46},
	["dawn strayer"] = {id = 165},
	["dandelion"] = {id = 184},
	["cranium spider"] = {id = 116},
	["coralripper"] = {id = 79},
	["cony cart"] = {id = 140},
	["cinnamon ibex"] = {id = 194},
	["cinderhoof"] = {id = 90},
	["cave tarantula"] = {id = 117},
	["corpsefire skull"] = {id = 189},
	["magma skull"] = {id = 190},
	["doom skull"] = {id = 191},
    ["blue skull"] = {id = 220},
	["black skull"] = {id = 221},
	["spirit of purity"] = {id = 192},
	["darkfire devourer"] = {id = 193},
	
	["icebreacher"] = {id = 205},
	["winterstride"] = {id = 206},
	["frostbringer"] = {id = 207},
	
	["giant beaver"] = {id = 197},
	["void watcher"] = {id = 178},
	["rune watcher"] = {id = 179},
	["rift watcher"] = {id = 180},
	
	["copper fly"] = {id = 61}	
}

local itemCharges = {
	[13452] = 1000, -- Exercise Bow
	[13451] = 1000, -- Exercise Axe
	[13453] = 1000, -- Exercise Club
	[13455] = 1000, -- Exercise Sword
	[13454] = 1000, -- Exercise Rod
	[13456] = 1000, -- Exercise Wand

}

function onThink(interval, lastExecution)
	local result_plr = db.getResult("SELECT * FROM z_ots_comunication")
	if(result_plr:getID() ~= -1) then
		while(true) do
		
			id = tonumber(result_plr:getDataInt("id"))
			local action = tostring(result_plr:getDataString("action"))
			local delete = tonumber(result_plr:getDataInt("delete_it"))
			local cid = getPlayerByName(tostring(result_plr:getDataString("name")))
			
			if isPlayer(cid) then
			
				local itemtogive_id = tonumber(result_plr:getDataInt("param1"))
				local itemtogive_count = tonumber(result_plr:getDataInt("param2"))
				local outfit_name = string.lower(tostring(result_plr:getDataString("param3")))
				local mount_name = string.lower(tostring(result_plr:getDataString("param3")))
				local itemvip = tonumber(result_plr:getDataInt("param4"))
				local add_item_type = tostring(result_plr:getDataString("param5"))
				local add_item_name = tostring(result_plr:getDataString("param6"))
				local points = tonumber(result_plr:getDataInt("param7"))
					local imbuiment_name = outfit_name
				local charges = tonumber(result_plr:getDataInt("charges"))
				local received_item = 0
				local full_weight = 0
				
				if(action == 'give_item') then
					full_weight = getItemWeightById(itemtogive_id, itemtogive_count)
					if isItemRune(itemtogive_id) == TRUE then
						full_weight = getItemWeightById(itemtogive_id, 1)
					else
						full_weight = getItemWeightById(itemtogive_id, itemtogive_count)
					end
					
					local free_cap = getPlayerFreeCap(cid)

					local new_item = doCreateItemEx(itemtogive_id, itemtogive_count)
					doItemSetAttribute(new_item, "description",  "Comprador: ".. getPlayerName(cid) .."")
					
					if full_weight <= free_cap then
						received_item = doPlayerAddItemEx(cid, new_item)
						if received_item == RETURNVALUE_NOERROR then
						
						if itemCharges[itemtogive_id] and charges ~= 0 then
								doItemSetAttribute(new_item, "charges", charges)
							end
						--doPlayerSave(cid)
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '[Shop Offer] Entrega do Item -> '.. add_item_name ..' <- Feita com Sucesso!\n o Seu Personagem Foi Salvo com sucesso o seu item está seguro contra rollbacks!')
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, '[Shop Offer]  Seu item recebeu um serial caso seja duplicado ele será deletado automaticamente!')
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
						    db.query("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
						else
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '[Shop Offer] Sua Backpack Nao Tem Espaco Para Receber o Item -> '.. add_item_name ..' <- Por Favor Abra Espaco em Sua Backpack, Estaremos Tentando Entregar o Item Em '.. SQL_interval ..' Segundos!.')
						end
					else
						doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, '[Shop Offer] -> '.. add_item_name ..' <- está esperando por voce. Precisa de '.. full_weight ..' de cap livre, voce tem apenas '.. free_cap ..' de cap livre. Coloque alguns itens no depósito e espere '.. SQL_interval ..' segundos!')
					end
				end
				
				
				
				if(action == 'give_outfit') then
					if outfit_name ~= "" and maleOutfits[outfit_name] and femaleOutfits[outfit_name] then
						local add_outfit = getPlayerSex(cid) == 0 and femaleOutfits[outfit_name][1] or maleOutfits[outfit_name][1]
						if not canPlayerWearOutfit(cid, add_outfit, 3) then
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							db.query("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
							doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
                			doPlayerAddOutfit(cid, add_outfit, 3)
							--doPlayerSave(cid)
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "[Shop Offer] Entrega do outfit -> " .. add_item_name .. " <- Feita com Sucesso, Utilize o comando !save para salvar seu novo outfit!")
						else
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "[Shop Offer] Voce ja tem essa outfit -> " .. add_item_name .. " <-, Seus pontos foram devolvidos, obrigado.")
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							db.query("UPDATE `z_shop_history_item` SET `trans_state`='haveoutfit', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
							-- db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + '".. points .."' WHERE `id` = '".. getPlayerAccountId(cid) .."'")
						end
					end
				end
				
				if(action == 'give_imbuiment') then
					if imbuiment_name ~= "" then
						local storageToAdd = 0
						if add_item_name == "5x Basic Imbuiment Voucher" then
							storageToAdd = 521077
							if getPlayerStorageValue(cid, storageToAdd) > 0 then
								storageToAdd = false
							end
						elseif add_item_name == "5x Intricate Imbuiment Voucher" then
							storageToAdd = 521078
							if getPlayerStorageValue(cid, storageToAdd) > 0 then
								storageToAdd = false
							end
						elseif add_item_name == "5x Powerful Imbuiment Voucher" then
							storageToAdd = 521079
							if getPlayerStorageValue(cid, storageToAdd) > 0 then
								storageToAdd = false
							end
						end

						if storageToAdd == false then
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "You still have imbuiment vouchers of that level, and you need to use them all to buy more. Your points were returned, thank you.")
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							db.query("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
						else
							setPlayerStorageValue(cid, storageToAdd, 5)
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "You received a " .. add_item_name .. " of our Shop Online.")
						end
					end
				end
				
						
				
				
						
				
				if(action == 'give_mount') then
					if outfit_name ~= "" and mounts[mount_name] then
						if not playerHasMount(cid, mounts[mount_name].id) then
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							db.query("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
							doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
                			doPlayerAddMount(cid, mounts[mount_name].id)
                            --doPlayerSave(cid)							
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "[Shop Offer] Entrega da mount -> " .. add_item_name .. " <- Feita com Sucesso, Utilize o comando !save para salvar sua nova mount!")
						else
						
							doPlayerSendTextMessage(cid, SHOP_MSG_TYPE, "[Shop Offer] Voce ja tem essa mount -> " .. add_item_name .. " <-, Seus pontos foram devolvidos, obrigado.")
							db.query("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
							db.query("UPDATE `z_shop_history_item` SET `trans_state`='havemount', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")
							-- db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + '".. points .."' WHERE `id` = '".. getPlayerAccountId(cid) .."'")
						end
					end
				end
				
			end
			if not(result_plr:next()) then
				break
			end
		end
		result_plr:free()
	end
	
	return true
end