  ---------------                                                   
-----BY PC98-------  
  ---------------                                                   
         
function onUse(cid, item, frompos, item2, topos) 

-------------------------Config-----------------------------------------------------------------

door_opened = 9280                        -- ID da porta aberta
storage_guild = getGlobalStorageValue(123123)  -- A 3ª storage configurada em Castle.lua

guarda_ativ = 1      -- Caso um invasor tente abrir a porta, sumonar o Monstro "Guarda"??  | (1) = SIM  (0) = NAO
guarda_cont = 2                                 -- Caso ativo: a quantidade de guardas a sumonar
guarda_pos = {x=3184,y=294,y=7}                  -- Posiçao a ser sumonada os guardas!

-------------------------Fim de Config-----------------------------------------------------------


if getPlayerGuildId(cid) == storage_guild then
   doTeleportThing(cid,getThingPos(item.uid))
   doTransformItem(item.uid, door_opened)
   doPlayerSendTextMessage(cid, 22, "[BkCastle] Seja bem vindo a vosso castelo!")   
   return TRUE
else
    doPlayerSendTextMessage(cid, 22, "[BkCastle] Este castelo nao pertence a sua guild")
    return FALSE
    end
end