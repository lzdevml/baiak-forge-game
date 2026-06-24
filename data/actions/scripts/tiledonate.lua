function onUse(cid, item, frompos, item2, topos) 

local tileConfig = {
	DonatePos = {x = 4857, y = 297, z = 7}
}
	doTeleportThing(cid, tileConfig.DonatePos)
end