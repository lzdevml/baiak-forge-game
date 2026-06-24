local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local reward = {
[1] = {12686,2},
[2] = {12714,1}
}

function onCreatureAppear(cid)	selfTurn(EAST)      npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           		npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)     		    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()	selfTurn(EAST)	         		npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              		npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          		npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "hi") and (not npcHandler:isFocused(cid)) then
		if getPlayerStorageValue(cid, 45399) - os.time() > 0 and getPlayerStorageValue(cid, 45402) - os.time() <= 0 then
			if getGlobalStorageValue(cid, 30076) > 0 then
				local parcel, time = doCreateItemEx(2595), os.time()
				local label, target = doAddContainerItem(parcel, 2599), getCreatureName(cid)

				doItemSetAttribute(label, "text", target .. "\nYurots")
				doItemSetAttribute(label, "date", time)
				doItemSetAttribute(label, "writer", getCreatureName(getNpcId()))

				for _, item in ipairs(reward) do
					if(item == 1) then
						local tmp = doCreateItemEx(item[1])

						doItemSetAttribute(tmp, "text", item[2])
						doItemSetAttribute(tmp, "date", time)
						doItemSetAttribute(tmp, "writer", getCreatureName(getNpcId()))

						doAddContainerItemEx(parcel, tmp)
					else
						doAddContainerItem(parcel, item[1], item[2] or 1)
					end
				end

				if getPlayerFreeCap(cid) > 25.00 then
					if math.random(1, 100) < 20 then
						doPlayerAddItem(cid, 12698, 1)
					end
					
					doPlayerSendMailByName(target, parcel, 1) -- TOWN 1 = YUROTS
					doPlayerAddExp(cid, 100000)
					doPlayerSetBalance(cid, getPlayerBalance(cid) + 100000)
					setPlayerStorageValue(cid, 45402, os.time()+15*60)				
					doPlayerPopupFYI(cid, "                      [+] Blood Castle [+]\n        # Evento Exclusivo do Servidor #\n\nConcluiu o Evento Blood Castle.\n\n\n                      .:: RECOMPENSA ::.\n\nEXP: +100k\nGOLD: +100k (enviado para o banco)\n\n+2 Event Coins\n+1 Holy Icon (1 charge)\n+20% de chance de receber EXP Potion.\n\nTodos os items foram enviados por parcel.\nVá até seu Depot pegar a sua recompensa.")
				else
					doPlayerPopupFYI(cid, "                                                [+] Blood Castle [+]\n                                  #Evento Exclusivo do Servidor#\n\nVocê precisa ter mais que '25.00 oz' (cap) para receber o EXP Potion.\nVocê não recebeu o prêmio. Volte assim que tiver mais que '25.00 oz'.")
				end
			else
				doPlayerPopupFYI(cid, "                              [+] Blood Castle [+]\n                #Evento Exclusivo do Servidor#\n\nVocê é um guerreiro em treinamento, eu vejo.\nEu confiarei em sua coragem.\nVá em frente e derrube aquelas criaturas do mal.\n\n Destrua o Archangel!")
			end
		else
			doPlayerPopupFYI(cid, "                              [+] Blood Castle [+]\n                #Evento Exclusivo do Servidor#\n\nVocê é um guerreiro em treinamento, eu vejo.\nEu confiarei em sua coragem.\nVá em frente e derrube aquelas criaturas do mal.\n\n Destrua o Archangel!")
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)