function onDeath(cid, corpse, deathList)
	doCreateMonster("Ferumbras Mortal Shell", {x = 293, y = 608, z = 5})
	doCreatureSay(cid, "AAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHH!", TALKTYPE_MONSTER_SAY, nil, nil, {x = 293, y = 608, z = 5})
	doCreatureSay(cid, "FINALY YOU FORCED FERUMBRAS BACK INTO A MORTAL FORM - HE IS NOT AMUSED!", TALKTYPE_MONSTER_SAY, nil, nil, {x = 293, y = 608, z = 5})
	return true
end