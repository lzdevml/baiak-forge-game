                                          local keywordHandler = KeywordHandler:new()
            local npcHandler = NpcHandler:new(keywordHandler)
            NpcSystem.parseParameters(npcHandler)
            local talkState = {}

            function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
            function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
            function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
            function onThink() npcHandler:onThink() end

            function creatureSayCallback(cid, type, msg)
            if(not npcHandler:isFocused(cid)) then
            return false
            end
                       
                       
                     
                        local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

                        for varm, tasks in pairs(amoebaTask) do
                            local msg = string.lower(msg)
                            if isInArray(tasks.nome, msg) then
                                if getPlayerStorageValue(cid, tasks.storage) == -1 then
                                if getPlayerStorageValue(cid, tasks.storagecount) == tasks.count then
                                    local esperiencia = tasks.exp > 0 and "" ..tasks.exp.. " exp e " or ""
                                    local dineiro = tasks.money > 0 and "" .. tasks.money .. " gold coins e " or ""
                                    selfSay("Has Conseguido Completar La Task".. esperiencia .. "" .. dineiro .."algunos items como recompensa.", cid)
                                    doPlayerAddExperience(cid, tasks.exp)
                                    doPlayerAddMoney(cid, tasks.money)
                                    doPlayerSetStorageValue(cid, tasks.storage, 1)
                                    for juba, prize in pairs(tasks.premios) do
                                        doPlayerAddItem(cid, prize[1], prize[2])
                                end
                                else
                                    selfSay("Disculpe usted No a matado Todos Las Creaturas llevas  ".. taskKills(cid, tasks.storagecount) .. " de " .. tasks.count .. " Continue cacando", cid)
                                    break
                                end
                            else
                                selfSay("Usted Solo Puede recibir Un premio Por Task, Gracias.", cid)
                            end
                        end
                        end
                        return true
                        end
                        npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
            npcHandler:addModule(FocusModule:new())