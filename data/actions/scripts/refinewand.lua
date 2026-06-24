local cfg = {
    upgrade = {
        message = 'Upgrade!',
        color   = TEXTCOLOR_YELLOW,
        effect  = CONST_ME_FIREWORK_RED
    },

    fail = {
        message  = 'Upgrade Failed.',
        talkType = TALKTYPE_MONSTER,
        effect   = CONST_ME_POFF
    }
}

local gear = {
[8302] = {tier = 1, upgraderType = 'key', chance = 100,
        items = {
            	[12655] = 12629, -- +1
            	[12629] = 12661, -- +2
		[12661] = 12662, -- +3
		[12662] = 12663, -- +4
		[12663] = 12664, -- +5
		[12664] = 12665 -- +5
        }
    },
[8303] = {tier = 2, upgraderType = 'key', chance = 30,
        items = {
            	[12655] = 12629, -- +1
            	[12629] = 12661, -- +2
		[12661] = 12662, -- +3
		[12662] = 12663, -- +4
		[12663] = 12664, -- +5
		[12664] = 12665 -- +5
        }
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local tmp  = gear[item.itemid]
    local upgradeid = tmp and tmp.items[itemEx.itemid]
    local name = (itemEx.uid == 0) and 'this' or (itemEx.type > 1) and getItemPluralName(itemEx.uid) or (getItemArticle(itemEx.uid) ~= '') and (''.. getItemArticle(itemEx.uid) .. ' ' .. getItemName(itemEx.uid)) or getItemName(itemEx.uid)
        if upgradeid then
            if itemEx.type <= 1 then
                if math.random(100) <= tmp.chance then
                    doSendMagicEffect(toPosition, cfg.upgrade.effect)
                    doSendAnimatedText(toPosition, cfg.upgrade.message, cfg.upgrade.color)
                    doTransformItem(itemEx.uid, upgradeid)
                else
                    doCreatureSay(cid, cfg.fail.message, cfg.fail.talkType)
                    doSendMagicEffect(toPosition, cfg.fail.effect)
                end
                doRemoveItem(item.uid, 1)
            else
                doPlayerSendCancel(cid, 'You may only upgrade '.. name ..' 1 at a time.')
                doSendMagicEffect(toPosition, CONST_ME_POFF)
            end
        else
            doPlayerSendCancel(cid, 'You are unable to upgrade '.. name ..' with a tier '.. tmp.tier .. ' '.. tmp.upgraderType ..'.')
            doSendMagicEffect(toPosition, CONST_ME_POFF)
        end
    return true
end