        local room = {     -- room with demons  {x = 33217, y = 31655, z = 13} {x = 33226, y = 31663, z = 13}
        fromX = 178,
        fromY = 114,
        fromZ = 9,

        toX = 183,
        toY = 120,
        toZ = 9
        }

         local monster_pos = {
        [1] = {pos = {179, 115, 9}, monster = "Demon"},
        [2] = {pos = {181, 115, 9}, monster = "Demon"},
        [3] = {pos = {180, 119, 9}, monster = "Demon"},
        [4] = {pos = {182, 119, 9}, monster = "Demon"},
        [5] = {pos = {183, 117, 9}, monster = "Demon"},
		[6] = {pos = {183, 117, 9}, monster = "Demon"},
        [7] = {pos = {178, 117, 9}, monster = "Demon"}
        }

        local players_pos = {
        {x = 185, y = 129, z = 9, stackpos = 253},
        {x = 184, y = 129, z = 9, stackpos = 253},
        {x = 183, y = 129, z = 9, stackpos = 253},
        {x = 182, y = 129, z = 9, stackpos = 253}
        }

        local new_player_pos = {
        {x = 182, y = 117, z = 9},
        {x = 181, y = 117, z = 9},
        {x = 180, y = 117, z = 9},
        {x = 179, y = 117, z = 9}
        }

        local playersOnly = "no"
        local questLevel = 101

function onUse(cid, item, fromPosition, itemEx, toPosition)
        local all_ready, monsters, player, level = 0, 0, {}, 0
        if item.itemid == 1945 then
                for i = 1, #players_pos do
                        table.insert(player, 0)
                end
                for i = 1, #players_pos do
                        player[i] = getThingfromPos(players_pos[i])
                        if player[i].itemid > 0 then
                                if string.lower(playersOnly) == "yes" then
                                        if isPlayer(player[i].uid) == TRUE then
                                                all_ready = all_ready+1
                                        else
                                                monsters = monsters+1
                                        end
                                else
                                        all_ready = all_ready+1
                                end
                        end
                end
                if all_ready == #players_pos then
                        for i = 1, #players_pos do
                                player[i] = getThingfromPos(players_pos[i])
                                if isPlayer(player[i].uid) == TRUE then
                                        if getPlayerLevel(player[i].uid) >= questLevel then
                                                level = level+1
                                        end
                                else
                                        level = level+1
                                end
                        end
                        if level == #players_pos then
                                if string.lower(playersOnly) == "yes" and monsters == 0 or string.lower(playersOnly) == "no" then
                                        for _, area in pairs(monster_pos) do
                                                        doSummonCreature(area.monster,{x=area.pos[1],y=area.pos[2],z=area.pos[3]})
                                        end
                                        for i = 1, #players_pos do
                                                doSendMagicEffect(players_pos[i], CONST_ME_POFF)
                                                doTeleportThing(player[i].uid, new_player_pos[i], FALSE)
                                                doSendMagicEffect(new_player_pos[i], CONST_ME_ENERGYAREA)
                                                doTransformItem(item.uid,1946)
                                        end
                                else
                                        doPlayerSendTextMessage(cid,19,"Only players can do this quest.")
                                end
                        else
                                doPlayerSendTextMessage(cid,19,"All Players have to be level "..questLevel.." to do this quest.")
                        end
                else
                        doPlayerSendTextMessage(cid,19,"You need "..table.getn(players_pos).." players to do this quest.")
                end
        elseif item.itemid == 1946 then
                local player_room = 0
                for x = room.fromX, room.toX do
                        for y = room.fromY, room.toY do
                                for z = room.fromZ, room.toZ do
                                        local pos = {x=x, y=y, z=z,stackpos = 253}
                                        local thing = getThingfromPos(pos)
                                        if thing.itemid > 0 then
                                                if isPlayer(thing.uid) == TRUE then
                                                        player_room = player_room+1
                                                end
                                        end
                                end
                        end
                end
                if player_room >= 1 then
                        doPlayerSendTextMessage(cid,19,"There is already a team in the quest room.")          
                elseif player_room == 0 then
                        for x = room.fromX, room.toX do
                                for y = room.fromY, room.toY do
                                        for z = room.fromZ, room.toZ do
                                                local pos = {x=x, y=y, z=z,stackpos = 253}
                                                local thing = getThingfromPos(pos)
                                                if thing.itemid > 0 then
                                                        doRemoveCreature(thing.uid)
                                                end
                                        end
                                end
                        end
                        doTransformItem(item.uid,1945)
                end
        end
        return TRUE
end