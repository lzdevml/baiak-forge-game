
  local config = {
        storage = 503039,
        key_id = 12647

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
playername = getPlayerName(cid)

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a ultimate spellbook.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doPlayerAddItem(cid, 2507, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
end