local cfg = {
tp1 = {x = 119, y = 52, z = 6},
tp2 = {x = 147, y = 49, z = 7},
tp3 = {x = 156, y = 42, z = 6},
effect = 19,
}

function onThink(interval, lastExecution, thinkInterval)
doSendMagicEffect(cfg.tp1, cfg.effect)
doSendMagicEffect(cfg.tp2, cfg.effect)
doSendMagicEffect(cfg.tp3, cfg.effect)
return true end