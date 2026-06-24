bountyPoints = 35006
bountyConfig = {
	min = 10000000, -- Mínimo aceito para adicionar uma recompensa
	fee = 10, -- Taxa para adicionar uma recompensa por algum jogador (em porcentagem %)
	points = true, -- [número de pontos que o jogador receberá por caçar um procurado]
}

function isHunted(cid)
	if isPlayer(cid) then
		local id = getPlayerGUID(cid)
		local bounty = db.getResult("SELECT `bounty` FROM `players` WHERE `id` = "..id..";")
		if bounty:getID() == -1 then return false end
		return bounty:getDataInt("bounty") > 0 and true or false
	end
	return false
end

function getPlayerBounty(playername)
	if playerExists(playername) then
		local id = getPlayerGUIDByName(playername)
		local bounty = db.getResult("SELECT `bounty` FROM `players` WHERE `id` = "..id..";")
		return bounty:getDataInt("bounty") ~= 0 and bounty:getDataInt("bounty") or 0
	end		
	return false
end

function getPlayerNameIsGod(playername)
	if playerExists(playername) then
		local id = getPlayerGUIDByName(playername)
		local bounty = db.getResult("SELECT `group_id` FROM `players` WHERE `id` = "..id..";")
		return bounty:getDataInt("group_id") ~= 0 and bounty:getDataInt("group_id") or 1
	end		
	return false
end

function getPlayerBountyCid(playername)
	if playerExists(playername) then
		local id = getPlayerGUIDByName(playername)+20000
		local bountyCid = db.getResult("SELECT `value` FROM `global_storage` WHERE `key` = "..id..";")
		return bountyCid:getDataInt("value") ~= 0 and bountyCid:getDataInt("value") or 0
	end		
	return false
end

function getKillYourBounty(cid)
	if isPlayer(cid) then
		local id = getPlayerGUID(cid)+20000
		local yourBounty = db.getResult("SELECT `value` FROM `global_storage` WHERE `key` = "..id..";")
		return yourBounty:getDataInt("value") ~= 0 and yourBounty:getDataInt("value") or 0
	end		
	return false
end

function doPlayerAddBounty(playername, bounty)
	if not tonumber(bounty) or tonumber(bounty) < 1 or tonumber(bounty) == nil then
		return false
	end
	if getPlayerBounty(playername) then
		local pid = getPlayerGUIDByName(playername)
		local bounty_ = bounty + getPlayerBounty(playername)
		if db.query("UPDATE `players` SET `bounty` = "..bounty_.." WHERE `id` = "..pid..";") then
			return true
		end
	end
	return false
end

function doPlayerClearBounty(playername)
	if playerExists(playername) then
		local pid = getPlayerGUIDByName(playername)
		local update_bounty = db.query("UPDATE `players` SET `bounty` = 0 WHERE `id` = "..pid..";")
		local rem_globalstor = db.executeQuery("DELETE FROM `global_storage` WHERE `key` = " .. tonumber(pid)+20000 .. ";")
		if update_bounty and rem_globalstor then
			return true
		end
	end
	return false
end

function doPlayerAddBountyPoints(cid, bounty)
	local points = 0
	if bountyConfig.points == true then
		points = 1
	elseif type(bountyConfig.points) == 'number' then
		points = bountyConfig.points
	end
	if points > 0 then
		setPlayerStorageValue(cid, bountyPoints, getPlayerStorageValue(cid, bountyPoints) + points)
	end
	return points > 0 and points or false
end

function playerExist(playername)
	exist = db.getResult("SELECT `id` FROM `players` WHERE `name` = '"..playername.."';")
	return exist:getID() ~= -1 and true or false
end