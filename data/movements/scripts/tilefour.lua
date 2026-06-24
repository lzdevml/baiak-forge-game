function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	kickPos = fromPosition, kickEffect = CONST_ME_POFF,
	kickMsg = "Você não e um player VIP IV, faça a quest para acessar!",
	enterMsg = "Bem Vindo a area VIP IV!",
	enterEffect = CONST_ME_MAGIC_RED,
	enterPos = {x=2934, y=2912, z=7}
}

if isPlayer(cid) == true then
if getPlayerStorageValue(cid,49777) < 1 then 
		doTeleportThing(cid, tileConfig.kickPos)
		doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
		doPlayerSendCancel(cid, tileConfig.kickMsg)
		return
	end
		doTeleportThing(cid, tileConfig.enterPos)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, tileConfig.enterMsg)
		doSendMagicEffect(position, tileConfig.enterEffect)
		return true
end
end