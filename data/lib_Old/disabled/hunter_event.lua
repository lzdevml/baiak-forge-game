HunterEvent = {}
 
HunterEvent.config =
   {
       minPlayers = 2,
       lifes = 5,
       maxDuration = 30,
       winItems =
           {
               {name = 'tokens', qty = 50, chance = 100},
               {name = 'pvpe scroll', qty = 2, chance = 20},
               {name = 'event coin', qty = 0, chance = 0}
           },
       enterArea =
           {
               from = {x = 1141, y = 413, z = 7},
               to = {x = 1161, y = 430, z = 7}
           },
       playArea =
           { 
               from = {x = 1148, y = 328, z = 7},
               to = {x = 1208, y = 366, z = 7}
           },
       kickPos = {x = 156, y = 55, z = 7},
       isOnArena = 40000,
       globalStatus = 40000,
       accessToIgnore = 3
   }
 
function HunterEvent.setPlayerStorage(cid, value)
   return doPlayerSetStorageValue(cid, HunterEvent.config.isOnArena, value)
end
 
function HunterEvent.getPlayerStorage(cid)
   return getPlayerStorageValue(cid, HunterEvent.config.isOnArena)
end
 
function HunterEvent.addWinnerItems(cid)
   for i = 1, #HunterEvent.config.winItems do
       if math.random(1, 100) <= HunterEvent.config.winItems[i].chance then
           doPlayerAddItem(cid, getItemIdByName(HunterEvent.config.winItems[i].name), HunterEvent.config.winItems[i].qty, true)
       end
   end
end
 
function HunterEvent.addPlayerSummon(cid)
   local s = getCreatureSummons(cid)
   if table.maxn(s) > 0 then
       for _, sid in ipairs(s) do
           doRemoveCreature(sid)
       end
   end
   doSummonMonster(cid, 'Hunter Event')
end
 
function HunterEvent.kickPlayerFromArena(cid)
   HunterEvent.setPlayerStorage(cid, 0)
   doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
   doTeleportThing(cid, HunterEvent.config.kickPos)
   doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
   local p = HunterEvent.getPlayersInArena()
   if #p == 1 then
       HunterEvent.kickPlayerFromArena(p[1].pid)
       HunterEvent.addWinnerItems(p[1].pid)
       doSetStorage(HunterEvent.config.globalStatus, 0)
       doBroadcastMessage('[Hunter Event]: '.. getCreatureName(cid) ..' has won the Hunter Event!!')
   end
end
 
function HunterEvent.removePlayerLife(cid)
   if HunterEvent.getPlayerStorage(cid) == 1 then
       return HunterEvent.kickPlayerFromArena(cid)
   end
   HunterEvent.setPlayerStorage(cid, HunterEvent.getPlayerStorage(cid) - 1)
   doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
   doTeleportThing(cid, {x = math.random(HunterEvent.config.playArea.from.x, HunterEvent.config.playArea.to.x), y = math.random(HunterEvent.config.playArea.from.y, HunterEvent.config.playArea.to.y), z = math.random(HunterEvent.config.playArea.from.z, HunterEvent.config.playArea.to.z)})
   HunterEvent.addPlayerSummon(cid)
end
 
function HunterEvent.countPlayers()
   local c = 0
   for _, cid in ipairs(getPlayersOnline()) do
       local p = getCreaturePosition(cid)
       if isInRange(p, HunterEvent.config.enterArea.from, HunterEvent.config.enterArea.to) then
           if getPlayerAccess(cid) < HunterEvent.config.accessToIgnore then
               c = c + 1
           end
       end
   end
   return c
end
 
function HunterEvent.kickPlayersFromWaitingArena()
   for _, cid in ipairs(getPlayersOnline()) do
       local p = getCreaturePosition(cid)
       if isInRange(p, HunterEvent.config.enterArea.from, HunterEvent.config.enterArea.to) then
           doTeleportThing(cid, HunterEvent.config.kickPos)
           doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)  
       end
   end  
end
 
function HunterEvent.addPlayersToArena()
   for _, cid in ipairs(getPlayersOnline()) do
       local p = getCreaturePosition(cid)
       if isInRange(p, HunterEvent.config.enterArea.from, HunterEvent.config.enterArea.to) then
           doTeleportThing(cid, {x = math.random(HunterEvent.config.playArea.from.x, HunterEvent.config.playArea.to.x), y = math.random(HunterEvent.config.playArea.from.y, HunterEvent.config.playArea.to.y), z = math.random(HunterEvent.config.playArea.from.z, HunterEvent.config.playArea.to.z)})
           if getPlayerAccess(cid) < HunterEvent.config.accessToIgnore then
               HunterEvent.setPlayerStorage(cid, HunterEvent.config.lifes)
               HunterEvent.addPlayerSummon(cid)
           end
       end
   end
end
 
function HunterEvent.getPlayersInArena()
   local p = {}
   for _, cid in ipairs(getPlayersOnline()) do
       if HunterEvent.getPlayerStorage(cid) > 0 then
           table.insert(p, {pid = cid, pos = getCreaturePosition(cid), lifes = HunterEvent.getPlayerStorage(cid)})
       end
   end
   return p
end
 
function HunterEvent.checkMaxTime()
   if getGlobalStorageValue(HunterEvent.config.globalStatus) == 1 then
       local p = HunterEvent.getPlayersInArena()
       for i = 1, #p do
           HunterEvent.setPlayerStorage(p[i].pid, 0)
           local s = getCreatureSummons(p[i].pid)
           if table.maxn(s) > 0 then
               for _, sid in ipairs(s) do
                   doRemoveCreature(sid)
               end
           end
           doTeleportThing(p[i].pid, HunterEvent.config.kickPos)
           doSendMagicEffect(p[i].pos, CONST_ME_TELEPORT)
       end
       doBroadcastMessage('[HunterEvent]: Exceed maximum hunt time!!')
       setGlobalStorageValue(HunterEvent.config.globalStatus, 0)
   end
end
 
function HunterEvent.startArena()
   if getGlobalStorageValue(HunterEvent.config.globalStatus) <= 0 then
       if HunterEvent.countPlayers() >= HunterEvent.config.minPlayers then
           HunterEvent.addPlayersToArena()
           setGlobalStorageValue(HunterEvent.config.globalStatus, 1)
           return doBroadcastMessage('[Hunter Event]: The hunt has started!! Good luck to everyone!!') and addEvent(HunterEvent.checkMaxTime, HunterEvent.config.maxDuration * 60 * 1000)
       else
           return doBroadcastMessage('[Hunter Event]: Not enough players!!') and HunterEvent.kickPlayersFromWaitingArena()
       end
   end
end