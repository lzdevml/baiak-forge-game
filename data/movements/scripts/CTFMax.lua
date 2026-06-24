--[[
	Capture The Flag System
	Author: Maxwell Denisson(MaXwEllDeN)
	Version: 2.0
	Contact: maxwellmda@gmail.com
]]

local CTF = CTF_LIB

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local team = getItemAttribute(item.uid, "team")

	if team ~= getPlayerStorageValue(cid, 45990) then
		return doTeleportThing(cid, fromPosition)
	end

	if getPlayerStorageValue(cid, 45992) == -1 then
		doPlayerSendCancel(cid, "Você não está com a bandeira.")
		return doTeleportThing(cid, fromPosition)
	end

	if CTF.addPoint(cid) ~= "close" then
		doTeleportThing(cid, fromPosition)
	end

	return true
end
