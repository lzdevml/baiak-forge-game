local config = {
storage = 20999,
tele = {x = 63, y = 81, z = 8},
mensagem = "You need A Ghostly Sage permission."
}
 
function onUse(cid, item, frompos, item2, topos)
if getPlayerStorageValue(cid,20999) == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You need A Ghostly Sage permission.")
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You have pass.")
doTeleportThing(cid, config.tele, true)
end
return true
end