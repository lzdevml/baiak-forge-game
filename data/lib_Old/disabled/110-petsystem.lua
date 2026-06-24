-- Pet System Configuration - moist
local HasteCondition = createConditionObject(CONDITION_HASTE)
setConditionParam(HasteCondition, CONDITION_PARAM_TICKS, 30000)
setConditionFormula(HasteCondition, -1, 450, -1, 450)

-- CONFIGURATION
local base = 8000
Pet = {
	Base = 8000, -- Base storage for offsets, no need to touch.
	LastThink = base+1,
	LastAttack = base+2,
	
	HealthPerSec = 0.05, -- Health percent per 1.5 seconds
	ManaPerSec = 0.05, -- Mana percent per 1.5 seconds
	AllowedVocations = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, -- Allowed vocations to summon a monster
	MaxItems = 3, -- Maximum items a pet can hold
	
	[1] = {name = "Wizard Guardian", 
		summonEffect = CONST_ME_MAGIC_RED,
		manaPercent = 0.5, -- Percent of your mana theyll gain
		healthPercent = 0.5, -- Percent of health theyll gain
		StorageMaxMana = base+10,
		StorageMana = base+11,
		StorageManaDefault = base+11,
		StorageHealthDefault = base+12,
		StorageDamageBonus = base+11,
		StorageInventory = base+15
	},
	[2] = {name = "Puppet",
		summonEffect = CONST_ME_MAGIC_BLUE,
		manaPercent = 0.75, -- Percent of your mana theyll gain
		healthPercent = 0.75, -- Percent of health theyll gain
		StorageMaxMana = base+30,
		StorageMana = base+31,
		StorageManaDefault = base+31,
		StorageHealthDefault = base+32,
		StorageDamageBonus = base+31,
		StorageInventory = base+35
	},
	[3] = {name = "Dragon Hatchling",
		summonEffect = CONST_ME_MAGIC_GREEN,
		manaPercent = 0.45, -- Percent of your mana theyll gain
		healthPercent = 0.45, -- Percent of health theyll gain
		StorageMaxMana = base+30,
		StorageMana = base+31,
		StorageManaDefault = base+32,
		StorageHealthDefault = base+33,
		StorageDamageBonus = base+25,
		StorageInventory = base+35
	},
	
	Items = {
		[5887] = {
			message = "My Master Strengthens Me!",
			effect = "BoostHealth",
			color = COLOR_LIGHTGREEN,
			amount = 500
		},
		[5888] = {
			message = "My Master Strengthens Me!",
			effect = "BoostMana",
			color = COLOR_DARKPURPLE,
			amount = 250
		},
		[5889] = {
			message = "My Master Strengthens Me!",
			effect = "BoostDamage",
			color = COLOR_GREY,
			amount = 5
		}
	},
	
	Spells = {
		-- Passed params: {master = cid, petId = petId, petType = petType}
		["haste"] = {
			SafeName = "Haste",
			AllowedCasters = {2, 3, 1},
			Effect = CONST_ME_MAGIC_GREEN,
			ManaCost = 150,
			Action = function( vars ) 
				doAddCondition(vars.petId, HasteCondition)
			end
		},
		["challenge"] = {
			SafeName = "Challenge",
			AllowedCasters = {2, 1},
			Effect = CONST_ME_MAGIC_GREEN,
			ManaCost = 400,
			Action = function( vars ) 
				local Specs = getSpectators(getThingPosition(vars.petId), 3, 3)
				if #Specs > 0 then
					for _,v in pairs(Specs) do
						if isMonster(v) and v ~= vars.petId then
							doSendMagicEffect(getThingPosition(v), CONST_ME_MAGIC_RED)
							doSendDistanceShoot(getThingPosition(v), getThingPosition(vars.petId), CONST_ANI_SMALLEARTH)
							doChallengeCreature(vars.petId, v)
						end
					end
				end
			end
		},
		["exori"] = {
			SafeName = "Exori",
			AllowedCasters = {3},
			Effect = CONST_ME_STUN,
			ManaCost = 200,
			Action = function( vars ) 
				local min = 50+(petGetDamage(vars.master, vars.petType)*10)+(getCreatureMaxHealth(vars.petId)*0.02)+(getPlayerLevel(vars.master)*0.8)
				local max = 100+(petGetDamage(vars.master, vars.petType)*12)+(getCreatureMaxHealth(vars.petId)*0.02)+(getPlayerLevel(vars.master)*1.2)
				doAreaCombatHealth(vars.petId, COMBAT_PHYSICALDAMAGE, getThingPosition(vars.petId), 2, -min, -max, CONST_ME_HITAREA)
			end
		},
		["flam"] = {
			SafeName = "Exori Flam",
			AllowedCasters = {1, 3},
			Effect = CONST_ME_MAGIC_GREEN,
			ManaCost = 150,
			Action = function( vars ) 
				local target = getCreatureTarget(vars.petId)
				if target == 0 then
					target = getCreatureTarget(vars.master)
				end
				
				if vars.petId == target or not isCreature(target or 0) then
					addEvent(doPlayerSendCancel, 200, vars.master, "You do not have a target for your pet to attack.")
					return true
				end
				
				local min = 50+(petGetDamage(vars.master, vars.petType)*14)+(petGetMana(vars.master, vars.petType)*0.02)+(getPlayerLevel(vars.master)*1.3)
				local max = 120+(petGetDamage(vars.master, vars.petType)*14)+(petGetMana(vars.master, vars.petType)*0.02)+(getPlayerLevel(vars.master)*1.5)
				doSendDistanceShoot(getCreaturePosition(vars.petId), getCreaturePosition(target), CONST_ANI_FIRE)
				doTargetCombatHealth(vars.petId, target, COMBAT_FIREDAMAGE, -min, -max, CONST_ME_FIREATTACK)
			end
		},
		["frigo"] = {
			SafeName = "Exori Frigo",
			AllowedCasters = {2},
			Effect = CONST_ME_MAGIC_GREEN,
			ManaCost = 200,
			Action = function( vars ) 
				local target = getCreatureTarget(vars.petId)
				if target == 0 then
					target = getCreatureTarget(vars.master)
				end
				
				if vars.petId == target or not isCreature(target or 0) then
					addEvent(doPlayerSendCancel, 200, vars.master, "You do not have a target for your pet to attack.")
					return true
				end
				
				local min = 50+(petGetDamage(vars.master, vars.petType)*14)+(petGetMana(vars.master, vars.petType)*0.02)+(getPlayerLevel(vars.master)*1.3)
				local max = 120+(petGetDamage(vars.master, vars.petType)*14)+(petGetMana(vars.master, vars.petType)*0.02)+(getPlayerLevel(vars.master)*1.5)
				doSendDistanceShoot(getCreaturePosition(vars.petId), getCreaturePosition(target), CONST_ANI_ICE)
				doTargetCombatHealth(vars.petId, target, COMBAT_ICEDAMAGE, -min, -max, CONST_ME_ICETORNADO)
			end
		},
		["exura"] = {
			SafeName = "Exura",
			AllowedCasters = {1, 2, 3},
			Effect = CONST_ME_MAGIC_GREEN,
			ManaCost = 0,
			Action = function( vars ) 
				local ManaPercent = petGetMana(vars.master, vars.petType) / petGetMaxMana(vars.master, vars.petType)
				if ManaPercent > 0.1 then
					petSetMana(vars.master, vars.petType, petGetMana(vars.master, vars.petType)-(petGetMaxMana(vars.master, vars.petType)*0.1))
					if vars.petType == 1 then
						doCreatureAddHealth(vars.petId, getCreatureMaxHealth(vars.petId)*0.1)
					else
						doCreatureAddHealth(vars.petId, getCreatureMaxHealth(vars.petId)*0.5)
					end
				else
					doPlayerSendCancel(vars.master, "You need atleast 10% mana to cast this spell.")
				end
			end
		},
	}
}

