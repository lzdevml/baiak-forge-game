--- Create by Collo~ gg: 7284838 (c)----

function onStepIn(cid, item, pos) 
local tp = { 
            {x = 160, y = 51, z = 7},
            {x = 160, y = 51, z = 7}
           
            } 
    if isCreature(cid) == TRUE then 
        doTeleportThing(cid, tp[math.random(#tp)]) 
    end 
return true 
end 