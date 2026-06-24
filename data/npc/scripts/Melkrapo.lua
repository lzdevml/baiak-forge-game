local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'entrar') or msgcontains(msg, 'evento')) then	 
	 if (getGlobalStorageValue(GRANTOWER.RUNNING) ~= -1) then
	  if (getPlayerLevel(cid) >= GRANTOWER.LEVEL) then 
	   if (getPlayerGuildId(cid) >= 1) then
	    if (#getGranTowerGuild(getPlayerGuildId(cid)) >= GRANTOWER.MAXGUILD) then
	     selfSay("Já estão participando, "..(GRANTOWER.MAXGUILD).." membros de sua guild. Esse é o limite, tente mais tarde.", cid)
	     return true
     end
    end
    doTeleportThing(cid, GRANTOWER.ENTER, true)
    selfSay("Boa sorte, faça um bom trabalho guerreiro!", cid)
   else
    selfSay("Você não tem o level necessário para participar do evento. Volte quando estiver no level "..tostring(GRANTOWER.LEVEL).."+.", cid)
 	 end
	 else
	  local dates = {
    ["Monday"] = "Segunda-Feira", 
    ["Tuesday"] = "Terça-Feira",
    ["Wednesday"] = "Quarta-Feira",
    ["Thursday"] = "Quinta-Feira",
    ["Friday"] = "Sexta-Feira",
    ["Saturday"] = "Sábado",
    ["Sunday"] = "Domingo",
   }
   msg = ""
   selfSay("O portal está fechado. Eu o abro nestes respectivos horários:\n", cid)
   for index, date in ipairs(GRANTOWER.DATES) do
	 	 msg = msg .. " - "..dates[date[1]].." às "..date[2].."."
   end
   selfSay(msg, cid)
  end
 elseif(msgcontains(msg, 'no') and isInArray({1, 2, 3}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok, até logo.', cid)
	end
	
	if(msgcontains(msg, 'saber mais') or msgcontains(msg, 'info')) then
 	selfSay("Sobre o que queres saber? {Castle}, {Tower}, {Aura} ou algumas {dicas} úteis?", cid)
  talkState[talkUser] = 1
 elseif(msgcontains(msg, 'Castle') and isInArray({1, 2}, talkState[talkUser])) then
  selfSay("O castelo tem vida própria e se protege sozinho. Porém, se um ser humano se mostrar forte e conseguir destruir a Gran Tower que fica no último andar do castelo, ganha {Gran Aura}!", cid)
 elseif(msgcontains(msg, 'Tower') and isInArray({1, 2}, talkState[talkUser])) then
  selfSay("Se você chegar no centro do 6º (sexto) / último andar do castelo, haverá uma espécie de estátua com imenso poder visível a olho nú. Se você a destruir, ganhará a {Gran Aura}! Então seu objetivo passa a ser o de proteger a Gran Tower, pois se alguém destruí-la novamente antes do tempo do Melkrapo fechar o portal, você perde a aura adquirida. Quer {saber mais}?", cid)
 elseif(msgcontains(msg, 'Aura') and isInArray({1, 2}, talkState[talkUser])) then
  selfSay("Com a Aura, o guerreiro fica brilhando e reflete 20% de todo dano recebido, além de ficar imune as B.Skill King Teleport e Changer Corpse. Quer {saber mais}?", cid)
 elseif(msgcontains(msg, 'dicas') and isInArray({1, 2}, talkState[talkUser])) then    
  talkState[talkUser] = 2
  selfSay("Leia as placas que ver, elas lhe darão informações importantes da ilha do Guild Battle. Quer {saber mais} ou quer outra {dica}?", cid)
 elseif(msgcontains(msg, 'dica') and talkState[talkUser] == 2) then
  selfSay("Você pode healar (encher a vida) da {Tower} ou das Walls (paredes de proteção), para dificultar que outros guerreiros dominem o {Gran Castle}.", cid)         
 elseif(msgcontains(msg, 'no') and isInArray({1, 2, 3}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay('Ok até logo.', cid)
	end
 return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())