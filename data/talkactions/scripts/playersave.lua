function onSay(cid, words, param, channel)

local config = {
s = 11548, -- n mexa
exhau = 240 -- tempo em seegundos para salvar denovo
}

if (getPlayerStorageValue(cid, config.s) <= os.time()) then
doPlayerSave(cid)
setPlayerStorageValue(cid,config.s,os.time()+config.exhau)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Char salvo com sucesso.")
else
doPlayerSendCancel(cid, "Você tem que esperar quatro minutos para salvar novamente.")
end
return TRUE 
end