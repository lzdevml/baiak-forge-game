function onSay(player, words, param)

	if not player:getGroup():getAccess() then
        return true
    end

    if player:getAccountType() < ACCOUNT_TYPE_GOD then
        return false
    end

    local houses = Game.getHouses()
    for _, house in ipairs(houses) do
        local items = house:getItems()
        if #items > 500 then
            print(('HouseID: %d, Items: %d.'):format(house:getId(), #items))
        end
    end
    return false
end