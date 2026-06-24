--- Lib Open-Battle 0.5 by WooX --

openBattle = {

	config = {
		minimumLevel = 130,
		minimumMembersOnline = 13,
		maximumEqualIps = 3
	},

	arenas = {
		["yalahar"] = {x=1151, y=3207, z=7},
		["darashia"] = {x=1275, y=3178, z=8},
		["carlin"] = {x=1215, y=3305, z=7},
		["liberty-bay"] = {x=1061, y=3345, z=7},
		["svargrond"] = {x=1061, y=3345, z=7},
		["edron"] = {x=993, y=3176, z=7}
	},
	
	storages = {
		inArena = 14950,
		kill = 14951,
		deaths = 14952,
		time = 14953,
	}
}

-- Funções --
openBattle.getArenas = function()
	local arenaNames = ""
	for k, v in pairs(openBattle.arenas) do
		arenaNames = arenaNames .. k .. ", "
	end
	return arenaNames
end

openBattle.getMembersOnlineInGuild = function(guildId)
	local p = 0
	for i, cid in pairs(getPlayersOnline()) do
		if getPlayerGuildId(cid) == guildId then
			p = p + 1
		end
	end
	return p
end
    
openBattle.isGuildMC = function(guildId)
	local IPs = {}
	local equalsIPs = {}

	for i, pid in pairs(getPlayersOnline()) do
		if getPlayerGuildId(pid) == guildId then
			table.insert(IPs, getPlayerIp(pid))
		end
	end

	for k, v in pairs(IPs) do
		equalsIPs[v] = equalsIPs[v] and equalsIPs[v]+1 or 1
	end
	
	for m, n in pairs(equalsIPs) do
		if n > openBattle.config.maximumEqualIps then
			return true
		end
	end
end