local stor = 10005

function onAdvance(cid, skill, oldLevel, newLevel)

	if getPlayerLevel(cid) >= 13 and getPlayerStorageValue(cid, stor) <= 0 then
		if getPlayerVocation(cid) == 1 then -- sorc
			if getPlayerItemCount(cid, 2190) >= 1 then -- WAND OF VORTEX
				if doPlayerRemoveItem(cid, 2190, 1) then
					doPlayerAddItem(cid, 2191, 1) -- WAND OF DRAGONBREATH
					setPlayerStorageValue(cid, stor, 1)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Wand of Dragonbreath' pois não possui a 'Wand of Vortex'.")
				setPlayerStorageValue(cid, stor, 1)
			end
			
		elseif getPlayerVocation(cid) == 2 then -- druid
			if getPlayerItemCount(cid, 2182) >= 1 then -- SNAKEBITE ROD
				if doPlayerRemoveItem(cid, 2182, 1) then
					doPlayerAddItem(cid, 2186, 1) -- MOONLIGHT ROD
					setPlayerStorageValue(cid, stor, 1)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Moonlight Rod' pois não possui a 'Snakebite Rod'.")
				setPlayerStorageValue(cid, stor, 1)
			end
		
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 then -- paladin or knight
			setPlayerStorageValue(cid, stor, 1)
		end
	
	
	elseif getPlayerLevel(cid) >= 19 and getPlayerStorageValue(cid, stor) == 1 then
		if getPlayerVocation(cid) == 1 then -- sorc
			if getPlayerItemCount(cid, 2191) >= 1 then -- WAND OF DRAGONBREATH
				if doPlayerRemoveItem(cid, 2191, 1) then
					doPlayerAddItem(cid, 2188, 1) -- WAND OF DECAY
					setPlayerStorageValue(cid, stor, 2)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Wand of Decay' pois não possui a 'Wand of Dragonbreath'.")
				setPlayerStorageValue(cid, stor, 2)
			end
			
		elseif getPlayerVocation(cid) == 2 then -- druid
			if getPlayerItemCount(cid, 2186) >= 1 then -- MOONLIGHT ROD
				if doPlayerRemoveItem(cid, 2186, 1) then
					doPlayerAddItem(cid, 2185, 1) -- NECROTIC ROD
					setPlayerStorageValue(cid, stor, 2)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Necrotic Rod' pois não possui a 'Moonlight Rod'.")
				setPlayerStorageValue(cid, stor, 2)
			end
		
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 then -- paladin or knight
			setPlayerStorageValue(cid, stor, 2)
		end
		
	elseif getPlayerLevel(cid) >= 20 and getPlayerStorageValue(cid, stor) == 2 then		
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 3 then -- sorc, druid e paladin
			setPlayerStorageValue(cid, stor, 3)
		
		elseif getPlayerVocation(cid) == 4 then -- knight
			if getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid == 2439 or getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid == 2439 then -- DARAMIAN MACE
				if doPlayerRemoveItem(cid, 2439, 1) then
					doPlayerAddItem(cid, 2423, 1) -- CLERICAL MACE
					setPlayerStorageValue(cid, stor, 3)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			elseif getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid == 8602 or getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid == 8602 then -- JAGGED SWORD
				if doPlayerRemoveItem(cid, 8602, 1) then
					doPlayerAddItem(cid, 7385, 1) -- CRIMSON SWORD
					setPlayerStorageValue(cid, stor, 3)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			elseif getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid == 8601 or getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid == 8601 then -- STEEL AXE
				if doPlayerRemoveItem(cid, 8601, 1) then
					doPlayerAddItem(cid, 2429, 1) -- BARBARIAN AXE
					setPlayerStorageValue(cid, stor, 3)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber uma arma para seu level pois não possui sua antiga arma.")
				setPlayerStorageValue(cid, stor, 3)
			end
		end
		
	
	elseif getPlayerLevel(cid) >= 22 and getPlayerStorageValue(cid, stor) == 3 then
		if getPlayerVocation(cid) == 1 then -- sorc
			if getPlayerItemCount(cid, 2188) >= 1 then -- WAND OF DECAY
				if doPlayerRemoveItem(cid, 2188, 1) then
					doPlayerAddItem(cid, 8921, 1) -- WAND OF DRACONIA
					setPlayerStorageValue(cid, stor, 4)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Wand of Draconia' pois não possui a 'Wand of Decay'.")
				setPlayerStorageValue(cid, stor, 4)
			end
			
		elseif getPlayerVocation(cid) == 2 then -- druid
			if getPlayerItemCount(cid, 2185) >= 1 then -- NECROTIC ROD
				if doPlayerRemoveItem(cid, 2185, 1) then
					doPlayerAddItem(cid, 8911, 1) -- NORTHWIND ROD
					setPlayerStorageValue(cid, stor, 4)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Northwind Rod' pois não possui a 'Necrotic Rod'.")
				setPlayerStorageValue(cid, stor, 4)
			end
		
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 then -- paladin or knight
			setPlayerStorageValue(cid, stor, 4)
		end
		
		
	elseif getPlayerLevel(cid) >= 25 and getPlayerStorageValue(cid, stor) == 4 then 
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 4 then -- sorc, druid e knight
			setPlayerStorageValue(cid, stor, 5)
			
		elseif getPlayerVocation(cid) == 3 then -- paladin
			if getPlayerItemCount(cid, 2389) >= 1 then -- SPEAR
				if doPlayerRemoveItem(cid, 2389, 1) then
					doPlayerAddItem(cid, 7378, 1) -- ROYAL SPEAR
					setPlayerStorageValue(cid, stor, 5)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Royal Spear' pois não possui a 'Spear'.")
				setPlayerStorageValue(cid, stor, 5)
			end
		end
		
			elseif getPlayerLevel(cid) >= 30 and getPlayerStorageValue(cid, stor) == 4 then 
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 4 then -- sorc, druid e knight
			setPlayerStorageValue(cid, stor, 5)
			
		elseif getPlayerVocation(cid) == 3 then -- paladin
			if getPlayerItemCount(cid, 7378) >= 1 then -- SPEAR
				if doPlayerRemoveItem(cid, 7378, 1) then
					doPlayerAddItem(cid, 7368, 1) -- ROYAL SPEAR
					setPlayerStorageValue(cid, stor, 5)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Royal Spear' pois não possui a 'Spear'.")
				setPlayerStorageValue(cid, stor, 5)
			end
		end
			
		
	elseif getPlayerLevel(cid) >= 26 and getPlayerStorageValue(cid, stor) == 5 then
		if getPlayerVocation(cid) == 1 then -- sorc
			if getPlayerItemCount(cid, 8921) >= 1 then -- WAND OF DRACONIA
				if doPlayerRemoveItem(cid, 8921, 1) then
					doPlayerAddItem(cid, 2189, 1) -- WAND OF COSMIC ENERGY
					setPlayerStorageValue(cid, stor, 6)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Wand of Cosmic Energy' pois não possui a 'Wand of Draconia'.")
				setPlayerStorageValue(cid, stor, 6)
			end
			
		elseif getPlayerVocation(cid) == 2 then -- druid
			if getPlayerItemCount(cid, 8911) >= 1 then -- NORTHWIND ROD
				if doPlayerRemoveItem(cid, 8911, 1) then
					doPlayerAddItem(cid, 2181, 1) -- TERRA ROD
					setPlayerStorageValue(cid, stor, 6)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Terra Rod' pois não possui a 'Northwind Rod'.")
				setPlayerStorageValue(cid, stor, 6)
			end
		
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 then -- paladin or knight
			setPlayerStorageValue(cid, stor, 6)
		end
			
			
	elseif getPlayerLevel(cid) >= 30 and getPlayerStorageValue(cid, stor) == 6 then		
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 3 then -- sorc, druid e paladin
			setPlayerStorageValue(cid, stor, 7)
			doPlayerSetBalance(cid, getPlayerBalance(cid) + 10000)
		
		elseif getPlayerVocation(cid) == 4 then -- knight
			if getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid == 2423 or getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid == 2423 then -- DARAMIAN MACE
				if doPlayerRemoveItem(cid, 2423, 1) then
					doPlayerAddItem(cid, 7437, 1) -- SAPPHIRE HAMMER
					setPlayerStorageValue(cid, stor, 7)
					doPlayerSetBalance(cid, getPlayerBalance(cid) + 10000)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			elseif getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid == 7385 or getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid == 7385 then -- CRIMSON SWORD
				if doPlayerRemoveItem(cid, 7385, 1) then
					doPlayerAddItem(cid, 2407, 1) -- BRIGHT SWORD
					setPlayerStorageValue(cid, stor, 7)
					doPlayerSetBalance(cid, getPlayerBalance(cid) + 10000)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			elseif getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid == 2429 or getPlayerSlotItem(cid, CONST_SLOT_RIGHT).itemid == 2429 then -- BARBARIAN AXE
				if doPlayerRemoveItem(cid, 2429, 1) then
					doPlayerAddItem(cid, 3962, 1) -- BEASTSLAYER AXE
					setPlayerStorageValue(cid, stor, 7)
					doPlayerSetBalance(cid, getPlayerBalance(cid) + 10000)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber uma arma para seu level pois não possui sua antiga arma.")
				setPlayerStorageValue(cid, stor, 7)
				doPlayerSetBalance(cid, getPlayerBalance(cid) + 10000)
			end
		end
		
	
	elseif getPlayerLevel(cid) >= 33 and getPlayerStorageValue(cid, stor) == 7 then
		if getPlayerVocation(cid) == 1 then -- sorc
			if getPlayerItemCount(cid, 2189) >= 1 then -- WAND OF COSMIC ENERGY
				if doPlayerRemoveItem(cid, 2189, 1) then
					doPlayerAddItem(cid, 2187, 1) -- WAND OF INFERNO
					setPlayerStorageValue(cid, stor, 8)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Wand of Inferno' pois não possui a 'Wand of Cosmic Energy'.")
				setPlayerStorageValue(cid, stor, 8)
			end
			
		elseif getPlayerVocation(cid) == 2 then -- druid
			if getPlayerItemCount(cid, 2181) >= 1 then -- TERRA ROD
				if doPlayerRemoveItem(cid, 2181, 1) then
					doPlayerAddItem(cid, 2183, 1) -- HAILSTORM ROD
					setPlayerStorageValue(cid, stor, 8)
				else
					doPlayerSendTextMessage(cid,25,"ERROR! Please contact the administrator.")
					return true
				end
			else
				doPlayerSendTextMessage(cid,25,"Você não poderá receber a 'Hailstorm Rod' pois não possui a 'Terra Rod'.")
				setPlayerStorageValue(cid, stor, 8)
			end
		
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 4 then -- paladin or knight
			setPlayerStorageValue(cid, stor, 8)
		end
	end

	return true
end