-- Equipment Start
function petEquipItem(cid, petType, item)
	if not isPlayer(cid) then return false end
	local petId = petGetId(cid)
	if not isCreature(petId) then return false end
	
	local EquipList, hasEquipped = petGetEquipment(cid, petType), false
	for k,v in pairs(EquipList) do
		if v == 0 then
			doCreatureSetStorage(cid, Pet[petType].StorageInventory+(k-1), item)
			hasEquipped = true
			break
		end
	end
	
	if hasEquipped == false then
		return false
	end
	
	if Pet.Items[item].message ~= nil then
		doCreatureSay(petId, Pet.Items[item].message)
	end
	
	-- Display the animated text boost
	doSendAnimatedText(getThingPosition(petId), "+" .. Pet.Items[item].amount, Pet.Items[item].color)
	
	-- Recalculate all stats for pet.
	petRecalculate(cid, petType, petId)
	return true
end

function petRecalculate(cid, petType, petId)
	local hp,mp,dmg = 0,0,0
	local Equipment = petGetEquipment(cid, petType)
	for k,v in pairs(Equipment) do
		if v ~= 0 then
			if Pet.Items[v].effect == "BoostHealth" then
				hp = hp + Pet.Items[v].amount
			elseif Pet.Items[v].effect == "BoostMana" then
				mp = mp + Pet.Items[v].amount
			elseif Pet.Items[v].effect == "BoostDamage" then
				dmg = dmg + Pet.Items[v].amount
			end
		end
	end
	
	-- Set the health
	setCreatureMaxHealth(petId, petGetHealthDefault(cid, petType) + hp)
	doCreatureAddHealth(petId, getCreatureMaxHealth(petId)-getCreatureHealth(petId))
	
	-- Set the mana
	 petSetMaxMana(cid, petType, petGetManaDefault(cid, petType) + mp)
	 
	-- Set the damage
	petSetDamage(cid, petType, dmg)
	return true
