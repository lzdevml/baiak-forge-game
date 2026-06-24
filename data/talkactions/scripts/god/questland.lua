local tpToArena = {x = 31722, y = 32192, z = 6} -- onde os players nascem na arena?
local ZE_blockEnterItemPosition = {x= 32342, y=32216, z=7} -- onde nasce o teleport?

 
function onSay(cid, words, param, channel)
                if(param == 'on') then                                 
                                if(getTileItemById(ZE_blockEnterItemPosition, 1387).uid == 0) then
                                doCreateTeleport(1387, tpToArena, ZE_blockEnterItemPosition)
                                doBroadcastMessage("Questland is open! Gate appears on Dp Thais! Many events and surprises await you!", MESSAGE_EVENT_ADVANCE)                                         
                                end                      
                        elseif (param == 'off') then                   
                                local item = getTileItemById(ZE_blockEnterItemPosition, 1387)
                                        if(item.uid ~= 0) then
                                                doRemoveItem(item.uid)
                                                doBroadcastMessage("Questland is Closed! See you later.", MESSAGE_EVENT_ADVANCE)                                               
                                end                    
                        end
    return true
end