-- Mount System 8.6 -- 1.0

local storage_NormalOutfits = 5454
local storage_GodOutfits = 77715 
local storage_OutfitAtual = 48987

local newtypeDefault = {
	["Citizen"] = {136, 128}, 
	["Hunter"] = {137,129}, 
	["Mage"] = {141,130}, 
	["Knight"] = {139, 131}, 
	["Nobleman"] = {140, 132},	
	["Summoner"] = {138, 133},	
	["Warrior"] = {142, 134}, 
	["Barbarian"] = {147, 143},
	["Druid"] = {148, 144}, 
	["Wizard"] = {149, 145}, 
	["Oriental"] = {150, 146},	
	["Pirate"] = {155, 151}, 
	["Assassin"] = {156, 152},	
	["Beggar"] = {157, 153},
	["Shaman"] = {158, 154}, 
	["Norseman"] = {252, 251},	
	["Nightmare"] = {269, 268},	
	["Jester"] = {270, 273}, 
	["Brotherhood"] = {279, 278}, 
	["Demonhunter"] = {288, 289}, 
	["Yalaharian"] = {324, 325},	
	["Warmaster"] = {336, 335},	
	["Wayfarer"] = {366, 367}}

montarias = {
	["Shadow Draptor"] = {outfitId_range = {100, 122}, storageOutfit = 98001, storageCanWear = 88001}, -- storageCanWear = Verifica master
	["War Bear"] = {outfitId_range = {200, 222}, storageOutfit = 98002, storageCanWear = 88005}, -- storageCanWear = Verifica master -/Free
	["Donkey"] = {outfitId_range = {300, 322}, storageOutfit = 98003, storageCanWear = 88003}, -- storageCanWear = Verifica master
	["Armoured War Horse"] = {outfitId_range = {400, 422}, storageOutfit = 98004, storageCanWear = 88005}, -- storageCanWear = Verifica master -/Free
	["Black Sheep"] = {outfitId_range = {500, 522}, storageOutfit = 98005, storageCanWear = 88005}, -- storageCanWear = Verifica master -/ Free
	["Antelope"] = {outfitId_range = {600, 622}, storageOutfit = 98006, storageCanWear = 88006}, -- storageCanWear = Verifica master 
	["Azudocus"] = {outfitId_range = {700, 722}, storageOutfit = 98007, storageCanWear = 88007}, -- storageCanWear = Verifica master 
	["Black Stag"] = {outfitId_range = {800, 822}, storageOutfit = 98008, storageCanWear = 88008}, -- storageCanWear = Verifica master 
	["Cave Tarantula"] = {outfitId_range = {900, 922}, storageOutfit = 98009, storageCanWear = 88009}, -- storageCanWear = Verifica master 
	["Cranium Spider"] = {outfitId_range = {1000, 1022}, storageOutfit = 98010, storageCanWear = 88010}, -- storageCanWear = Verifica master
}

local newtype_mounts = {
	["Citizen"] = {100, 200, 300, 400, 500, 600, 700, 800, 900, 1000},
	["Hunter"] = {101, 201, 301, 401, 501, 601, 701, 801, 901, 1001},
	["Mage"] = {102, 202, 302, 402, 502, 602, 702, 802, 902, 1002},
	["Knight"] = {103, 203, 303, 403, 503, 603, 703, 803, 903, 1003}, 
	["Nobleman"] = {104, 204, 304, 404, 504, 604, 704, 804, 904, 1004},
	["Summoner"] = {105, 205, 305, 405, 505, 605, 705, 805, 905, 1005},
	["Warrior"] = {106, 206, 306, 406, 506, 606, 706, 806, 906, 1006},
	["Barbarian"] = {107, 207, 307, 407, 507, 607, 707, 807, 907, 1007},
	["Druid"] = {108, 208, 308, 408, 508, 608, 708, 808, 908, 1008},
	["Wizard"] = {109, 209, 309, 409, 509, 609, 709, 809, 909, 1009},
	["Oriental"] = {110, 210, 310, 410, 510, 610, 710, 810, 910, 1010},
	["Pirate"] = {111, 211, 311, 411, 511, 611, 711, 811, 911, 1011},
	["Assassin"] = {112, 212, 312, 412, 512, 612, 712, 812, 912, 1012},
	["Beggar"] = {113, 213, 313, 413, 513, 613, 713, 813, 913, 1013},
	["Shaman"] = {114, 214, 314, 414, 514, 614, 714, 814, 914, 1014},
	["Norseman"] = {115, 215, 315, 415, 515, 615, 715, 815, 915, 1015},
	["Nightmare"] = {116, 216, 316, 416, 516, 616, 716, 816, 916, 1016},
	["Jester"] = {117, 217, 317, 417, 517, 617, 717, 817, 917, 1017},
	["Brotherhood"] = {118, 218, 318, 418, 518, 618, 718, 818, 918, 1018},
	["Demonhunter"] = {119, 219, 319, 419, 519, 619, 719, 819, 919, 1019},
	["Yalaharian"] = {120, 220, 320, 420, 520, 620, 720, 820, 920, 1020},
	["Warmaster"] = {121, 221, 321, 421, 521, 621, 721, 821, 921, 1021},
	["Wayfarer"] = {122, 222, 322, 422, 522, 622, 722, 822, 922, 1022}
}


