function onSay(cid,words,param)
    if words == '!ban' then
        local param = string.lower(param)
        local param = string.explode(param,',')    
        if not param[1] then
            doPlayerSendTextMessage(cid,27,'You must specify a player to ban.')
            return true
        elseif(not param[2]) then
            local player = getPlayerByName(param[1])
            if isPlayer(player) then
                doBanPlayer(player,false)
            else
                doPlayerSendTextMessage(cid,27,param[1]..' is not a valid player.')
            end
        elseif param[3] then
            local player = getPlayerByName(param[1])
            local days = tonumber(param[2])
            local reason = tostring(param[3])
            if days and reason then
                doBanPlayer(player,days,reason)
                doPlayerSendTextMessage(cid,27,'You have banned '..param[1]..' for '..param[2]..' days. Reason: '..param[3]..'.')
            else
                doPlayerSendTextMessage(cid,27,'Invalid parameters.')
            end
        else
            if type(tonumber(param[2])) == 'number' then
                local player = getPlayerByName(param[1])
                local days = tonumber(param[2])
                if days ~= false and days ~= nil then
                    doBanPlayer(player,days)
                    doPlayerSendTextMessage(cid,27,'You have banned '..param[1]..' for '..param[2]..' days.')
                else
                    doPlayerSendTextMessage(cid,27,'Invalid parameter number 2: '..param[2]..'.')
                end
            else
                local reason = param[2]
                local player = getPlayerByName(param[1])
                doBanPlayer(player,false,reason)
                doPlayerSendTextMessage(cid,27,'You have banned '..param[1]..'. Reason: '..param[2]..'.')
            end
        end
    elseif words == '!unban' then
        if doUnbanPlayer(param) then
            doPlayerSendTextMessage(cid,27,'Player '..param..' foi desbanido.')
        else
            doPlayerSendTextMessage(cid,27,param..' is\'n a valid player.')
        end
    end
    return true
end