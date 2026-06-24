local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
 
 
 
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
 
 
function doCreatureSayWithDelay(cid,text,type,delay,e)
   if delay<=0 then
      doCreatureSay(cid,text,type)
   else
      local func=function(pars)
                    doCreatureSay(pars.cid,pars.text,pars.type)
                    pars.e.done=TRUE
                 end
      e.done=FALSE
      e.event=addEvent(func,delay,{cid=cid, text=text, type=type, e=e})
   end
end
 
 
 
 
function cancelNPCTalk(events)
  local ret=1
  for aux=1,table.getn(events) do
     if events[aux].done==FALSE then
        stopEvent(events[aux].event)
     else
        ret=ret+1
     end
  end
  events=nil
  return(ret)
end
 
 
 
 
function doNPCTalkALot(msgs,interval)
  local e={}
  local ret={}
  if interval==nil then interval=3000 end --3 seconds is default time between messages
  for aux=1,table.getn(msgs) do
      e[aux]={}
      doCreatureSayWithDelay(getNpcCid(),msgs[aux],TALKTYPE_PRIVATE_NP,(aux-1)*interval,e[aux])
      table.insert(ret,e[aux])
  end
  return(ret)
end
 
 
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
 
local config= {
   missao = 88518,
   startou = 88519,
   killstorage = 29001,
   rankstorage = 19002,
   amountkills = {200,400,600,800,400,500,600},
   rewarditem = {9020, 9020, 9020, 9020, 9020, 9020, 9020},
   rewardexp = {500000,1000000,2000000,3000000,1500000,2000000,3000000}
}
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   
   
    local qual = (getPlayerStorageValue(cid,config.missao)+2)
   
 
--------------------------------------------------------------
            ------- Missao 1 - 50 kills ---------
--------------------------------------------------------------
 
        if msgcontains(msg, 'storage') then
        selfSay('Missao: '..getPlayerStorageValue(cid, config.missao)..' Startou: '..getPlayerStorageValue(cid, config.startou)..' Kills: '..getPlayerStorageValue(cid, config.killstorage), cid)
        end
       
       
                if msgcontains(msg, 'rank') then
        selfSay('Voce ja me trouxe: '..(getPlayerStorageValue(cid, config.rankstorage)+1).. ' almas.', cid)
        end
 
 
 
        if (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == -1 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Voce precisa matar ' ..config.amountkills[qual].. ' jogadores e trazer sua alma para mim, aceita o desafio?', cid)
                talkState[talkUser] = 1
               
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Busque minhas almas!', cid)
                setPlayerStorageValue(cid, config.startou, 1)
                talkState[talkUser] = 0
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == -1 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) < config.amountkills[qual] then
        selfSay('Voce nao matou a quantidade suficiente, voce tem: '..(getPlayerStorageValue(cid,config.killstorage))..' de '..config.amountkills[qual]..' kills.', cid)
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == -1 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) >= config.amountkills[qual] then
        selfSay('Parabens voce completou seu desafio, sua recompensa e: ' ..config.rewardexp[qual].. ' de experience. Diga {mission} para seguir.}', cid)
        doPlayerAddItem(cid,config.rewarditem[qual], 1)
        doPlayerAddExp(cid,config.rewardexp[qual])
        setPlayerStorageValue(cid, config.missao, 0)
        setPlayerStorageValue(cid, config.startou, -1)
        setPlayerStorageValue(cid, config.rankstorage, (getPlayerStorageValue(cid,config.rankstorage)+getPlayerStorageValue(cid,config.killstorage)))
        setPlayerStorageValue(cid, config.killstorage, -1)
        return false
        end
       
       
 
 
       
--------------------------------------------------------------
 
 
 
 
--------------------------------------------------------------
            ------- Missao 2 - 100 kills ---------
