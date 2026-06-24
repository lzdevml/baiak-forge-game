function onSay(cid, words, param)

    local RESET_STORAGE = 987654
    local LEVEL_RESET = 8

    -- tabela de resets (ajuste conforme sua tabela da imagem)
    local resetStages = {
        [0] = {needLevel = 100, life = 50, mana = 50, attack = 2},
        [1] = {needLevel = 200, life = 80, mana = 80, attack = 3},
        [2] = {needLevel = 300, life = 120, mana = 120, attack = 4},
        [3] = {needLevel = 400, life = 170, mana = 170, attack = 5},
    }

    local resets = getPlayerStorageValue(cid, RESET_STORAGE)
    if resets < 0 then
        resets = 0
    end

    local stage = resetStages[resets]
    if stage == nil then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
            "Você já atingiu o reset máximo. Total de resets: "..resets)
        return true
    end

    if getPlayerLevel(cid) < stage.needLevel then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
            "Você precisa do level "..stage.needLevel.." para resetar.")
        return true
    end

    -- incrementa reset
    setPlayerStorageValue(cid, RESET_STORAGE, resets + 1)

    -- volta para level 8
    doPlayerAddExperience(cid,
        -(getPlayerExperience(cid) - getExperienceForLevel(LEVEL_RESET))
    )

    -- vida e mana base + bônus
    setCreatureMaxHealth(cid, 150 + stage.life)
    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))

    setCreatureMaxMana(cid, 50 + stage.mana)
    doCreatureAddMana(cid, getCreatureMaxMana(cid))

    -- bônus de ataque (caso queira usar depois em combate)
    setPlayerStorageValue(cid, 987655, stage.attack)

    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,
        "Reset efetuado com sucesso! Total de resets: "..(resets + 1))

    -- força reload do personagem
    doRemoveCreature(cid)
    return true
end
