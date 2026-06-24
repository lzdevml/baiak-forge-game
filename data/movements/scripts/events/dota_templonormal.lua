local config = {
    rewards_id = {5957, 8306, 13208, 2493, 2494, 12861, 12870, 12871, 12865, 12866, 12867, 13394, 13393}, -- Rewards ID
    crystal_counts = 25, -- used only if on rewards_id you have crystal coins (ID: 2160).
    }

function onStepIn(cid, item, frompos, item2, topos)
        
local random_item = config.rewards_id[math.random(1, #config.rewards_id)]
local item_name =  getItemNameById(random_item)

if doPlayerSetTown(cid, 1) then
  if(random_item == 2160) then
                        doPlayerAddItem(cid, random_item, config.crystal_counts)
                        doPlayerAddItem(cid, 6527, 150)
		       doPlayerSendTextMessage(cid,25, 'Your team won the dota round! You winner: '.. config.crystal_counts ..' '.. item_name ..'s and 15 event coins!')
                else
                     doPlayerSendTextMessage(cid,25, 'Your team won the dota round! You winner: '.. item_name ..' and 15 event coins!')
                        doPlayerAddItem(cid, random_item, 1)
                        doPlayerAddItem(cid, 6527, 150)
                end
end
return TRUE
end