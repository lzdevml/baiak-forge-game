local talkState = {}
local bbuff = {}
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)
	talkState[cid] = 0
	npcHandler:onCreatureDisappear(cid)

end
function onCreatureSay(cid, type, msg)          npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                  npcHandler:onThink()                    end
 

function creatureSayCallback(cid, type, msg)
	local msg, sstr = string.lower(msg), ''
	local oo = getPlayerSex(cid) + 1
	if not talkState[cid] or talkState[cid] < 1 then
		talkState[cid] = 1
	end

local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid 	

	if	talkState[cid] == 1 then
		if msgcontains(msg, 'buff') then
			for a,b in pairs(buffoutfit.buffs) do
				sstr = 'O buff {'..a..'} dá'
				for c,d in pairs(b) do
					if d > 0 then
						sstr = sstr..' +'..d..' '..c
					end
				end
				npcHandler:say(sstr,cid)
			end
			npcHandler:say('Me avise quando quiser alterar o buff de algum {outfit}.',cid)
		elseif msgcontains(msg, 'outfit') then
			npcHandler:say('Deseja alterar o buff de qual outfit?',cid)
			talkState[cid] = 2
		end
		
		
		
	elseif	talkState[cid] == 2 then
		
		if buffoutfit.outfits[oo][msg] then
			if canPlayerWearOutfit(cid, buffoutfit.outfits[oo][msg], 3) then
				npcHandler:say('Deseja colocar qual buff no outfit '..msg..'?',cid)
				bbuff[cid]=msg
				talkState[cid] = 3
			else
				npcHandler:say('Este seu outfit não está full, volte quando tiver todos addons deste outfit. Deseja alterar o buff de qual outro outfit?',cid)
			end
		else
			npcHandler:say(msg..' não é um outfit, diga por favor qual outfit deseja alterar o buff.',cid)
		end
		
		
		
	elseif	talkState[cid] == 3 then
		local nmsg,ou = tonumber(msg),bbuff[cid]
		if buffoutfit.buffs[nmsg] then
			npcHandler:say('Buff '..msg..' colocado no outfit '..ou..'. Relogue para ativar!',cid)
			setPlayerStorageValue(cid,buffoutfit.storage + buffoutfit.outfits[oo][ou],'b'..msg)
			talkState[cid] = 0
		else
			npcHandler:say(msg..' não é um buff válido.',cid)
			for a,b in pairs(buffoutfit.buffs) do
				sstr = 'O buff {'..a..'} dá'
				for c,d in pairs(b) do
					if d > 0 then
						sstr = sstr..' +'..d..' '..c
					end
				end
				npcHandler:say(sstr,cid)
			end
			npcHandler:say('Qual buff deseja colocar no outfit '..ou..'?',cid)
		end
	end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())