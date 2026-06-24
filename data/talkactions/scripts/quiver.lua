function onSay(cid, words, param)
	local item = doCreateItemEx(1987, 1)
	doItemSetAttribute(item, 'name', 'Quiver')
	doItemSetAttribute(item, 'article', 'a')
	doPlayerAddItemEx(cid, item)
return TRUE
end