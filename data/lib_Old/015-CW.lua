COH_PUSHTIME = 900000 -- Tempo (em segundos) de exhausted para usar o comando !gocastle - Padrão (3 horas)
COH_AREA = {{x = 212, y = 21, z = 5}, {x = 279, y = 60, z = 8}} -- Canto superior esquerdo / inferior direito do Castle

-- // Não mexa daqui para baixo 
COH_STATUS = 201320111714
COH_PREPARE1 = 201320111715 
COH_PUSHSTOR = 201320111716 
COH_PREPARE2 = 201320111717 

function guildVencedora()
	local name
	local consulta = db.getResult("SELECT `guild` FROM `castelo_guerra` ORDER BY `id` DESC;")
	if (consulta:getID() ~= -1) then
		name = tonumber(consulta:getDataInt('guild'))
	else
		return 0
	end
	return name
end

function doCastleRemoveEnemies()

 for index, creature in ipairs(getPlayersOnline()) do
  if isInArea(getThingPos(creature), COH_AREA[1], COH_AREA[2]) then
   if getPlayerGuildName(creature) ~= getGlobalStorageValue(COH_STATUS) then
    doTeleportThing(creature, getTownTemplePosition(getPlayerTown(creature)))
	doPlayerSetPzLocked(creature, false)
	doRemoveConditions(creature, false)
	doSendMagicEffect(getTownTemplePosition(getPlayerTown(creature)), CONST_ME_TELEPORT)
					if getCreatureSkullType(creature) == 3 then
						doCreatureSetSkullType(creature, 0)
					end
   end
  end
 end
 return true
end