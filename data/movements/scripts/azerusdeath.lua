function onStepIn(cid, item, position, fromPosition) 


local yalahar = {x = 341, y = 540, z = 3, stackpos=253} 

        if item.itemid == 9738 then 
        doTeleportThing(cid, yalahar, TRUE) 
        doSendMagicEffect(yalahar,12) 
        end 
     
    return TRUE 
end  