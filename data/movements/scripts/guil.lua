function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = fromPosition, kickEffect = CONST_ME_POFF,
        kickMsg = "You need guild and level 120 to access this area.",
        enterMsg = "Welcome",
        enterEffect = CONST_ME_MAGIC_RED,
}

if isPlayer(cid) and (getPlayerGuildId(cid) == 0 or getPlayerLevel(cid) < 120) then
        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendCancel(cid, tileConfig.kickMsg)
end

return true
end