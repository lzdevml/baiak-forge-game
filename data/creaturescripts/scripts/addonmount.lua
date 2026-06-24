function onLogin(cid)

								
local player = Player(cid)
local addons ={	
	  --[storage] = {outfit_male, outfit_female},
	[28416] = {801, 794}, -- Citizen
	[28417] = {807, 800}  -- warrior
	
	}
	
		for storage, addon in pairs(addons) do
			if player:getStorageValue(storage) > 0 then
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:addOutfitAddon(addon[1], 3)
				player:addOutfitAddon(addon[2], 3)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Seu Addon full foi adicionado!")
				player:setStorageValue(storage, 0)
			end
		end
		
												
local mounts ={	
		--[storage] = mounts,
	[2644] = 1, -- Widow Queen
	[2645] = 2 -- Cinderhoof
	
	}
		
		for storage, mount in pairs(mounts) do
			if player:getStorageValue(storage) > 0 then
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				player:addMount(mount)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Sua Mount foi adicionada!")
				player:setStorageValue(storage, 0)
			end
		end	
	return true
end