local function hasBoss()

	local id = getGlobalStorageValue("bossSys")
	if id ~= -1 then
		if isMonster(id) then
			return true
		else
			return false
		end
	end
	return false
end



local postp, postpentrada = {x=165, y=53, z=7},{x = 165, y = 639, z = 7}
local days = {"Sunday"}

function onTime()
	if isInArray(days, os.date("%A")) then
	if not hasBoss() then
        doCreateTeleport(1387, postpentrada, postp)
		local id = doCreateMonster("Imohtep", {x = 144, y = 640, z = 7})
		setGlobalStorageValue("bossSys", id)
		doBroadcastMessage("O Boss IMOHTEP foi invocado. Destrua este demonio e receba recompensas do Anubis.")
		end
	end
	return true
end

function onThink(interval, lastExecution)	
	
	if hasBoss() then
	doSendAnimatedText(postp, "Imhotep", 245)
	doSendMagicEffect(postp, 11)
	end
	return true
end
