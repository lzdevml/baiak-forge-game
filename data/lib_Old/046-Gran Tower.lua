GRANTOWER = {}
GRANTOWER.PREPARETIME = 1 -- Tempo até liberar a entrada para o evento.
GRANTOWER.CLOSETIME = 40 -- Tempo em minutos de duração do evento.
GRANTOWER.LEVEL = 100 -- Mínimo de level para participar do evento.
GRANTOWER.MAXGUILD = 999 -- Máximo de players por guild dentro do evento.     
GRANTOWER.DATES = {{"Sunday", "15:00"}, {"Monday", "15:00"}, {"Tuesday", "15:00"}, {"Wednesday", "15:00"}, {"Thursday", "15:00"}, {"Friday", "15:00"}, {"Saturday", "15:00"}} -- Dias e horários que ocorrem o evento.
GRANTOWER.ENTER = {x = 712, y = 1236, z = 4} -- A posição da entrada do castelo, aonde os players são mandados pelo NPC.
GRANTOWER.TOWERPOSITION = {x = 711, y = 1231, z = 6} -- Posição aonde fica o Gran Tower (o monstro).
GRANTOWER.AREA = {{x = 575, y = 1136, z = 7}, {x = 852, y = 1347, z = 4}} --[[A primeira posição é o canto superior esquerdo do mapa do castelo, e a segunda é o canto direito inferior
OBSERVAÇÃO IMPORTANTE: O script foi modificado por mim (xWhiteWolf) para aguentar diferentes andares, apenas coloque a posição dos cantos e o primeiro até o ultimo andar que ele irá remover todo mundo
em todos os andares quando alguém matar a gran tower, pra remover isso apenas coloque o z do mesmo andar da gran tower e apenas os membros que estão nesse andar serão teleportados,
contudo isso pode ocasionar que pessoas consigam ficar dentro do castelo mesmo após o evento ter sido encerrado!]]
GRANTOWER.AURAPERCENT = 0.9 --- porcentagem do dano que irá levar (0.8 = 80%) significa que ele ignora 20% de dano! (adicionado por xWhiteWolf)
GRANTOWER.SHURIAURA = false --- colocar true/false se quiser ativar/desativar a aura de shurikens pro player que tem a gran aura. (adicionado por xWhiteWolf)


--// Favor não mexer daqui para baixo se não souber oque está fazendo!!!
GRANTOWER.EMPTYWINNER = "# [Nobody] #"
GRANTOWER.PREPARE = 201405051746
GRANTOWER.RUNNING = 201405051747
GRANTOWER.AURA = 201405052018
GRANTOWER.DESTROYCOUNT = 201405051800
GRANTOWER.FINALWINNER = 201405051805
GRANTOWER.SAVELASTWINNER = 201405061333 
GRANTOWER.SAVEWINNERGUILDID = 201405061403

function doPrepareGranTower()
 if ((getGlobalStorageValue(GRANTOWER.PREPARE) ~= 1) and (getGlobalStorageValue(GRANTOWER.RUNNING) ~= 1)) then
  setGlobalStorageValue(GRANTOWER.PREPARE, 1)
  addEvent(doStartGranTower, GRANTOWER.PREPARETIME * 60 * 1000)
  addEvent(doBroadcastMessage, ((GRANTOWER.PREPARETIME / 2) * 60 * 1000), "[Guild Battle] Missing "..tostring((GRANTOWER.PREPARETIME / 2)).." minutes NPC Melkrapo will release the entrance to the event, get ready!")
  doBroadcastMessage("[Guild Battle] The event will be started in "..tostring(GRANTOWER.PREPARETIME).." minutes, please prepare your weapons and your team.")
 else
  print("[Erro] Guild Battle tentou ser iniciado ja ligado, favor verificar o codigo.")
 end
 return true
end

function doStartGranTower()
 if ((getGlobalStorageValue(GRANTOWER.PREPARE) ~= -1) and (getGlobalStorageValue(GRANTOWER.RUNNING) ~= 1)) then
  setGlobalStorageValue(GRANTOWER.RUNNING, 1)
  setGlobalStorageValue(GRANTOWER.PREPARE, -1)
  setGlobalStorageValue(GRANTOWER.SAVEWINNERGUILDID, -1)
  setGlobalStorageValue(GRANTOWER.FINALWINNER, GRANTOWER.EMPTYWINNER)
  setGlobalStorageValue(GRANTOWER.SAVELASTWINNER, GRANTOWER.EMPTYWINNER)
  setGlobalStorageValue(GRANTOWER.DESTROYCOUNT, 0)
  doCreateMonster("Gran Tower", GRANTOWER.TOWERPOSITION)
  addEvent(doBroadcastMessage, ((GRANTOWER.CLOSETIME - 1) * 60 * 1000), "[Guild Battle] The event will be closed in one minute. Hurry up!")
  addEvent(doCloseGranTower, GRANTOWER.CLOSETIME * 60 * 1000)
  doBroadcastMessage("[Gran Tower] Open event! Run to destroy the Gran Tower.")
 else
  print("[Erro] Guild Battle tentou ser iniciado já ligado, favor verificar o código.")
 end
 return true
end

