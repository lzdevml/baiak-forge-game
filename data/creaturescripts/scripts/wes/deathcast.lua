function onKill(cid, target, lastHit)

    if isPlayer(target) and isPlayer(cid) then
        local pid = getPlayersOnline()
        for i = 1, #pid do
            doPlayerSendChannelMessage(pid[i], "", "O jogador ".. getCreatureName(cid) .." Level [".. getPlayerLevel(cid) .."] acabou de matar o " .. getCreatureName(target) .. " de Level [".. getPlayerLevel(target) .."].", TALKTYPE_CHANNEL_HIGHLIGHT, 10)
        end
    end
    return true
end