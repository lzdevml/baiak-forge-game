function onThink(interval)
	if getStorage(ctfConfig.eventStorage) == 1 then
		doAddScoreToBaseCTF()
	end
	return true
end