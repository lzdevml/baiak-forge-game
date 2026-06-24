skillConfig = {skill = getConfigValue('rateSkill'), magiclevel = getConfigValue('rateMagic')}
skillStages = {}
skillStages[SKILL_FIST] = {{0,20},{60,8},{90,4},{100,2},{120,1}}
skillStages[SKILL_CLUB] = {{0,15},{60,5},{90,2},{120,1}}
skillStages[SKILL_SWORD] = {{0,15},{60,5},{90,2},{120,1}}
skillStages[SKILL_AXE] = {{0,15},{60,5},{90,2},{120,1}}
skillStages[SKILL_DISTANCE] = {{0,17},{60,7},{90,4},{100,2},{120,1}}
skillStages[SKILL_SHIELD] = {{0,15},{60,5},{90,2},{120,1}}
--skillStages[SKILL_FISHING] = {{0,5},{60,4},{80,3},{100,2},{110,1}} -- voce pode retirar os -- desse script para ativar, por padrao esta desativado
skillStages[SKILL__MAGLEVEL] = {{0,10},{6,7},{15,4},{80,2},{90,1}}
showInfoOnAdvance = true -- envia uma nova mensagem com a sua nova rate
showInfoOnLogin = true -- envia mensagem da rate ao jogador ao logar

function getPlayerSkillRatesText(cid)
local skillInfo = getPlayerRates(cid)
return "YOUR RATES: [ Magic Level: " .. skillInfo[SKILL__MAGLEVEL] * skillConfig.magiclevel .. "x || Fist: " .. skillInfo[SKILL_FIST] * skillConfig.skill .. "x | Club: " .. skillInfo[SKILL_CLUB] * skillConfig.skill .. "x |  Sword: " .. skillInfo[SKILL_SWORD] * skillConfig.skill .. "x | Axe: " .. skillInfo[SKILL_AXE] * skillConfig.skill .. "x |  Distance: " .. skillInfo[SKILL_DISTANCE] * skillConfig.skill .. " | Shielding: " .. skillInfo[SKILL_SHIELD] * skillConfig.skill .. "x | Fishing: " .. skillInfo[SKILL_FISHING] * skillConfig.skill .. "x ]"
end