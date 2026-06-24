  local config = {
        storage = 51534,
        key_id = 1987 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a bag.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2534, 1)
				doAddContainerItem(key, 2160, 1)
				doAddContainerItem(key, 2152, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The box is empty.")
        end
end 