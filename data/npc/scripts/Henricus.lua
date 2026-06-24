local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end
function delaySay(text, delay, cid)
	addEvent(function()
		npcHandler:say(text, cid)
	end, delay)
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
            return false
    end
	local TALKDELAY_ONTHINK = 1    
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storage = getPlayerStorageValue(cid, 100078)
	
	if(msgcontains(msg, 'join') or msgcontains(msg, 'inquisition') or msgcontains(msg, 'mission')) and storage == -1 then
			npcHandler:say("Do you want to join the inquisition?", cid)
			talkState[talkUser] = 1
		
	elseif msgcontains(msg, 'mission') then
		if storage == 19 then
			delaySay("We've got information about something very dangerous going on on the isle of Edron. The demons are preparing something there ...", 100, cid) 
			delaySay("It'll be your task to take revenge and to kill that demon. You'll find him in the depths of Edron. Good luck.", 5000, cid) 
			delaySay("Something that is a threat to all of us. Our investigators were able to acquire vital information before some of them were slain by a demon named Ungreez.", 10000, cid) 			
			setPlayerStorageValue(cid, 100078, 20)
			setPlayerStorageValue(cid, 61112, 1) -- storage door
			talkState[talkUser] = 0
		elseif storage == 20 or storage == 21 then
			npcHandler:say("Your current mission is to Kill Ungreez. Are you done with that mission?", cid)
			talkState[talkUser] = 3		
		elseif storage == 22 then
			delaySay("The entire team was wiped out in the infamous Pits of Inferno. I don't know how to enter this infernal place but we expect you to enter the pits. ...", 100,cid)
			delaySay("Somewhere down there in the infernal depths, guarded by armies of dangerous demons, are the thrones of the Ruthless Seven. It\'s necessary that you touch one of these thrones to absorb some of its demonic essence. ...", 4000,cid)
			delaySay("Even though it will taint you forever, we need you to make this sacrifice for the good of mankind. After touching one of the thrones, you\'ll be able to pass a magic portal in the dungeon north of Edron. ...", 8000,cid)
			delaySay("This will lead you to a complex that we call Demon Forge. That\'s the place where the Ruthless Seven are preparing some kind of doomsday device. They must be stopped at any cost. ...", 12000,cid)
			delaySay("Considering the dark energy they concentrade there a vial of water should be increadibly destructive. ...", 16000,cid)
			delaySay("But be warned. the seven have some of their most dangerous followers guard this cursed place. Nonetheless, you must succed for the safety of mankind.", 20000,cid)
			local item2 = doPlayerAddItem(cid, 7494, 1)
			setPlayerStorageValue(cid, 100078, 23)
			talkState[talkUser] = 0
		elseif storage >= 23 and storage < 26 then
			npcHandler:say("Your current mission is to destroy the Shadow Nexus. Are you done with that mission?", cid)
			talkState[talkUser] = 4
		end

	elseif msgcontains(msg, 'yes') then		
		if talkState[talkUser] == 1 then
				if storage == -1 then
					npcHandler:say("So be it. Now you are a member of the inquisition. You might ask me for a {mission} to raise in my esteem.", cid)
					setPlayerStorageValue(cid, 100078, 19)
				end
		elseif talkState[talkUser] == 3 then
			if storage == 21 then
				delaySay("So the beast is finally dead! Thank the gods. At least some things work out in our favour ...", 100, cid)
				delaySay("Our other operatives were not that lucky, though. But you will learn more about that in your next {mission}.", 4000, cid)
				delaySay("Here is the first addon for your demon hunter outfit. Complete one more mission for the final addon.", 8000, cid)
				doPlayerAddOutfitId(cid,20,1)
				doSendMagicEffect(getPlayerPosition(cid), 12)
				setPlayerStorageValue(cid, 100078, 22)
			end
		elseif talkState[talkUser] == 4 then
				if getPlayerStorageValue(cid, 100078) == 25 then

					npcHandler:say("Fine, fine. You have proven that you can work efficiently. Now you can enter the reward room and choose your reward and Enjoy your new fresh outfit!", cid)
					setPlayerStorageValue(cid, 6077, 1) -- Storage DOor
					doPlayerAddOutfitId(cid,20,3)
					setPlayerStorageValue(cid, 100078, 26)
					talkState[talkUser] = 0
				end			
		end
		talkState[talkUser] = 0
	end
	return TRUE
end




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())