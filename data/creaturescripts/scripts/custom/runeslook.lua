local walls = {1497, 1499, 12719, 12720}

function onLook(cid, thing, position, lookDistance)
    if getPlayerGroupId(cid) > 3 and isPlayer(thing.uid) then
        doPlayerSendCancel(cid, "Client Version: " .. getPlayerClientVersion(thing.uid))
    end

    if isCreature(thing.uid) then return true end
    if not isInArray(walls, thing.itemid) then return true end
    local owner = getPlayerName(getItemAttribute(thing.uid, "owner"))
    if owner then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You see "..getItemArticleById(thing.itemid).." "..getItemNameById(thing.itemid)..".\nUsed by "..owner..".")
        if getPlayerGroupId(cid) < 3 then
        	return false
        end
    end
    return true
end