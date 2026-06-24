local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local reward1 = {
[1] = {2160,50},
[2] = {12328,1},
[3] = {6527,20}
}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "hi") and (not npcHandler:isFocused(cid)) then
		if (getPlayerStorageValue(cid, "reward_vipboss") - os.time() > 0) then
			local parcel, time = doCreateItemEx(2595), os.time()
			local label, target = doAddContainerItem(parcel, 2599), getCreatureName(cid)

			doItemSetAttribute(label, "text", target .. "\nYurots")
			doItemSetAttribute(label, "date", time)
			doItemSetAttribute(label, "writer", getCreatureName(getNpcId()))
			
			for _, item in ipairs(reward1) do
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

			if getPlayerFreeCap(cid) > 10.00 then
				doPlayerSendMailByName(target, parcel, 1) -- TOWN 1 = YUROTS
				doPlayerAddExp(cid, 150000)
				doPlayerSetBalance(cid, getPlayerBalance(cid) + 250000)
				setPlayerStorageValue(cid, "reward_vipboss", -1)
				doPlayerPopupFYI(cid, "                       [+] World Boss [+]\n        # Evento Exclusivo do Servidor #\n\nVocê deu o último dano no VIP BOSS.\n\n\n                       .:: RECOMPENSA ::.\n\nEXP: +150k\nGOLD: Voce pode ganhar 500k, todo o dinheiro sera enviado POR PARCEL. \n\n+20 Event Coins\n+1 Stamina potion\n\nTodos os items foram enviados por parcel.\nVá até seu Depot pegar a sua recompensa.")
			else
				doPlayerPopupFYI(cid, "                                                [+] World Boss [+]\n                                  #Evento Exclusivo do Servidor#\n\nVocê precisa ter mais que '10.00 oz' (cap) para receber o troféu.\nVocê não recebeu o prêmio. Volte assim que tiver mais que '10.00 oz'.\n\nLembre-se: Você só tem alguns minutos para receber a recompensa.")
			end
		else
			doPlayerPopupFYI(cid, "                                                               [+] World Boss [+]\n                                               #Evento Exclusivo do Servidor#\n\nVocê precisa dar o último hit no VIP BOSS para ganhar recompensas que aparecerão direto no seu DEPOT.\n\nSeja astuto e acerte o último tiro de misericórdia no coração do BOSS ...\n... O MISERÁRVEL nasce todos os dias em horários que ele quiser. Não desista de matá-lo, tamo junto!\n                                                                                                                                            'Ft. ADM Fabio'.")
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)