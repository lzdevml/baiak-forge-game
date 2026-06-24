 local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

dream     = 23042

local action = {}
local weapon = {}
local weapon_sub = {}

local Config = {
	Create = {
		Clusters = 20,
		DreamMatter = 1,
		Chance = 70 --70%
	},
	Improve = {
		Clusters = 75,
		Chance = 55, --55%
		BreakChance = 30 --30% of chance that when failing the improvement, the weapons is destroyed but you keep the clusters. Else, you keep the weapon and lose the clusters
	},
	Transform = {
		Clusters = 150,
		Chance = 45, --45%
		BreakChance = 40 --50% of chance that when failing the transforming, the weapon is destroyed but you keep all the clusters. Else, the weapon is downgraded to crude piece and you lose half of clusters.
	}
}

local IDS = {
	DREAM_MATTER = 13353,
	CLUSTER_OF_SOLACE = 13353,

	--weapons
	CRUDE_UMBRAL_BLADE = 13049,
	UMBRAL_BLADE = 13050,
	UMBRAL_MASTER_BLADE = 13051,

	CRUDE_UMBRAL_SLAYER = 13052,
	UMBRAL_SLAYER = 13053,
	UMBRAL_MASTER_SLAYER = 13054,

	CRUDE_UMBRAL_AXE = 13055,
	UMBRAL_AXE = 13056,
	UMBRAL_MASTER_AXE = 13057,

	CRUDE_UMBRAL_CHOPPER = 13058,
	UMBRAL_CHOPPER = 13059,
	UMBRAL_MASTER_CHOPPER = 13060,

	CRUDE_UMBRAL_MACE = 13061,
	UMBRAL_MACE = 13062,
	UMBRAL_MASTER_MACE = 13063,

	CRUDE_UMBRAL_HAMMER = 13064,
	UMBRAL_HAMMER = 13065,
	UMBRAL_MASTER_HAMMER = 13066,

	CRUDE_UMBRAL_BOW = 13067,
	UMBRAL_BOW = 13068,
	UMBRAL_MASTER_BOW = 13069,

	CRUDE_UMBRAL_CROSSBOW = 13070,
	UMBRAL_CROSSBOW = 13071,
	UMBRAL_MASTER_CROSSBOW = 13072,

	CRUDE_UMBRAL_SPELLBOOK = 13073,
	UMBRAL_SPELLBOOK = 13074,
	UMBRAL_MASTER_SPELLBOOK = 13075
}

local TYPES = {
	SWORD = 1,
	AXE = 2,
	CLUB = 3,
	BOW = 4,
	CROSSBOW = 5,
	SPELLBOOK = 6
}

local SUB_TYPES = {
	BLADE = 1,
	SLAYER = 2,
	AXE = 3,
	CHOPPER = 4,
	MACE = 5,
	HAMMER = 6,
	BOW = 7,
	CROSSBOW = 8,
	SPELLBOOK = 9
}

local ACTION = {
	CREATE = 1,
	IMPROVE = 2,
	TRANSFORM = 3
}

	 -- dream START --


function dreamFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
	    addon = getPlayerStorageValue(cid,dream)
	    if addon == -1 then
	        if getPlayerItemCount(cid,22610) >= 1 then
		        if doPlayerRemoveItem(cid,22610,1) then
		            selfSay(newaddon, cid)

		            doSendMagicEffect(getCreaturePosition(cid), 13)
		            if getPlayerStorageValue(cid, 79007) == 2 then
		            	setPlayerStorageValue(cid, 79007, 3)
		            else
		            	setPlayerStorageValue(cid, 79007, 1)
		            end
		            --doPlayerAddOutfit(cid, 577, 1)
		            --doPlayerAddOutfit(cid, 578, 1)
		            setPlayerStorageValue(cid,dream,1)
		        end
	        else
	            selfSay(noitems, cid)
	        end
	    else
	        selfSay(already, cid)
	    end
    end

end

function dreamSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,dream+1)
    if addon == -1 then
        if getPlayerItemCount(cid,22609) >= 1 then
        if doPlayerRemoveItem(cid,22609,1) then
            selfSay(newaddon, cid)

            doSendMagicEffect(getCreaturePosition(cid), 13)
            if getPlayerStorageValue(cid, 79007) == 1 then
            	setPlayerStorageValue(cid, 79007, 3)
            else
            	setPlayerStorageValue(cid, 79007, 2)
            end
           --doPlayerAddOutfit(cid, 577, 2)
            --doPlayerAddOutfit(cid, 578, 2)
            setPlayerStorageValue(cid,dream+1,1)
        end
        else
            selfSay(noitems, cid)
        end
    else
        selfSay(already, cid)
    end
    end

