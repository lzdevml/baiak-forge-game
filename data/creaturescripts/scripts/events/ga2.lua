function onDeath(cid, corpse, killer) 

local M ={
 ["Gerador Azul II"] = {Pos = {x=625,y=42,z=7},id= 1561, Pos2 = {x=625,y=41,z=7},id2= 1561, Pos3 = {x=625,y=40,z=7},id3= 1561, Pos4 = {x=625,y=43,z=7},id4= 1561, Pos5 = {x=625,y=44,z=7},id5= 1561},
}
local mensage1 = "[Evento Dota] Gerador Azul II Foi Destruido!" -- Mensagem depois que o Gerador for Destruido
local monster1 = "Gerador Azul III" -- Boss que irá aparecer na invasão!

local x = M[getCreatureName(cid)]
if x then
        local parede = getTileItemById(x.Pos, x.id) 
        local parede2 = getTileItemById(x.Pos2, x.id2) 
        local parede3 = getTileItemById(x.Pos3, x.id3) 
        local parede4 = getTileItemById(x.Pos4, x.id4) 
        local parede5 = getTileItemById(x.Pos5, x.id5) 
        if parede then 
                doRemoveItem(parede.uid, 1) 
                doRemoveItem(parede2.uid, 1)
                doRemoveItem(parede3.uid, 1)
                doRemoveItem(parede4.uid, 1)
                doRemoveItem(parede5.uid, 1)
								doSummonCreature(monster1, {x=631, y=42, z=7})
broadcastMessage(mensage1, MESSAGE_EVENT_ADVANCE) 
        end 
end
return TRUE 
end