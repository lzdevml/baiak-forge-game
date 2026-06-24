function onSay(cid, words, param)
       local Configs = {
        comandInterval = 2, -- In seconds (to disable this input value 0)
}
		if Configs.comandInterval ~= 0 then
			local executeTime = getPlayerStorageValue(cid, 660)
			if os.time() < executeTime then
				local tmpstr = "Espere ".. executeTime - os.time() .." segundos"
				if executeTime - os.time() > 1 then
					tmpstr = tmpstr .."s"
				end
				tmpstr = tmpstr .." para usar o comando novamente!"
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, tmpstr)
				return true
			end
		end
		if Configs.comandInterval ~= 0 then	
			setPlayerStorageValue(cid, 660, os.time() + Configs.comandInterval)
		end
        if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) or getPlayerBlessing(cid, 4) or getPlayerBlessing(cid, 5) then
                doPlayerSendCancel(cid,'You have already got one or more blessings!')
        else
                if doPlayerRemoveMoney(cid, 50000) == TRUE then
                        doPlayerAddBlessing(cid, 1)
                        doPlayerAddBlessing(cid, 2)
                        doPlayerAddBlessing(cid, 3)
                        doPlayerAddBlessing(cid, 4)
                        doPlayerAddBlessing(cid, 5)
                        doSendMagicEffect(getPlayerPosition(cid), 28)
                        doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'You have been blessed by the gods!')
                else
                        doPlayerSendCancel(cid, "You need 50k to get blessed!")
                end
        end
return TRUE
end