function doCloseGranTower()
 if ((getGlobalStorageValue(GRANTOWER.PREPARE) ~= 1) and (getGlobalStorageValue(GRANTOWER.RUNNING) ~= -1)) then
  for index, creature in ipairs(getGranTowerPlayers()) do
   doTeleportThing(creature, getTownTemplePosition(getPlayerTown(creature)))
  end
  for index, creature in ipairs(getPlayersOnline()) do
   if (getPlayerGuildId(creature) >= 1) then
    if getPlayerGuildId(creature) ~= getGlobalStorageValue(GRANTOWER.SAVEWINNERGUILDID) then
     setPlayerStorageValue(creature, GRANTOWER.AURA, -1)
    end
   end 
  end
  setGlobalStorageValue(GRANTOWER.RUNNING, -1)
  if (getCreatureByName("Gran Tower")) then
   doRemoveCreature(getCreatureByName("Gran Tower"), true)
  end
  local TMP_WINNER = getGlobalStorageValue(GRANTOWER.FINALWINNER)
  doBroadcastMessage("[Guild Battle] The event was completed with "..tostring(getGlobalStorageValue(GRANTOWER.DESTROYCOUNT)).." wrecks to Tower, the final winner was "..(TMP_WINNER)..".")
  setGlobalStorageValue(GRANTOWER.DESTROYCOUNT, -1)
  setGlobalStorageValue(GRANTOWER.SAVELASTWINNER, TMP_WINNER)
  setGlobalStorageValue(GRANTOWER.FINALWINNER, -1)
  local TMP_WINNER = nil
 end
 return true
end

function getGranTowerPlayers() -- xWhiteWolf
local players = {}	
local andares = math.abs(GRANTOWER.AREA[1].z - GRANTOWER.AREA[2].z)
	for index, creature in ipairs(getPlayersOnline()) do		
		local z = 0
		local pos1 = {x = GRANTOWER.AREA[1].x, y = GRANTOWER.AREA[1].y, z = GRANTOWER.AREA[1].z}
		local pos2 = {x = GRANTOWER.AREA[2].x, y = GRANTOWER.AREA[2].y, z = GRANTOWER.AREA[2].z}
		
		for i = 0, andares do
			z = z or 0
			pos1.z = pos1.z > pos2.z and pos2.z + z or pos1.z + z
			pos2.z = pos1.z
			z = 1
	
			if isInArea(getThingPos(creature), pos1, pos2) then
					table.insert(players, creature)
			end
		end
	end
return players
end

function getGranTowerGuild(guild_id) -- xWhiteWolf
local players = {}	
local andares = math.abs(GRANTOWER.AREA[1].z - GRANTOWER.AREA[2].z)
	for index, creature in ipairs(getPlayersOnline()) do		
		local z = 0
		local pos1 = {x = GRANTOWER.AREA[1].x, y = GRANTOWER.AREA[1].y, z = GRANTOWER.AREA[1].z}
		local pos2 = {x = GRANTOWER.AREA[2].x, y = GRANTOWER.AREA[2].y, z = GRANTOWER.AREA[2].z}
		
		for i = 0, andares do
			z = z or 0
			pos1.z = pos1.z > pos2.z and pos2.z + z or pos1.z + z
			pos2.z = pos1.z
			z = 1
	
			if isInArea(getThingPos(creature), pos1, pos2) then
				if (getPlayerGuildId(creature) == guild_id) then
					table.insert(players, creature)
				end
			end
		end
	end
return players
end

-- // Gran Aura \/
 
function newColor(n)  
 local n = tonumber(n) or 0
 local n = n + 19
 return tonumber(n) or 0
end

function newColor(n) 
 local n = tonumber(n) or 132
 local n = n - 19
 return tonumber(n) or 132
end
 
-- comentario: se a cor for preta o addon vai para branco sendo que o certo é diminuir 19..
 
local events = {}
function changeOutfit(uid) -- arrumado por xWhiteWolf e adicionado a opção da Shuri
 local sec = 0.5
 local temp = getCreatureOutfit(uid) 

 if (type(temp) == "number") then 
  return true 
 end
   
if getGlobalStorageValue(GRANTOWER.SAVELASTWINNER) ~= getCreatureName(uid) then
	if getGlobalStorageValue(GRANTOWER.SAVEWINNERGUILDID) ~= getPlayerGuildId(uid) then
			return true
	end
end
 
if GRANTOWER.SHURIAURA then
 local pos = getCreaturePosition(uid)
	local effectPos = {
	[1] = {x = pos.x - 2, y = pos.y - 2, z = pos.z},
	[2] = {x = pos.x + 2, y = pos.y + 2, z = pos.z}
	}

	for i = 1, #effectPos do
	position = effectPos[i + 1] or effectPos[i - 1]
	doSendDistanceShoot(effectPos[i], position, 18)
	end
end
 
 local outfit = {
  lookType = temp.lookType,
  lookHead = newColor(temp.lookHead),
  lookBody = newColor(temp.lookBody),
  lookLegs = newColor(temp.lookLegs),
  lookFeet = newColor(temp.lookFeet),
  lookAddons = getCreatureOutfit(uid).lookAddons,
 }
 doSetCreatureOutfit(uid, outfit, sec)
 local event = addEvent(function()
	 if isCreature(uid) then
	 changeOutfit(uid)
	 end
 end, 3.0 * sec * 450)
 events[uid] = event 
 return true
end