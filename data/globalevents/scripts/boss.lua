local function createboss()
	doBroadcastMessage("Uma Alpha Tower apareceu na cidade! Destruam ela para upar e dropar itens!")
	doCreateMonster("BOSS King Baiakinho",{x = 153, y = 58, z = 7})
end

function onTime()
	local random1 = math.random(1,6)
	local random2 = math.random(7,12)
	addEvent(createboss,random1*3600000)
	addEvent(createboss,random2*3600000)
    return true
end
