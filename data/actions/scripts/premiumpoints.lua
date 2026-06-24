function onUse(cid, item, fromPosition, itemEx, toPosition)
if exhaustion.check(cid, 31933) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Espere 1 segundo, depois tente novamente, você não nasceu de 1 mês.")
return true
end
exhaustion.set(cid, 31933, 1)
local query = db.query or db.executeQuery

if query("UPDATE `accounts` SET `premium_points` = `premium_points` + '1' WHERE `id` = '"..getPlayerAccountId(cid).."'") then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Foi adicionado 1 pharaot coin em sua conta no site.")
doCreatureSay(cid, "Você acaba de ganhar pontos no site. ", TALKTYPE_ORANGE_1)
doSendMagicEffect(getCreaturePosition(cid), 28)
doRemoveItem(item.uid,1)
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Algo de errado não está certo. Envie um ticket em caso de dúvidas.")
end
end