function onThink(cid, interval)
local centerPos = {x=158,y=54,z=7}
	local cyko = {   
		streampos = getSpectators(centerPos, 12, 10, false), --Middle pos of the temple and radius.
		ghost = false, --You want allow players which using ghost? true of false. 
	}      
	local stream = "{"
	if cyko.streampos then
		for i = 1, #cyko.streampos do
			local cid = cyko.streampos[i]
			if isPlayer(cid) and isPlayerGhost(cid) == cyko.ghost then
				stream = stream .. '"'..getCreatureName(cid)..'":['.. getCreaturePosition(cid).x - (centerPos.x-10) ..','.. getCreaturePosition(cid).y - (centerPos.y-9) ..','.. getCreaturePosition(cid).z ..','.. getCreatureOutfit(cid).lookType ..','.. getCreatureOutfit(cid).lookAddons ..','.. getCreatureOutfit(cid).lookHead ..','.. getCreatureOutfit(cid).lookBody ..','.. getCreatureOutfit(cid).lookLegs ..','.. getCreatureOutfit(cid).lookFeet ..',0,'.. (getCreatureLookDirection(cid)) ..',' .. getCreatureOutfit(cid).lookTypeEx .. ','.. getCreatureSkullType(cid) ..'],';
			end
		end
	end
	stream = stream .. '}'
	local text = stream
	local file = io.open("/home/hells/cache/stream.json", "w")
	file:write("".. text .. "")
	file:close() 
	return true 
end