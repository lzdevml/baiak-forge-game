function onDeath(cid, corpse, killer) 

local M ={
 ["Gerador Vermelho III"] = {Pos = {x=648,y=40,z=7},id= 1561,Pos2 = {x=640,y=42,z=7},id2= 1561},
}
local mensage1 = "[Evento Dota] Gerador Vermelho III Foi Destruido! Time Vermelho foi o Vencedor desta Rodada do Evento Dota! O time oponente pode voltar !" -- Mensagem depois que o Gerador for Destruido
local a3 = {x=631, y=42, z=7, stackpos=253} -- position a3
local a2 = {x=619, y=41, z=7, stackpos=253} -- position a2
local a1 = {x=607, y=42, z=7, stackpos=253} -- position a1

local x = M[getCreatureName(cid)]
if x then
        local parede = getTileItemById(x.Pos, x.id)
        local parede2 = getTileItemById(x.Pos2, x.id2) 		
        if parede then 
                doRemoveItem(parede.uid, 1)
                doRemoveItem(parede2.uid, 1) 					
			doRemoveCreature(getThingfromPos(a3).uid)
broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE) 
        end 
end
return TRUE 
end