function onKill(cid, target, damage, flags)
if (not isPlayer(cid)) then
	return true
end

	if isMonster(target) then
		if getCreatureName(target) == "Vip Boss" and bit.band(flags, 1) == 1 then
			if (isPlayer(cid)) then
				setPlayerStorageValue(cid, "reward_vipboss", os.time() + mathtime({1, "hour"}))
				doBroadcastMessage("O jogador ".. getPlayerName(cid) .." matou o Vip Boss.")
			end
		end
	end
	return true 
end