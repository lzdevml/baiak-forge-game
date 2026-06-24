function onDeath(cid, corpse, killer)
  
local monstName = "Hell Boss" -- nome do monstro
local target = getCreatureTarget(cid)
local tar = killer[1]
  
if isMonster(cid) then
setPlayerStorageValue(killer[1], 111310, getPlayerStorageValue(killer[1], 111310) +3)
doBroadcastMessage("O Player "..getPlayerName(killer[1]).." derrotou Akuma e foi recompensado com 250k, 500k de Experience + 15 Fragmental Tickets.")
doPlayerAddExperience(tar, 1000000)
doPlayerAddItem(tar, 2160, 25, false)
doPlayerAddItem(tar, 8981, 15, false)
doPlayerAddItem(tar, 6527, 30, false)
end
return TRUE
end