local config = {
	message = "Congrulations. Teleport close in 1 minutes",
	timeToRemove = 60, -- seconds
	teleportId = 1387,
	bosses = {
		
		["Azerus"] = {x = 341, y = 540, z = 3}
	}
}

local function removal(position)
	doRemoveItem(getTileItemById(position, config.teleportId).uid)
	return true
end

function onDeath(cid, corpse, killer)
	local player = Player(cid)
	if(not player:isMonster()) then
		return true
	end
	
	local bossname = config.bosses[player:getName()]
	if type(bossname) == "table" then
		local position = player:getPosition()
		teleport = doCreateTeleport(config.teleportId, bossname, position)
		doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(removal, config.timeToRemove * 1000, position)
		doSendMagicEffect(position,10)
	end
	
	return true
end