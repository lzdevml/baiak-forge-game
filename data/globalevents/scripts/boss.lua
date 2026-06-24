pos = {x = 139, y = 63, z = 7}

function onTime()
doBroadcastMessage("[Boss Event] Akuma, Grande Deus de Blood City foi invocado!")
doCreateMonster("Akuma", pos, false, true);

return true
end