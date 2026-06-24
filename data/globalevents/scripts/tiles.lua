local config = {
positions = {
["Eventos"] = { x = 32365, y = 32236, z = 7 },  
["Castle"] = { x = 32352, y = 32223, z = 7 },
["Trainers"] = { x =  32373, y = 32236, z = 7 }, 

}
}

function onThink(cid, interval, lastExecution)
for text, pos in pairs(config.positions) do
doSendAnimatedText(pos, text, 58)
end

return TRUE
end 