end

function petGetEquipment(cid, petType)
	if not isPlayer(cid) then return {} end
	local tmp = {}
	
	for i=0, 3 do 
		local item = getCreatureStorage(cid, Pet[petType].StorageInventory+i) or 0
		if item < 0 then item = 0 end
		table.insert(tmp, item)
	end
	
	return tmp
end

function petGetEquipmentCount(cid, petType)
	if not isPlayer(cid) then return {} end
	local tmp,count = petGetEquipment(cid, petType),0

	for _,v in pairs(tmp) do
		if v ~= 0 then
			count = count+1
		end
	end
	
	return count
end
-- Equipment End

-- Returns pet type (wizard or knight)
function petGetType(cid)
	local tmpCid = 0
	local SummonList = getCreatureSummons(cid)
	for k,v in pairs(SummonList) do
		if getCreatureName(v) == Pet[1].name or getCreatureName(v) == Pet[2].name then
			tmpCid = v
		end
	end
	if tmpCid <= 0 then
		return 0
	end
	
	local Pet = tmpCid

	local petId = 0
	if getCreatureName(Pet) == "Wizard Guardian" then
		petId = 1
	elseif getCreatureName(Pet) == "Puppet" then
		petId = 2
	elseif getCreatureName(Pet) == "Dragon Hatchling" then
		petId = 3
	end
	
	return petId
end

function petGetMaxMana(cid, petType)
	if not isPlayer(cid) then return 0 end
	return getCreatureStorage(cid, Pet[petType].StorageMaxMana)
end

function petSetMaxMana(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	if value < 0 then return false end
	return doCreatureSetStorage(cid, Pet[petType].StorageMaxMana, value)
end

function petGetMana(cid, petType)
	if not isPlayer(cid) then return 0 end
	return getCreatureStorage(cid, Pet[petType].StorageMana) or 0
end

function petSetMana(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	if value < 0 then return false end
	return doCreatureSetStorage(cid, Pet[petType].StorageMana, value)
end

function petAddMana(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	
	if value <= 0 then return false end
	local mana = petGetMana(cid, petType)+value
	local maxmana = petGetMaxMana(cid, petType)
	if mana > maxmana then
		mana = maxmana
	end

	return doCreatureSetStorage(cid, Pet[petType].StorageMana, mana)
end

function petRemoveMana(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	if value <= 0 then return false end
	return doCreatureSetStorage(cid, Pet[petType].StorageMana, petGetMana(cid, petType)-value)
end

function petSetManaDefault(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	if value < 0 then return false end
	return doCreatureSetStorage(cid, Pet[petType].StorageManaDefault, value)
end

function petGetManaDefault(cid, petType)
	if not isPlayer(cid) then return 0 end
	return getCreatureStorage(cid, Pet[petType].StorageManaDefault)
end

function petGetHealthDefault(cid, petType)
	if not isPlayer(cid) then return 0 end
	return getCreatureStorage(cid, Pet[petType].StorageHealthDefault)
end

function petSetHealthDefault(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	if value <= 0 then return false end
	return doCreatureSetStorage(cid, Pet[petType].StorageHealthDefault, value)
end
-- Returns Pet creature id
function petGetId(cid)
	local SummonList = getCreatureSummons(cid)
	if #SummonList == 0 then
		return 0
	end
	
	return SummonList[1]
end

-- Damage Functions Start
function petGetDamage(cid, petType)
	if not isPlayer(cid) then return 0 end
	return getCreatureStorage(cid, Pet[petType].StorageDamageBonus)
end

function petSetDamage(cid, petType, value)
	if not isPlayer(cid) then return 0 end
	if value < 0 then return false end
	return doCreatureSetStorage(cid, Pet[petType].StorageDamageBonus, value)
end
-- Damage Functions End

-- Exhaust Functions Start
function petGetExhaust(cid)
	if not isPlayer(cid) then return false end
	return getCreatureStorage(cid, Pet.LastAttack)
end

function petSetExhaust(cid, value)
	if not isPlayer(cid) then return false end
	if value < 0 then return false end
	return doCreatureSetStorage(cid, Pet.LastAttack, value)
end
-- Exhaust Functions End