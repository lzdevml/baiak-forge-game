function onSay(cid, words, param)
	local playerParty = getPlayerParty(cid)
	if(playerParty == FALSE) then
		doPlayerSendCancel(cid, "Sorry, you're not in a Party.")
		return TRUE
	end
 
	local playerPartyLevel = getPlayerPartyLevel(cid)
	if(playerPartyLevel < PARTYLEVEL_LEADER) then
		doPlayerSendCancel(cid, "You have to be Leader of your party to change outfits!")
		return TRUE
	end
 
	local players = getPlayersOnline()
	local outfit = getCreatureOutfit(cid)
	local message = "*Party* Your outfit has been changed by leader. (" .. getCreatureName(cid) .. ")"
	local members = 0
	local tmp = {}
	for i, tid in ipairs(players) do
		if(getPlayerParty(tid) == playerParty and cid ~= tid) then
			tmp = outfit
			if(canPlayerWearOutfit(tid, outfit.lookType, outfit.lookAddons) ~= TRUE) then
				local tidOutfit = getCreatureOutfit(tid)
				tmp.lookType = tidOutfit.lookType
				tmp.lookAddons = tidOutfit.lookAddons
			end
 
			doSendMagicEffect(getCreaturePosition(tid), 66)
			doCreatureChangeOutfit(tid, tmp)
			doPlayerSendTextMessage(tid, MESSAGE_INFO_DESCR, message)
			members = members + 1
		end
	end

	doPlayerSendCancel(cid, "Party members outfit has been changed. (Total: " .. members .. ")")
	return TRUE
end