function CheckNewtype(cid)
	atual_outfit = 0

	for i, j in pairs(newtypeDefault) do
		if (getCreatureOutfit(cid).lookType == newtypeDefault[i][1]) then
			atual_outfit = newtypeDefault[i][1]
			atual_outfit_name = i
			setPlayerStorageValue(cid, storage_OutfitAtual, atual_outfit_name .. "," .. atual_outfit)
			return true
		elseif (getCreatureOutfit(cid).lookType == newtypeDefault[i][2]) then
			atual_outfit = newtypeDefault[i][2]
			atual_outfit_name = i
			setPlayerStorageValue(cid, storage_OutfitAtual, atual_outfit_name .. "," .. atual_outfit)
			return true
		end
	end



	if getPlayerStorageValue(cid, storage_OutfitAtual) then
		--doBroadcastMessage(atual_outfit_name)
		atual_outfit_name = string.explode(getPlayerStorageValue(cid, storage_OutfitAtual),",")[1]
		atual_outfit =  string.explode(getPlayerStorageValue(cid, storage_OutfitAtual),",")[2]
		return true
	end
end

function addMounts(cid)
	CheckNewtype(cid)

	local addons = 0
	if canPlayerWearOutfit(cid, atual_outfit,3) then
		addons = 3
	elseif canPlayerWearOutfit(cid, atual_outfit,1) then
		addons = 1
	elseif canPlayerWearOutfit(cid, atual_outfit,2) then
		addons = 2
	end
	

	for i, v in pairs(newtype_mounts) do
		for j, k in pairs(newtype_mounts[i]) do
			--doBroadcastMessage(addons)
			doPlayerAddOutfitId(cid, newtype_mounts[i][j],addons)
			--doBroadcastMessage("Outfit Adicionado:" .. newtype_mounts[i][j] )
		end
	end
end

function sendMountWindow(cid)
	local countMontarias = 0
	local mounts_enabled = ''
	local mounts_disabled = ''
	
	CheckNewtype(cid)
	--doBroadcastMessage(atual_outfit_name)
	addMounts(cid)
	for i, j in pairs (newtype_mounts) do
		
		if atual_outfit_name == i then
			for k, l in pairs(newtype_mounts[i]) do
				--doBroadcastMessage(newtype_mounts[i][k]) -- <<< montarias do outfit atual

					for m, n in pairs(montarias) do
						if getPlayerStorageValue(cid, montarias[m].storageCanWear) > os.time() or getPlayerStorageValue(cid, montarias[m].storageCanWear) >= 1 then
							setPlayerStorageValue(cid, montarias[m].storageOutfit, 1)		

							count = montarias[m].outfitId_range[1]
							while count <= montarias[m].outfitId_range[2] do

								if newtype_mounts[i][k] == count then
									if mounts_enabled == '' then
										mounts_enabled = count
									else
										mounts_enabled = mounts_enabled .. "," .. count
									end								
								end
								count = count+1

							end
							countMontarias = countMontarias+1
						end
					end


			end
		else
			for k, l in pairs(newtype_mounts[i]) do
				--doBroadcastMessage("Outfit Removido: " .. newtype_mounts[i][k])
				doPlayerRemoveOutfitId(cid, newtype_mounts[i][k])
			end
			
		end
	end

	if countMontarias > 0 then
		setPlayerStorageValue(cid, storage_NormalOutfits, -1)
		doPlayerSendOutfitWindow(cid)
		addEvent(function()
			resetOutfits(cid)
		end, 15 * 1000)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não possui nenhuma montaria.")
	end
end

function resetOutfits(cid)
	setPlayerStorageValue(cid, 5454,1)
	for i, v in pairs(montarias) do
		setPlayerStorageValue(cid, montarias[i].storageOutfit, -1)
	end
end

function getMountList()
    str = ''
    for i, v in pairs(montarias) do
        if str == '' then
            str = '{'..i..'}'
        else
            str = str .. ', {' .. i..'}'
        end
    end
    return str
end
