function onSay(cid, words, param)
    local Configs = {
        comandInterval = 60, -- In seconds (to disable this input value 0)
}
		if Configs.comandInterval ~= 0 then
			local executeTime = getPlayerStorageValue(cid, 660)
			if os.time() < executeTime then
				local tmpstr = "Espere ".. executeTime - os.time() .." segundos"
				if executeTime - os.time() > 5 then
					tmpstr = tmpstr .."s"
				end
				tmpstr = tmpstr .." para usar o comando novamente!"
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, tmpstr)
				return true
			end
		end
    if doPlayerRemoveMoney(cid, 5000) then
        doPlayerAddItem(cid, 2554, 1)
        doSendMagicEffect(getCreaturePosition(cid),13)
        doCreatureSay(cid, "Você comprou uma pá!", TALKTYPE_ORANGE_1)
    else
        doCreatureSay(cid, "Custa 5k, você não possui dinheiro o suficiente.", TALKTYPE_ORANGE_1)
        doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
    end
end