--------------------------------------------------------------
        if (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 0 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Voce precisa matar ' ..config.amountkills[qual].. ' jogadores e trazer sua alma para mim, aceita o desafio?', cid)
                talkState[talkUser] = 1
               
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Busque minhas almas!', cid)
                setPlayerStorageValue(cid, config.startou, 1)
                talkState[talkUser] = 0
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 0 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) < config.amountkills[qual] then
        selfSay('Voce nao matou a quantidade suficiente, voce tem: '..(getPlayerStorageValue(cid,config.killstorage))..' de '..config.amountkills[qual]..' kills.', cid)
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 0 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) >= config.amountkills[qual] then
        selfSay('Parabens voce completou seu desafio, sua recompensa e: ' ..config.rewardexp[qual].. ' de experience. Diga {mission} para seguir.}', cid)
        doPlayerAddItem(cid,config.rewarditem[qual], 1)
        doPlayerAddExp(cid,config.rewardexp[qual])
        setPlayerStorageValue(cid, config.missao, 1)
        setPlayerStorageValue(cid, config.startou, -1)
        setPlayerStorageValue(cid, config.rankstorage, (getPlayerStorageValue(cid,config.rankstorage)+getPlayerStorageValue(cid,config.killstorage)))
        setPlayerStorageValue(cid, config.killstorage, -1)
        return false
        end
       
--------------------------------------------------------------
 
--------------------------------------------------------------
            ------- Missao 3 - 200 kills ---------
--------------------------------------------------------------
        if (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 1 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Voce precisa matar ' ..config.amountkills[qual].. ' jogadores e trazer sua alma para mim, aceita o desafio?', cid)
                talkState[talkUser] = 1
               
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Busque minhas almas!', cid)
                setPlayerStorageValue(cid, config.startou, 1)
                talkState[talkUser] = 0
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 1 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) < config.amountkills[qual] then
        selfSay('Voce nao matou a quantidade suficiente, voce tem: '..(getPlayerStorageValue(cid,config.killstorage))..' de '..config.amountkills[qual]..' kills.', cid)
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 1 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) >= config.amountkills[qual] then
        selfSay('Parabens voce completou seu desafio, sua recompensa e: ' ..config.rewardexp[qual].. ' de experience. Diga {mission} para seguir.}', cid)
        doPlayerAddItem(cid,config.rewarditem[qual], 1)
        doPlayerAddExp(cid,config.rewardexp[qual])
        setPlayerStorageValue(cid, config.missao, 2)
        setPlayerStorageValue(cid, config.startou, -1)
        setPlayerStorageValue(cid, config.rankstorage, (getPlayerStorageValue(cid,config.rankstorage)+getPlayerStorageValue(cid,config.killstorage)))
        setPlayerStorageValue(cid, config.killstorage, -1)
        return false
        end
       
--------------------------------------------------------------
 
 
--------------------------------------------------------------
 
--------------------------------------------------------------
            ------- Missao 4 - 300 kills ---------
--------------------------------------------------------------
        if (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 2 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Voce precisa matar ' ..config.amountkills[qual].. ' jogadores e trazer sua alma para mim, aceita o desafio?', cid)
                talkState[talkUser] = 1
               
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[talkUser] == 1 and getPlayerStorageValue(cid,config.startou) == -1 then
                selfSay('Busque minhas almas!', cid)
                setPlayerStorageValue(cid, config.startou, 1)
                talkState[talkUser] = 0
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 2 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) < config.amountkills[qual] then
        selfSay('Voce nao matou a quantidade suficiente, voce tem: '..(getPlayerStorageValue(cid,config.killstorage))..' de '..config.amountkills[qual]..' kills.', cid)
        elseif (msgcontains(msg, 'kill') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,config.missao) == 2 and getPlayerStorageValue(cid,config.startou) == 1 and getPlayerStorageValue(cid,config.killstorage) >= config.amountkills[qual] then
        selfSay('Parabens voce completou seu desafio, sua recompensa e: ' ..config.rewardexp[qual].. ' de experience. {Em breve mais missoes}', cid)
        doPlayerAddItem(cid,config.rewarditem[qual], 1)
        doPlayerAddExp(cid,config.rewardexp[qual])
        setPlayerStorageValue(cid, config.missao, 3)
        setPlayerStorageValue(cid, config.startou, -1)
        setPlayerStorageValue(cid, config.rankstorage, (getPlayerStorageValue(cid,config.rankstorage)+getPlayerStorageValue(cid,config.killstorage)))
        setPlayerStorageValue(cid, config.killstorage, -1)
        return false
        end
       
--------------------------------------------------------------
 
 
 
return TRUE
end
 
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())