-- Coded by Zoom..
local info = {
	[1] = "%s [Level: %s] estilhaçou %s%s.",
	[2] = "Se %s [Level: %s] continuar assim, %s%s vai morrer dentro da PZ.",
	[3] = "%s [Level: %s] mandou um brutality em %s%s.",
	[4] = "%s [Level: %s] fez a vida abandonar %s%s.",
	[5] = "%s [Level: %s] forrou o chão com o sangue de %s%s.",
	[6] = "%s [Level: %s] aniquilou %s%s.",
	[7] = "%s [Level: %s] acabou de derrotar %s%s.",
	[8] = "%s [Level: %s] está com o sangue de %s%s nas mãos.",
	[9] = "%s [Level: %s] destruiu %s%s.",
	[10] = "%s [Level: %s] da boas vindas a %s%s no circo de soled.",
	[11] = "%s [Level: %s] fará %s%s ter pesadelos por um tempo.",
	[12] = "%s [Level: %s] está sendo cruel com %s%s.",
	[13] = "Que isso %s [Level: %s], melhor %s%s ir treinar um pouco.",
	[14] = "%s [Level: %s] venceu a luta contra %s%s.",
	[15] = "%s [Level: %s] trouxe dor e sofrimento para %s%s.",
	[16] = "%s [Level: %s] assassinou %s%s.",
	[17] = "%s [Level: %s] castigou %s%s.",
	[18] = "%s [Level: %s] enfrentou e derrubou %s%s.",
    [19] = "%s [Level: %s] matou %s%s.",
	[20] = "%s [Level: %s] casou %s%s com a morte.",
	[21] = "%s [Level: %s] purificou %s%s."
}

local lose, win = "%s acabou de impedir que %s fizesse uma sequência de %s frags seguidos.", "%s obteve %s frags seguidos após derrotar %s."
local frags, storage = {3, 5, 8, 10}, 45823

function onDeath(cid, corpse, deathList)
local target = deathList[1]

if(not isPlayer(cid) or not isPlayer(target)) then
	return true
end

	doCreatureSetStorage(target, storage, getCreatureStorage(target, storage) + (getCreatureStorage(target, storage) == -1 and 2 or 1))
	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendChannelMessage(pid, '', info[math.random(21)]:format(getCreatureName(target), isPlayer(target) and getPlayerLevel(target), getCreatureName(cid), " [Level: "..getPlayerLevel(cid).."]"), TALKTYPE_CHANNEL_ORANGE, 0xF)
		for _, frag in ipairs(frags) do			
			if(getCreatureStorage(target, storage) == frag) then
				doPlayerSendChannelMessage(pid, '', win:format(getCreatureName(target), frag, getCreatureName(cid)), TALKTYPE_CHANNEL_MANAGEMENT, 0xF)
			end
		end
	end

	doCreatureSetStorage(cid, storage, 0)
	return true
end