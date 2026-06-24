local config = {leverid = 1945, -- id da alavanca
transformedid = 1946, -- id da alavanca ao clicar nela
moneyPos = {x = 158, y = 45, z = 6}, -- posicao que vai o dinheiro
delay = 200, -- esse delay e o tempo que demora entre cada shuffle
shuffle = 5, -- quantidade de shuffles por cada peça, lembre que a ultima peça vai rodar 3 * shuffle entao evite valores grandes)
multiplier = 2, -- por quanto multiplica o dinheiro apostado
effect = 27}
local pieces = {[1] = {x = 157, y = 44, z = 6},	[2] = {x = 158, y = 44, z = 6},	[3] = {x = 159, y = 44, z = 6}}
function shuffle(id, times, final, pos) -- funcao que rotaciona a peca	
local item = getTileItemById(pos, id)
	if item and times > 0 then
				doRemoveItem(item.uid)
		doCreateItem(id == 2638 and 2639 or 2638, 1, pos)
		addEvent(shuffle, config.delay, id == 2638 and 2639 or 2638, times - 1, final, pos)
	else
 		local nid = id
		if item and id ~= final then
			doRemoveItem(item.uid)
			doCreateItem(final, 1, pos)
			nid = final
		end
		if times == 0 then
			addEvent(shuffle, config.delay * config.shuffle * #pieces + config.delay * 10, nid, -1, 2639, pos)
		end
		doSendMagicEffect(pos, math.abs(final - 2638))
			end
end
function premiateWinner(uid, money, eff, result)
	if isPlayer(uid) then
		if result[1] == result[2] and result[2] == result[3] then
			doPlayerAddMoney(uid, money)
			doSendMagicEffect(getCreaturePosition(uid), eff)
			doPlayerSendTextMessage(uid, MESSAGE_STATUS_CONSOLE_BLUE, "[CASSINO] You won ".. money .." gold coins. Congratulations!")
		else
			doSendMagicEffect(getCreaturePosition(uid), CONST_ME_POFF)
			doPlayerSendTextMessage(uid, MESSAGE_STATUS_CONSOLE_BLUE, "[CASSINO] You lost. Better luck next time.")
		end
	end
end
	function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == config.leverid then
		local pc = getTileItemById(config.moneyPos, 2152)
		local cc = getTileItemById(config.moneyPos, 2160)
		local money = 0
		if pc and pc.type > 0 then
			money = money + pc.type * 100
			doRemoveItem(pc.uid)
		end
		if cc and cc.type > 0 then
			money = money + cc.type * 10000
			doRemoveItem(cc.uid)
		end
		if money >= 100 then
			doTransformItem(item.uid, config.transformedid)
			local pos = fromPosition
			addEvent(function()
				local lever = getTileItemById(pos, config.transformedid)
				if lever and lever.uid > 0 then
					doTransformItem(lever.uid, config.leverid)
				end
			end, (config.delay * #pieces) * (config.shuffle + 10))
			local result = {}
			for i = 1, #pieces do
				local id = 2639
				result[i] = math.random(0, 1)
				shuffle(id, config.shuffle * i, result[i] + 2638, pieces[i])
			end
						addEvent(premiateWinner, config.delay * #pieces * config.shuffle, cid, money * config.multiplier, config.effect, result)
		else
			doPlayerSendCancel(cid, "You need to place your offer. The minimum offer is 1 platinum coin.")
		end
	else
		doPlayerSendCancel(cid, "You need to wait the turn end to bet again.")
	end
	return true
end
