function isCreatureInArea(fromPos, toPos)
	local t = {}
	for z=fromPos.z, toPos.z do
		for y=fromPos.y, toPos.y do
			for x=fromPos.x, toPos.x do
				local v = getTopCreature({x=x,y=y,z=z})
				if v.itemid == 1 and table.find({1,2,3}, v.type) then
					table.insert(t, v.uid)
				end
			end
		end
	end
	return t
end

-- [TGY]