  local config = {
        storage = 60109,
        key_id = 2453 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found arcane staff.")
   			broadcastMessage (""..playername.." completed a Pits of Inferno! ", 19)
                key = doPlayerAddItem(cid, config.key_id, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
end