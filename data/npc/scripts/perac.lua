local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, "time") then
	   local time = getTibiaTime()
	   npcHandler:say("Claro! Agora são: ".. time.hours ..":".. time.minutes ..".", cid)
	   npcHandler.topic[cid] = 0
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'small stone'}, 1294, 4, 'small stone')
shopModule:addBuyableItem({'spear'}, 2389, 10, 'spear')
shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 'throwing knife')
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 'throwing star')
shopModule:addBuyableItem({'viper star'}, 7366, 50, 'viper star')
shopModule:addBuyableItem({'hunting spear'}, 3965, 25, 'hunting spear')
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 'royal spear')
shopModule:addBuyableItem({'enchanted spear'}, 7367, 100, 'enchanted spear')
shopModule:addBuyableItem({'assassin star'}, 7368, 100, 'assassin star')
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 'crossbow')
shopModule:addBuyableItem({'bow'}, 2456, 400, 'bow')
shopModule:addBuyableItem({'arrow'}, 2544, 3, 'arrow')
shopModule:addBuyableItem({'burst arrow'}, 2546, 13, 'burst arrow')
shopModule:addBuyableItem({'poison arrow'}, 2545, 13, 'poison arrow')
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 'flaming arrow')
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 'earth arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 'flash arrow')
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 'shiver arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 'sniper arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 'onyx arrow')
shopModule:addBuyableItem({'bolt'}, 2543, 4, 'bolt')
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 'piercing bolt')
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 'power bolt')

shopModule:addSellableItem({'crossbow'}, 2455, 120, 'crossbow')
shopModule:addSellableItem({'bow'}, 2456, 100, 'bow')
shopModule:addSellableItem({'spear'}, 2389, 3, 'spear')

npcHandler:setMessage(MESSAGE_GREET, "Bem vindo, |PLAYERNAME|! Esta é minha humilde loja.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até breve.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Eu vendo crossbows(500gps), bows(400gps), arrows(3gps), bolts(4gps), spears(10gps) e outras coisas.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())