function onStepIn(cid, item, pos)
local nie = {x = 205, y = 407, z = 13}
    if item.uid == 10001 then
        if getPlayerStorageValue(cid,10001) < 2 then
            setPlayerStorageValue(cid,10001,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Verminor큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),20)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Veminor큦 spirit.')
			local wal2 = {x = 359, y = 571, z = 14}
			doTeleportThing(cid, wal2)
			doSendMagicEffect(wal2,17)
        end
    elseif item.uid == 10002 then
        if getPlayerStorageValue(cid,10002) < 2 then
            setPlayerStorageValue(cid,10002,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Infernatil큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),15)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Infernatil큦 spirit.')
			local wal7 = {x = 473, y = 594, z = 14}
			doTeleportThing(cid, wal7)
			doSendMagicEffect(wal7,17)
			end
    elseif item.uid == 10003 then
        if getPlayerStorageValue(cid,10003) < 2 then
            setPlayerStorageValue(cid,10003,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Tafariel큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),2)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Tafariel큦 spirit.')
			local wal3 = {x = 478, y = 638, z = 14}
			doTeleportThing(cid, wal3)
			doSendMagicEffect(wal3,17)
        end
    elseif item.uid == 10004 then
        if getPlayerStorageValue(cid,10004) < 2 then
            setPlayerStorageValue(cid,10004,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Apocalypse큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),4)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Apocalypse큦 spirit.')
			local wal4 = {x = 492, y = 664, z = 14}
			doTeleportThing(cid, wal4)
			doSendMagicEffect(wal4,17)
        end
    elseif item.uid == 10005 then
        if getPlayerStorageValue(cid,10005) < 2 then
            setPlayerStorageValue(cid,10005,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Pumin큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),7)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Pumin큦 spirit.')
			local wal = {x = 367, y = 647, z = 15}
			doTeleportThing(cid, wal)
			doSendMagicEffect(wal,17)
        end
    elseif item.uid == 10007 then
        if getPlayerStorageValue(cid,10007) < 2 then
            setPlayerStorageValue(cid,10007,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Ashfalor큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),17)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Ashfalor큦 spirit.')
			local wal1 = {x = 456, y = 707, z = 14}
			doTeleportThing(cid, wal1)
			doSendMagicEffect(wal1,17)
        end
		elseif item.uid == 10008 then
        if getPlayerStorageValue(cid,10008) < 2 then
            setPlayerStorageValue(cid,10008,2)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Bazir큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),11)
			local wal5 = {x = 251, y = 726, z = 15}
			doTeleportThing(cid, wal5)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Bazir큦 spirit.')
			local wal5 = {x = 251, y = 726, z = 15}
			doTeleportThing(cid, wal5)
        end
    elseif item.uid == 14334 then
        if getPlayerStorageValue(cid,10001) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
        else 
		end
		 elseif item.uid == 14333 then
        if getPlayerStorageValue(cid,10002) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
			else
			end
			 elseif item.uid == 14332 then
        if getPlayerStorageValue(cid,10003) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
			else
			end
			 elseif item.uid == 14339 then
        if getPlayerStorageValue(cid,10004) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
			else
			end
			 elseif item.uid == 14330 then
        if getPlayerStorageValue(cid,10005) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
			else
			end
			 elseif item.uid == 14329 then
        if getPlayerStorageValue(cid,10007) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
			else
			end
			 elseif item.uid == 14328 then
        if getPlayerStorageValue(cid,10008) < 2 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, nie)
			doSendMagicEffect(getCreaturePosition(cid),51)
			else
			end	
        end
    end
    return 1
