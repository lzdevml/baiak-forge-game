local exh = 300
local storage = 7414

function onStepIn(cid, item, position, fromPosition)
if isPlayer(cid) and (getPlayerStorageValue(cid,storage) <= os.time()) then
	doBroadcastMessage(" ["..getCreatureName(cid).."]  da guild  [".. getPlayerGuildName(cid) .."]  invade o castelo!",21)
	setPlayerStorageValue(cid,storage,os.time()+exh)
          end
          return TRUE
end