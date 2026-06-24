function onThink(interval)
	if getStorage(ctfConfig.eventStorage) == 1 then
		checkDeathRoomCTF()

		for _, playerWithFlag in ipairs(getPlayersOnline()) do
			if getCreatureStorage(playerWithFlag, ctfConfig.flag.storage) == 1 then
				doSendAnimatedText(getThingPos(playerWithFlag), 'FLAG', COLOR_DARKYELLOW)
				doSendMagicEffect(getThingPos(playerWithFlag), 61)
			--	doChangeSpeed(playerWithFlag, (getCreatureSpeed(playerWithFlag) < 150 and 150 - getCreatureSpeed(playerWithFlag) or getCreatureSpeed(playerWithFlag) > 150 and - (getCreatureSpeed(playerWithFlag) - 150)))							
				break
			end
		end
	end
	return true
end