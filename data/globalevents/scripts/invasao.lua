local Configs = {
	Positions = {
		{x=153,y=58,z=7},
	}
}

function onTime()
	for i = 1, #Configs.Positions do
		doCreateMonster("BOSS King Baiakinho", Configs.Positions[i], false, true)
		doBroadcastMessage("[ATENÇÃO] BOSS King iNVICTOR de outro continente esta atacando a cidade, ajude a protege-la!")
	end
	return true
end