end
-- dream END --

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.EruaranGreeting) > 0 then
		npcHandler:setMessage(MESSAGE_GREET, translate(cid, {
			"Ashari Lillithy, então nos encotramos novamente! O que te trouxe aqui agora, nós podemos {criar}, {melhorar} ou {transformar} alguns itens... Bom, talvez você esteja interessado em um {outfit}??",
			"Ashari Lillithy, so we meet again! What brings you here this time, I can {create}, {improve} and {transform} some items... Maybe you want some {outfit}??"
		}))
	else
		npcHandler:setMessage(MESSAGE_GREET, translate(cid, {
			'Bem vindo |PLAYERNAME|. O que te trás aqui?? Eu posso {criar}, {melhorar} e {transformar} alguns itens... Bom, talvez você esteja interessado em um {outfit}??',
			'Welcome |PLAYERNAME|. What brings you here?? I can {create}, {improve} and {transform} some items... Maybe you want some {outfit}?'	
		}))
		player:setStorageValue(Storage.EruaranGreeting, 1)
	end
	return true
end
local topic = {}
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "create") or msgcontains(msg, "criar") then
		npcHandler:say(translate(cid, {"Nós podemos tentar criar {swords}, {axes}, {clubs}, {bows}, {crossbows} e {spellbooks}.", "You can try to create {swords}, {axes}, {clubs}, {bows}, {crossbows} and {spellbooks}."}), cid)
		topic[cid] = 1
		action[cid] = ACTION.CREATE
	elseif msgcontains(msg, "improve") or msgcontains(msg, "melhorar") then
		npcHandler:say(translate(cid, {
			"Itens em sua versão crude não chegam nem perto da força que podem possuir.. Por mais arriscado e imprevisivel que seja, melhora-los aumentará muito os seus poderes. Você pode tentar melhorar {swords}, {axes}, {clubs}, {bows}, {crossbows} and {spellbooks}.",
			"The raw object is nothing but a pale of shadow of its potential. As unsafe and unpredictable the imporvement is, it might boot the powers of your item immensely. You can try to improve {sword}s, {axe}s, {club}s, {bow}s, {crossbow}s and {spellbook}s."}), cid)
		topic[cid] = 1
		action[cid] = ACTION.IMPROVE
	elseif msgcontains(msg, "transform") then
		npcHandler:say(translate(cid,{
			"De tempos em tempos, o destino sorri para aqueles que assumem grandes riscos e têm grandes sonhos! Se você possuir os ingredientes, podemos tentar dar o melhor refinamento à {swords}, {axes}, {clubs}, {bows}, {crossbows} and {spellbooks}.",
			"From time to time fate smiles upon those who take great risks and have strong dreams! If you have the ingredients, we can try to give the ultimate refinement to {swords}, {axes}, {clubs}, {bows}, {crossbows} and {spellbooks}."}), cid)
		topic[cid] = 1
		action[cid] = ACTION.TRANSFORM
	elseif msgcontains(msg, "sword") and topic[cid] == 1 then
		weapon[cid] = TYPES.SWORD
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {"Você gostaria de criar uma crude umbral {blade} ou uma crude umbral {slayer}?","Do you want to create a crude umbral {blade} or crude umbral {slayer}?"}), cid)
			topic[cid] = 2
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {"Você quer melhorar uma crude umbral {blade} ou uma crude umbral {slayer}?", "Do you want to improve a crude umbral {blade} or crude umbral {slayer}?"}), cid)
			topic[cid] = 2
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {"Você quer transformar uma umbral {blade} ou uma umbral {slayer}?", "Do you want to transform an umbral {blade} or umbral {slayer}?"}), cid)
			topic[cid] = 2
		end
	elseif msgcontains(msg, "blade") or msgcontains(msg, "slayer") and topic[cid] == 2 then
		weapon_sub[cid] = (msgcontains(msg, "blade") and SUB_TYPES.BLADE or SUB_TYPES.SLAYER)
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {
				"Você deseja arriscar " .. (Config.Create.DreamMatter == 1 and "seu" or Config.Create.DreamMatter) .. " {dream matter} com " .. (Config.Create.Clusters > 1 and "suas" or "sua") .. " " .. Config.Create.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} ou {não}",
				"Do you want to spend " .. (Config.Create.DreamMatter == 1 and "your" or Config.Create.DreamMatter) .. " {dream matter} with " .. (Config.Create.Clusters > 1 and "those" or "your") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {
				"Você deseja arriscar sua crude umbral " .. (weapon_sub[cid] == SUB_TYPES.BLADE and "blade" or "slayer") .. " com " .. (Config.Improve.Clusters > 1 and "suas" or "sua") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} ou {não}", 
				"Do you want to spend your crude umbral " .. (weapon_sub[cid] == SUB_TYPES.BLADE and "blade" or "slayer") .. " with " .. (Config.Improve.Clusters > 1 and "those" or "your") .. " " .. Config.Improve.Clusters .. "x clusters of {solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {
				"Você deseja arriscar sua umbral " .. (weapon_sub[cid] == SUB_TYPES.BLADE and "blade" or "slayer") .. " com " .. (Config.Transform.Clusters > 1 and "suas" or "sua") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} ou {não}?",
				"Do you want to spend your umbral " .. (weapon_sub[cid] == SUB_TYPES.BLADE and "blade" or "slayer") .. " with " .. (Config.Transform.Clusters > 1 and "those" or "your") .. " " .. Config.Transform.Clusters .. "x clusters of {solace} and give it a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		end
	elseif msgcontains(msg, "axe") and topic[cid] == 1 then
		weapon[cid] = TYPES.AXE
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {"Você deseja criar um crude umbral {axe}, ou um crude umbral {chopper}?", "Do you want to create a crude umbral {axe} or crude umbral {chopper}?"}), cid)
			topic[cid] = 2
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {"Você deseja melhorar um crude umbral {axe} ou um crude umbral {chopper}?","Do you want to improve a crude umbral {axe} or crude umbral {chopper}?"}), cid)
			topic[cid] = 2
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {"Você deseja transformar um umbral {axe} ou um umbral {chopper}?", "Do you want to transform an umbral {axe} or umbral {chopper}?"}), cid)
			topic[cid] = 2
		end
	elseif msgcontains(msg, "axe") or msgcontains(msg, "chopper") and topic[cid] == 2 then
		weapon_sub[cid] = (msgcontains(msg, "axe") and SUB_TYPES.AXE or SUB_TYPES.CHOPPER)
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {"Você deseja arriscar 1x {dream matter} e 25x {clusters of solace} e tentar a sorte? {Sim} ou {não}?", "Do you want to spend your dream matter with those 25 clusters of {solace} and give a shot. {Yes} or {no}"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu crude umbral " .. (weapon_sub[cid] == SUB_TYPES.AXE and "axe" or "chopper") .. " com " .. (Config.Improve.Clusters > 1 and "suas" or "sua") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} ou {não}?",
				"Do you want to spend your crude umbral " .. (weapon_sub[cid] == SUB_TYPES.AXE and "axe" or "chopper") .. " with " .. (Config.Improve.Clusters > 1 and "those" or "your") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate({
				"Você quer arriscar seu umbral " .. (weapon_sub[cid] == SUB_TYPES.AXE and "axe" or "chopper") .. " com " .. (Config.Transform.Clusters > 1 and "suas" or "your") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} or {não}?",
				"Do you want to spend your umbral " .. (weapon_sub[cid] == SUB_TYPES.AXE and "axe" or "chopper") .. " with " .. (Config.Transform.Clusters > 1 and "those" or "your") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give it a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		end
	elseif msgcontains(msg, "club") and topic[cid] == 1 then
		weapon[cid] = TYPES.CLUB
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {"Você deseja criar um crude umbral {mace} ou um crude umbral {hammer}?","Do you want to create a crude umbral {mace} or crude umbral {hammer}?"}), cid)
			topic[cid] = 2
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {"Você deseja melhorar um crude umbral {mace} ou um crude umbral {hammer}?","Do you want to improve a crude umbral {mace} or crude umbral {hammer}?"}), cid)
			topic[cid] = 2
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {"Você deseja transformar um umbral {mace} ou um umbral {hammer}","Do you want to transform an umbral {mace} or umbral {hammer}?"}), cid)
			topic[cid] = 2
		end
	elseif isInArray({"mace", "hammer"}, msg) and topic[cid] == 2 then
		weapon_sub[cid] = (msgcontains(msg, "mace") and SUB_TYPES.MACE or SUB_TYPES.HAMMER)
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar 1x {dream matter} com " .. (Config.Create.Clusters > 1 and "suas" or "sua") .. " " .. Config.Create.Clusters .. "x {clusters of solace} e tentar a sorte. {Sim} ou {não}",
				"Do you want to spend your dream matter with " .. (Config.Create.Clusters > 1 and "those" or "your") .. " " .. Config.Create.Clusters .. " clusters of {solace} and give a shot. {Yes} or {no}"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu crude umbral " .. (weapon_sub[cid] == SUB_TYPES.MACE and "mace" or "hammer") .. " com " .. (Config.Improve.Clusters > 1 and "sua" or "suas") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} ou {não}?",
				"Do you want to spend your crude umbral " .. (weapon_sub[cid] == SUB_TYPES.MACE and "mace" or "hammer") .. " with " .. (Config.Improve.Clusters > 1 and "those" or "your") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu umbral " .. (weapon_sub[cid] == SUB_TYPES.MACE and "mace" or "hammer") .. " com " .. (Config.Transform.Clusters > 1 and "sua" or "suas") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} e tentar a sorte? {Sim} ou {não}?",
				"Do you want to spend your umbral " .. (weapon_sub[cid] == SUB_TYPES.MACE and "mace" or "hammer") .. " with " .. (Config.Transform.Clusters > 1 and "those" or "your") .. " " .. Config.Transform.Clusters .. " clusters of {solace} and give it a shot. {Yes} or {no}?"}), cid)
			topic[cid] = 3
		end
	elseif msgcontains(msg, "bow") and topic[cid] == 1 then
		weapon[cid] = TYPES.BOW
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu dream matter com " .. (Config.Create.Clusters > 1 and "sua" or "suas") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your dream matter with " .. (Config.Create.Clusters > 1 and "those" or "your") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu crude umbral bow com " .. (Config.Improve.Clusters > 1 and "sua" or "suas") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your crude umbral bow with " .. (Config.Improve.Clusters > 1 and "those" or "your") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu umbral bow com " .. (Config.Transform.Clusters > 1 and "sua" or "suas") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your umbral bow with " .. (Config.Transform.Clusters > 1 and "those" or "your") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		end
	elseif msgcontains(msg, "crossbow") and topic[cid] == 1 then
		weapon[cid] = TYPES.CROSSBOW
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar 1x dream matter com " .. (Config.Create.Clusters > 1 and "sua" or "suas") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your dream matter with " .. (Config.Create.Clusters > 1 and "those" or "your") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu crude umbral crossbow com " .. (Config.Improve.Clusters > 1 and "sua" or "suas") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your crude umbral crossbow with " .. (Config.Improve.Clusters > 1 and "those" or "your") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu umbral crossbow com " .. (Config.Transform.Clusters > 1 and "sua" or "suas") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your umbral crossbow with " .. (Config.Transform.Clusters > 1 and "those" or "your") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		end
	elseif msgcontains(msg, "spellbook") and topic[cid] == 1 then
		weapon[cid] = TYPES.SPELLBOOK
		if action[cid] == ACTION.CREATE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar 1x {dream matter} com " .. (Config.Create.Clusters > 1 and "sua" or "suas") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your dream matter with " .. (Config.Create.Clusters > 1 and "those" or "your") .. " " .. Config.Create.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.IMPROVE then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu crude umbral spellbook com " .. (Config.Improve.Clusters > 1 and "sua" or "suas") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your crude umbral spellbook with " .. (Config.Improve.Clusters > 1 and "those" or "your") .. " " .. Config.Improve.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		elseif action[cid] == ACTION.TRANSFORM then
			npcHandler:say(translate(cid, {
				"Você quer arriscar seu umbral spellbook com " .. (Config.Transform.Clusters > 1 and "sua" or "suas") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?",
				"Do you want to spend your umbral spellbook with " .. (Config.Transform.Clusters > 1 and "those" or "your") .. " " .. Config.Transform.Clusters .. "x {clusters of solace} and give a shot? {Yes} or {no}?"}), cid)
			topic[cid] = 3
		end
	elseif (msgcontains(msg, "yes") or msgcontains(msg, "sim")) and topic[cid] == 3 then

		if action[cid] == ACTION.CREATE then --create
			if player:getItemCount(IDS.DREAM_MATTER) >= 1 and player:getItemCount(IDS.CLUSTER_OF_SOLACE) >= Config.Create.Clusters then
				if math.random(100) <= Config.Create.Chance then
					local newItemId = (weapon[cid] == TYPES.SWORD and (weapon_sub[cid] == SUB_TYPES.BLADE and IDS.CRUDE_UMBRAL_BLADE or IDS.CRUDE_UMBRAL_SLAYER) or weapon[cid] == TYPES.AXE and (weapon_sub[cid] == SUB_TYPES.AXE and IDS.CRUDE_UMBRAL_AXE or IDS.CRUDE_UMBRAL_CHOPPER) or weapon[cid] == TYPES.CLUB and (weapon_sub[cid] == SUB_TYPES.MACE and IDS.CRUDE_UMBRAL_MACE or IDS.CRUDE_UMBRAL_HAMMER) or weapon[cid] == TYPES.BOW and IDS.CRUDE_UMBRAL_BOW or weapon[cid] == TYPES.CROSSBOW and IDS.CRUDE_UMBRAL_CROSSBOW or weapon[cid] == TYPES.SPELLBOOK and IDS.CRUDE_UMBRAL_SPELLBOOK or false)
					if newItemId then
						player:addItem(newItemId)
						player:removeItem(IDS.DREAM_MATTER, Config.Create.DreamMatter)
						player:removeItem(IDS.CLUSTER_OF_SOLACE, Config.Create.Clusters)
						npcHandler:say(translate(cid, {"Seus sonhos são poderosos, a criação foi um sucesso. Aqui está o seu " .. getItemNameById(newItemId) .. ".","Your dreams are strong, the creation was successful. Take your " .. getItemNameById(newItemId) .. "."}), cid)
					else
						npcHandler:say("Something weird happened! You should contact a gamemaster.", cid)
					end
				else
					npcHandler:say(translate(cid, {"Oh não! A criação falhou!", "Oh no! The process failed."}), cid)
					player:removeItem(IDS.DREAM_MATTER, 1)
				end
			else
				npcHandler:say(translate(cid, {"Desculpe, mas você não possui os itens necessários", "Sorry, you don't have the required ingredients."}), cid)
			end
		elseif action[cid] == ACTION.IMPROVE then --improve
			local oldItemId = (weapon[cid] == TYPES.SWORD and (weapon_sub[cid] == SUB_TYPES.BLADE and IDS.CRUDE_UMBRAL_BLADE or IDS.CRUDE_UMBRAL_SLAYER) or weapon[cid] == TYPES.AXE and (weapon_sub[cid] == SUB_TYPES.AXE and IDS.CRUDE_UMBRAL_AXE or IDS.CRUDE_UMBRAL_CHOPPER) or weapon[cid] == TYPES.CLUB and (weapon_sub[cid] == SUB_TYPES.MACE and IDS.CRUDE_UMBRAL_MACE or IDS.CRUDE_UMBRAL_HAMMER) or weapon[cid] == TYPES.BOW and IDS.CRUDE_UMBRAL_BOW or weapon[cid] == TYPES.CROSSBOW and IDS.CRUDE_UMBRAL_CROSSBOW or weapon[cid] == TYPES.SPELLBOOK and IDS.CRUDE_UMBRAL_SPELLBOOK or false)
			local newItemId = (oldItemId and oldItemId + 1 or false)
			if player:getItemCount(IDS.CLUSTER_OF_SOLACE) >= Config.Improve.Clusters then
				if newItemId and oldItemId then
					if player:getItemCount(oldItemId) > 0 then
						if math.random(100) <= Config.Improve.Chance then
							player:removeItem(oldItemId, 1)
							player:addItem(newItemId)
							player:removeItem(IDS.CLUSTER_OF_SOLACE, Config.Improve.Clusters)
							npcHandler:say(translate(cid, {"Seus sonhos são poderosos, a melhoria foi um sucesso. Aqui está o seu " .. getItemNameById(newItemId) .. ".","Your dreams are strong, the improvement was successful. Take your " .. getItemNameById(newItemId) .. "."}), cid)
						else
							npcHandler:say(translate(cid, {"Oh não! A melhoria falhou!", "Oh no! The process failed."}), cid)
							local rand = math.random(100)
							player:removeItem((rand <= Config.Improve.BreakChance and oldItemId or IDS.CLUSTER_OF_SOLACE), (rand <= Config.Improve.BreakChance and 1 or Config.Improve.Clusters))
						end
					else
						npcHandler:say(translate(cid, {"Você não possui um " .. getItemNameById(oldItemId) .. " com você.","You do not have a " .. getItemNameById(oldItemId) .. " with you."}), cid)
					end
				else
					npcHandler:say("Something weird happened! You should contact a gamemaster.", cid)
				end
			else
				npcHandler:say(translate(cid, {"Desculpe, mas você não possui os itens necessários", "Sorry, you don't have the required ingredients."}), cid)
			end
		elseif action[cid] == ACTION.TRANSFORM then --transform
			local oldItemId = (weapon[cid] == TYPES.SWORD and (weapon_sub[cid] == SUB_TYPES.BLADE and IDS.UMBRAL_BLADE or IDS.UMBRAL_SLAYER) or weapon[cid] == TYPES.AXE and (weapon_sub[cid] == SUB_TYPES.AXE and IDS.UMBRAL_AXE or IDS.UMBRAL_CHOPPER) or weapon[cid] == TYPES.CLUB and (weapon_sub[cid] == SUB_TYPES.MACE and IDS.UMBRAL_MACE or IDS.UMBRAL_HAMMER) or weapon[cid] == TYPES.BOW and IDS.UMBRAL_BOW or weapon[cid] == TYPES.CROSSBOW and IDS.UMBRAL_CROSSBOW or weapon[cid] == TYPES.SPELLBOOK and IDS.UMBRAL_SPELLBOOK or false)
			local newItemId =  (oldItemId and oldItemId + 1 or false)
			if player:getItemCount(IDS.CLUSTER_OF_SOLACE) >= Config.Transform.Clusters then
				if newItemId and oldItemId then
					if player:getItemCount(oldItemId) > 0 then
						if math.random(100) <= Config.Transform.Chance then
							player:removeItem(oldItemId, 1)
							player:addItem(newItemId)
							player:removeItem(IDS.CLUSTER_OF_SOLACE, Config.Transform.Clusters)
							npcHandler:say(translate(cid, {"Seus sonhos são poderosos, a transformação foi um sucesso! Aqui está o seu " .. getItemNameById(newItemId) .. ".","Your dreams are strong, the transforming was successful. Take your " .. getItemNameById(newItemId) .. "."}), cid)
						else
							npcHandler:say(translate(cid, {"Oh não! A transformação falhou!", "Oh no! The process failed."}), cid)
							local rand = math.random(100)
							if Config.Transform.BreakChance <= rand then
								player:removeItem(oldItemId, 1)
							else
								player:removeItem(oldItemId, 1)
								player:addItem(oldItemId - 1, 1)
								player:removeItem(IDS.CLUSTER_OF_SOLACE, Config.Transform.Clusters / 2)
							end
						end
					else
						npcHandler:say(translate(cid, {"Você não possui um " .. getItemNameById(oldItemId) .. " com você.","You do not have a " .. getItemNameById(oldItemId) .. " with you."}), cid)
					end
				else
					npcHandler:say("Something weird happened! You should contact a gamemaster.", cid)
				end
			else
				npcHandler:say(translate(cid, {"Desculpe, mas você não possui os itens necessários", "Sorry, you don't have the required ingredients."}), cid)
			end
		end
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc()
	end
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye!")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

   -- node1 = keywordHandler:addKeyword({'outfit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'What addon you are looking? I need for first addon: {Dream Warden Claw} and for second {Dream Warden Mask}.'})
   -- node1:addChildKeyword({'yes'}, YalaharianSecond, {})
   -- node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})
keywordHandler:addKeyword({'outfit'}, StdModule.say, {npcHandler = npcHandler, text = 'What addon you are looking? I need for first addon: {Dream Warden Claw} and for second {Dream Warden Mask}.'})


	node1 = keywordHandler:addKeyword({'dream warden mask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the first Dream addon you need to give me 1 Dream Warden Claw. Do you have them with you?'})
    node1:addChildKeyword({'yes'}, dreamFirst, {})
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

	node2 = keywordHandler:addKeyword({'dream warden claw'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To achieve the second Dream addon you need to give me 1 Dream Warden Mask. Do you have them with you?'})
    node2:addChildKeyword({'yes'}, dreamSecond, {})
    node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



local focusModule = FocusModule:new()
npcHandler:addModule(focusModule)
