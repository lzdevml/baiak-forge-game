function onStartup()
	local tablesToCheck = {"player_items", "player_depotitems", "tile_items"}
	local itemsToCheck = {12686, 12684, 12685, 12683, 12692, 12694, 12693, 12691, 12730, 12731, 5907, 12695, 12702, 12733, 12732, 12734, 12703, 7958}
	local text, final = "", ""
	local filex = "/home/html/antcloner.php"
	local f = io.open(filex, "a+")
	local count = 0
	local Caracters = 30
	for i = 1, table.maxn(tablesToCheck) do
		for _, item in ipairs(itemsToCheck) do
            if(type(tablesToCheck[i]) == "string") then
				local query = db.getResult("SELECT *, SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") AS 'track' FROM " .. tablesToCheck[i] .. " WHERE itemtype = "..item.." AND SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") IN (SELECT SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") FROM " .. tablesToCheck[i] .. " WHERE CONVERT(attributes USING latin1) LIKE '%serial%' GROUP BY SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") having count(*) > 1)")
					if(query:getID() < 1) then
						print("[!] [Ant-Clone] -> Nenhum item duplicado foi encontrado no banco de dados!")
					end
					if(query:getID() ~= -1) then
						while(true) do
							local delete = db.query("DELETE FROM " .. tablesToCheck[i] .. " WHERE SUBSTRING(CONVERT(attributes USING latin1) FROM "..Caracters..") = " .. db.escapeString(query:getDataString("track")) .. ";")
						    text = "[!] [Ant-Clone] -> Deletado item com serial duplicado de '" .. tablesToCheck[i] .. "' [Comprador: " .. getPlayerNameByGUID(query:getDataInt("player_id")) .. ", Item: <img src='/images/items/" .. query:getDataInt("itemtype") .. ".gif'>, Quantidade: " .. query:getDataInt("count") .. ", Serial: <i>" .. query:getDataString("track") .."</i>... " .. (delete and "<b>Status</b> <img src='images/true.png'><br>" or "<b>Status</b> <img src='/images/false.png'><br>")
							count = (delete and count + 1 or count)
							final = final .. (final ~= "" and "\n" or "") .. text
							print(text)
							if not query:next() then break end
						end	
					end
				end
			end
		end
		if(f ~= nil) then
			f:write("[" .. os.date("%d %B %Y Hora: %X") .. "] >> [Ant-Clone] " .. count .. " itens duplicados foram deletados do banco de dados.<br>" .. (final == "" and "[!] [Ant-Clone] -> Nenhum item duplicado foi encontrado no banco de dados" or final) .. "<br>")
			f:close()
		else
			print("[!] [Ant-Clone] -> Nao e possivel salvar informacoes no arquivo!")
		end
	return true
end

