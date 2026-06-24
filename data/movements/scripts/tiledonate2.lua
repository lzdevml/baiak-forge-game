function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	kickPos = fromPosition, kickEffect = CONST_ME_POFF,
	kickMsg = "Você não e um player VIP para virar acesse: www.Baiakinho-ot.com.br",
	enterEffect = CONST_ME_MAGIC_RED,
}

if isPlayer(cid) == true then
if vip.hasVip(cid) == FALSE then
		doTeleportThing(cid, tileConfig.kickPos)
		doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
		doPlayerSendCancel(cid, tileConfig.kickMsg)
		return
	end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua vip acaba em "..os.date("%d %B %Y %X ",vip.getVip(cid)))
		doSendMagicEffect(position, tileConfig.enterEffect)
		return true
end
end