function onTime()
function doBroadSave(delay)
if delay ~= 0 then
doBroadcastMessage("[Styller-OTS Server Save] O servidor será reiniciado em "..delay.." minuto"..(delay > 1 and "s" or ""))
addEvent(doBroadSave, 60000, delay -1) 
else
doSaveServer()
doShutdown()
end
end
doBroadSave(5)
return true
end