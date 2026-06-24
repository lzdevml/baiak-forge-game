function onLogin(cid)    
    if isPlayerBanned(cid) and getPlayerStorageValue(cid,banCount) >= 3 then
        return false
    end        
    if isPlayerBanned(cid) then
        local reason = getPlayerBanReason(cid)
        if reason ~= "" then
            setPlayerStorageValue(cid,banCount,getPlayerStorageValue(cid,banCount)+1)
            doTeleportThing(cid,getPlayerTemplePos(cid))
            addEvent(doKickPlayerIf,5000,cid)
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,'Voce foi banido por '..reason..' e sera kickado em 5 segundos.')
            mayNotMove(cid,true)
        else
            setPlayerStorageValue(cid,banCount,getPlayerStorageValue(cid,banCount)+1)
            doTeleportThing(cid,getPlayerTemplePos(cid))
            addEvent(doKickPlayerIf,5000,cid)
            mayNotMove(cid,true)            
            doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,'Voce esta banido e sera kickado em 5 segundos.')
        end        
        doMutePlayer(cid, 5)
    end
    return true
end