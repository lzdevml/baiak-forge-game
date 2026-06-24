function prepareShutdown(minutes)
        if(minutes <= 0) then
                doSetGameState(GAMESTATE_SHUTDOWN)
                return false
        end

        if(minutes == 1) then
                doBroadcastMessage("O servidor sera reniciado em " .. minutes .. " procure um local seguro para deslogar.")
        elseif(minutes <= 3) then
                doBroadcastMessage("O servidor sera reniciado em " .. minutes .. " procure um local seguro para deslogar.")
        else
                doBroadcastMessage("O servidor sera reniciado em " .. minutes .. " Voltaremos em 3 minutos.")
        end

        shutdownEvent = addEvent(prepareShutdown, 60000, minutes - 1)
        return true
end

function onTime()
    return prepareShutdown(5)
end