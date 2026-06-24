-----------------------------------            
---------SCRIPT por PC98------------    NAO REMOVA OS CREDITOS      
-----------------------------------            


function onUse(cid, item, frompos, item2, topos) 

------------------ Inicio das Config ------------

local castle_two_name = "Hell"                  -- Nome do castelo 2
local storages = {154154,54321,321321}                -- Storages ( se vc eh iniciante, deixe como está...)
                                       
nplayer1pos = {x=1233, y=1992, z=6}
npsummonpos = {x=1222, y=1992, z=6}

-------PREMIOs  I N D I V I D U A L ---------

local premio_por_vezes = 0         -- Premio por vezes de conquista de castelo. (1) = Ativo  (0) = Desativa. 
local premio_vezes = 1            -- Caso ativo, a quantidade de conquista que o player tem, para ganhar PREMIO.
local premio = 2160                -- ID do Premio
local premio_cont = 0             -- Quantidade do Premio
local premio_reset = 0             -- Resetar o contador do premio depois que atingir a meta?? (1) = SIM  (0) = NAO
 
-------FIM PREMIOs I N D I V I D U A L ---------



 
----------------- FIM DAS CONFIG -----------------

local sto_ativ = getGlobalStorageValue(storages[2])
position = getCreaturePosition(cid)


   if isPlayerGuild(cid) == TRUE then
      if sto_ativ == 1 or sto_ativ == -1 then

         guildname = getPlayerGuildName(cid)     
         guild = getPlayerGuildId(cid)               
         guild_sto = getGlobalStorageValue(storages[3])
         score = 1
local score = {}
table.insert(score, {getPlayerGuildName(cid), 1})
table.sort(score, function(a, b) return a[2] > b[2] end)
local hora = os.date("%X")
local data = os.date("%x")
                  
            if guild ~= guild_sto then            
               setPlayerStorageValue(cid,guild_sto,guild)
               
               -----------------------------------------------------                      
               if getPlayerStorageValue(cid,storages[1]) == -1 then
                  setPlayerStorageValue(cid,storages[1],0)
               end
               -----------------------------------------------------
               
               sto_vezes = getPlayerStorageValue(cid,storages[1])                   
               
               setGlobalStorageValue(storages[3],getPlayerGuildId(cid))
               setPlayerStorageValue(cid,storages[1], sto_vezes + 1)
               
               sto_vezes_total = getPlayerStorageValue(cid,storages[1])
                        
               doBroadcastMessage(" "..getCreatureName(cid).." acabou de conquistar o castelo para a guild \""..guildname.."\" pela "..sto_vezes_total.."ª vez.", 21)
               doSendMagicEffect(position, 39)
               doTeleportThing(cid, nplayer1pos, true)
               doSummonCreature("Zeus", npsummonpos)
-- db.query("INSERT INTO `castlewar`  VALUES ('', ".. db.escapeString(score[1][1]) ..  ",".. score[1][2] ..", ".. db.escapeString(data) ..", ".. db.escapeString(hora) ..");")
-- db.executeQuery("UPDATE `guilds` SET `castlewar`= castlewar + 1 WHERE `name` = " .. db.escapeString(score[1][1]) .. ";")
--doSaveServer(13)                
                 if premio_por_vezes == 1 then
                    if getPlayerStorageValue(cid,storages[1]) == premio_vezes then
                       if getItemWeightById(premio,1) <= getPlayerFreeCap(cid) then
                          doPlayerAddItem(cid, premio,premio_cont)
                          doPlayerSendTextMessage(cid, 18, "Voce recebeu 1kk como recompensa pela sua primeira conquista!")
                        -----------------------------------------------  --  
                            if premio_reset == 1 then                    --
                               setPlayerStorageValue(cid,storages[1],0)  --  Resetar a contagem
                            end                                          --
                        -----------------------------------------------  --
                        
                       else
                       doPlayerSendTextMessage(cid, 18, "Voce nao tem capacidade para ganhar o item. Vamos verificar novamente em 10 segundos!")
                       addEvent(additem,10000,cid,premio,premio_cont,premio_reset)
                       end
                    end                                        
                 end               
            else
              doPlayerSendCancel(cid,"Este castelo ja foi conquistado pela sua guild!")
              doSendMagicEffect(position, 2)
            end
      else
      doPlayerSendCancel(cid,"O sistema está desativado")
      end      
   else
   doPlayerSendCancel(cid,"É nescessario ter guild para dominar o castelo!")
   doSendMagicEffect(position, 2)
   end
end


function isPlayerGuild(cid)
if getPlayerGuildName(cid) ~= "" then
return TRUE
else
return FALSE
end
end