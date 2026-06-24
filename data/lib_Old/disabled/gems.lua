--[[
    Gems System By Maxwell Denisson(MaXwEllDeN)
    V 1.0
    --]]

function getPrefixGEMs(val) -- By MaXwEllDeN
   return (val > 1) and "s" or ""
end

pedras_add = {

      [2156] = { -- Pedra Vermelha
              skills = {
                     [0] = 3, -- Fist Fighting
                     [1] = 3, -- Club Fighting
                     [2] = 3, -- Sword Fighting
                     [3] = 3, -- Axe Fighting
                     [4] = 3, -- Distance Fighting
                     [5] = 3, -- Shielding
                     [6] = 3, -- Magic Level
              },
              xp = 2, -- Ex, 2 x o Xp do serv
              time = 120,
              color = {180, 181, 186},
              },
      [2153] = { -- Pedra Rosa
              skills = {
                     [0] = 6, -- Fist Fighting
                     [1] = 6, -- Club Fighting
                     [2] = 6, -- Sword Fighting
                     [3] = 6, -- Axe Fighting
                     [4] = 6, -- Distance Fighting
                     [5] = 6, -- Shielding
                     [6] = 6, -- Magic Level
              },
              xp = 2, -- Ex, 2 x o Xp do serv
              time = 120,
              color = {183, 184, 185},
              },
      [2154] = { -- Pedra Amarela
              skills = {
                     [0] = 9, -- Fist Fighting
                     [1] = 9, -- Club Fighting
                     [2] = 9, -- Sword Fighting
                     [3] = 9, -- Axe Fighting
                     [4] = 9, -- Distance Fighting
                     [5] = 9, -- Shielding
                     [6] = 9, -- Magic Level
              },
              xp = 2, -- Ex, 2 x o Xp do serv
              time = 120,
              color = {210, 212, 211},
              },
      [2155] = { -- Pedra Verde
              skills = {
                     [0] = 12, -- Fist Fighting
                     [1] = 12, -- Club Fighting
                     [2] = 12, -- Sword Fighting
                     [3] = 12, -- Axe Fighting
                     [4] = 12, -- Distance Fighting
                     [5] = 12, -- Shielding
                     [6] = 12, -- Magic Level
              },
              xp = 3, -- Ex, 2 x o Xp do serv
              time = 180,
              color = {26, 30, 31, 32},
              },
			  
		[2158] = { -- Pedra Azul
              skills = {
                     [0] = 16, -- Fist Fighting
                     [1] = 16, -- Club Fighting
                     [2] = 16, -- Sword Fighting
                     [3] = 16, -- Axe Fighting
                     [4] = 16, -- Distance Fighting
                     [5] = 16, -- Shielding
                     [6] = 16, -- Magic Level
              },
              xp = 4, -- Ex, 2 x o Xp do serv
              time = 180,
              color = {5, 89, 95},
              },
			  
	    [2178] = { -- Pedra Preta
              skills = {
                     [0] = 20, -- Fist Fighting
                     [1] = 20, -- Club Fighting
                     [2] = 20, -- Sword Fighting
                     [3] = 20, -- Axe Fighting
                     [4] = 20, -- Distance Fighting
                     [5] = 20, -- Shielding
                     [6] = 20, -- Magic Level
              },
              xp = 5, -- Ex, 2 x o Xp do serv
              time = 180,
              color = {0, 0, 0, 0},
              },
			  
	   [2363] = { -- Pedra Laranja
              skills = {
                     [0] = 25, -- Fist Fighting
                     [1] = 25, -- Club Fighting
                     [2] = 25, -- Sword Fighting
                     [3] = 25, -- Axe Fighting
                     [4] = 25, -- Distance Fighting
                     [5] = 25, -- Shielding
                     [6] = 25, -- Magic Level
              },
              xp = 6, -- Ex, 2 x o Xp do serv
              time = 180,
              color = {58, 77, 96},
              },
}

pedras_add_c = {
             [2156] = createConditionObject(CONDITION_ATTRIBUTES),
             [2153] = createConditionObject(CONDITION_ATTRIBUTES),
             [2154] = createConditionObject(CONDITION_ATTRIBUTES),
             [2155] = createConditionObject(CONDITION_ATTRIBUTES),
             [2158] = createConditionObject(CONDITION_ATTRIBUTES),
             [2178] = createConditionObject(CONDITION_ATTRIBUTES),
             [2363] = createConditionObject(CONDITION_ATTRIBUTES),
}

local conditions = {CONDITION_PARAM_SKILL_FIST, CONDITION_PARAM_SKILL_CLUB, CONDITION_PARAM_SKILL_SWORD,CONDITION_PARAM_SKILL_AXE, CONDITION_PARAM_SKILL_DISTANCE, CONDITION_PARAM_SKILL_SHIELD, CONDITION_PARAM_STAT_MAGICPOINTS}

for a, b in pairs(pedras_add_c) do
   setConditionParam(pedras_add_c[a], CONDITION_PARAM_TICKS, pedras_add[a].time*60*1000)
   for c = 0, 6 do
      setConditionParam(pedras_add_c[a], conditions[c + 1], pedras_add[a].skills[c])
   end
end

function sendGemEffect(uid, itemid)
   if (isCreature(uid)) then
      local pedra = pedras_add[itemid]
      local msgs = {"´ .    ,", ".    ´ ,", "`  .  ,", ",    ` ."}
      if (getPlayerStorageValue(uid, 45783) > 0) then
         addEvent(sendGemEffect, 575, uid, itemid)
         doSendAnimatedText(getThingPos(uid), msgs[math.random(#msgs)], pedra.color[math.random(#pedra.color)])
      end
   end
   return true
end


function isGemActivated(cid)
  return (getPlayerStorageValue(cid, gems.storage[getPlayerVocation(cid)]) > 0) and true or false
end

function checkGemTimeFinish(uid, gemid)
   local timpo = (getPlayerStorageValue(uid, 45783)-os.time())*(-1)
   return (timpo >= pedras_add[gemid].time*60) and true or false
end

function deAtiveGem(uid, gemid)
   local pedra = pedras_add[gemid]
   local skills = pedra.skills

   for a = 0, #skills-1 do
       doPlayerAddSkill(uid, a, -skills[a])
   end

   doRemoveCondition(uid, pedras_add_c[gemid])
   doPlayerSetExperienceRate(uid, 1)
   setPlayerStorageValue(uid, 45783, -1)
   setPlayerStorageValue(uid, 71473, -1)
   doPlayerSendTextMessage(uid, 27, "O efeito da sua gema acabou.")
   return true
end

function AtiveGem(uid, item)
   local pedra = pedras_add[item.itemid]

   if not (pedra) then
      return false
   end

   local skills = pedra.skills
   doAddCondition(uid, pedras_add_c[item.itemid])
   doPlayerSendTextMessage(uid, 27, "Você está sob o efeito da gema mágica, e o efeito dela durará por ".. pedra.time .. " minuto".. getPrefixGEMs(pedra.time) .. ".")
   setPlayerStorageValue(uid, 71473, item.itemid)
   setPlayerStorageValue(uid, 45783, os.time())

   sendGemEffect(uid, item.itemid)
   doPlayerSetExperienceRate(uid, pedra.xp)

   registerCreatureEvent(uid, "EffectCheck")
   doRemoveItem(item.uid, 1)
   return true
end
