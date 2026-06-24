function onSay(cid, words, param, channel)
	doPlayerPopupFYI(cid, "                                    # Mining System #\n                -- Informações sobre level e quant --\n\n- [Mining 0-9] = max: 1 crystal (5% chance)\n- [Mining 10-19] = max: 1 crystal (6% chance)\n- [Mining 20-59] = max: 1 crystal (7% chance)\n- [Mining 60-89] = max: 2 crystals (8% chance) \n- [Mining 90-99] = max: 2 crystals (9% chance) \n- [Mining 100] = max: 3 crystals (10% chance) \n\n\nYour Mining Level: "..getPlayerStorageValue(cid, 10003).."")
	return true
end
