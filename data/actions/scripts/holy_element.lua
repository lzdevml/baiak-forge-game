function onUse(cid, item, fromPosition, itemEx, toPosition)
if(getPlayerSoul(cid) < 10) then
	doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
	return true
end

	if(item.itemid == 7698 and itemEx.itemid == 12727) then -- physical classic sword
		doTransformItem(itemEx.uid, 12733)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12734) then -- physical upgraded classic sword
		doTransformItem(itemEx.uid, 12740)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12741) then -- physical classic axe
		doTransformItem(itemEx.uid, 12747)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12748) then -- physical upgraded classic axe
		doTransformItem(itemEx.uid, 12754)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12755) then -- physical classic club
		doTransformItem(itemEx.uid, 12761)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12762) then -- physical upgraded classic club
		doTransformItem(itemEx.uid, 12768)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12678) then -- staff of destruction
		doTransformItem(itemEx.uid, 12779)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12773) then -- staff of imperor
		doTransformItem(itemEx.uid, 12789)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 12774) then -- upgraded staff of imperor
		doTransformItem(itemEx.uid, 12794)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 2408) then -- warlord sword
		doTransformItem(itemEx.uid, 12813)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 8925) then -- solar axe
		doTransformItem(itemEx.uid, 12819)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	if(item.itemid == 7698 and itemEx.itemid == 7450) then -- hammer of prophecy
		doTransformItem(itemEx.uid, 12825)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
		doPlayerAddSoul(cid, -10)
		return true
	end
	
	return false
end
