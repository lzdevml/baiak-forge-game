local function atk(cid)
     doSendDistanceShoot(pos5, pos6, 3)
     doSendDistanceShoot(pos7, pos8, 3)
end

local function atkself(cid)
     doSendDistanceShoot(pos9, selfpos, 3)
     doSendDistanceShoot(pos10, selfpos, 3)
     doSendDistanceShoot(pos11, selfpos, 3)
     doSendDistanceShoot(pos12, selfpos, 3)
     doSendDistanceShoot(pos13, selfpos, 3)
     doSendDistanceShoot(pos14, selfpos, 3)
     doSendDistanceShoot(pos15, selfpos, 3)
     doSendDistanceShoot(pos16, selfpos, 3)
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_DAMAGE, -500, -7000, -300, -9000, 200, 200, 100, 400) --- formula de dano que tira o ataque da gran tower

local area = createCombatArea(AREA_TOWER)
setCombatArea(combat, area)

function onCastSpell(cid, var)

selfpos = getCreaturePosition(cid)
pos1 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}	
pos2 = {x=getCreaturePosition(cid).x -  2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}
pos3 = {x=getCreaturePosition(cid).x - 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos4 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos5 = {x=getCreaturePosition(cid).x - 2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}	
pos6 = {x=getCreaturePosition(cid).x - 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos7 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z}
pos8 = {x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y + 2, z=getCreaturePosition(cid).z}
pos9 = {x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z}
pos10 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z}
pos11 = {x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z}
pos12 = {x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
pos13 = {x=getCreaturePosition(cid).x+ 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
pos14 = {x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y - 1, z=getCreaturePosition(cid).z}
pos15 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y - 1, z=getCreaturePosition(cid).z}
pos16 = {x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y - 1, z=getCreaturePosition(cid).z}

doSendDistanceShoot(pos1, pos2, 3)
doSendDistanceShoot(pos3, pos4, 3)
addEvent(atkself, 350)
addEvent(atk, 350)

	return doCombat(cid, combat, var)
end