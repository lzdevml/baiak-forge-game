--[[
	Adiciona a tag em GlobalEvents.xml:
	<globalevent name="TaskSystemWebsite" type="start" event="script" value="PersonalizedTaskSystem - Global.lua"/>
]]--

function onStartup()
	-- Atualizando Informações do Task System para WebSite
	addEvent(function()
		doRegisterInFile(cid, "data/", "", "", "DELETANDO", "data/lib/_Task_System_Gesior_Info.xml") -- Deletando Arquivo
		iList = _MONSTERS_TASK_SYSTEM_CONFIG
		local reg_info = ''
		local tabA = {}
		for index, result in pairs(iList) do
			table.insert(tabA, {name = index, sprice = result.price})
		end
		table.sort(tabA, function(a, b) return a.sprice < b.sprice end)
		for x = 1, #tabA do
			listItem, mlist, premdays, exppoints = "", "", 0, 0
			get = iList[tabA[x].name]
			rew = iList[tabA[x].name].awards
			monslist = iList[tabA[x].name].mlist
			if #rew > 1 then
				for a = 1, #rew do
					if isNumber(rew[a].id) then
						if a == 1 then
							listItem = listItem..''..rew[a].multiply..';'..rew[a].id..''
						else
							listItem = listItem..','..rew[a].multiply..';'..rew[a].id..''
						end
					elseif rew[a].id == "exp" then
						exppoints = rew[a].multiply
					elseif rew[a].id == "premmy" then
						premdays = rew[a].multiply
					end
				end
			end
			for m = 1, #monslist do
				if mlist == '' then
					mlist = ''..monslist[m]..''
				else
					mlist = ''..mlist..'; '..monslist[m]..''
				end
			end			
			if not get.inDay then
				inday = 0
			else
				inday = get.inDay
			end
			if reg_info == '' then
				reg_info = reg_info..'	<tasksystem name="'..tabA[x].name..'" class="'..get.class..'" count="'..get.count..'" actprice="'..get.price..'" repeated="'..get.repeated..'" inday="'..inday..'" itemList="'..listItem..'" premdays="'..premdays..'" exppoints="'..exppoints..'" mlist="'..mlist..'"/>'
			else
				reg_info = reg_info..'\n	<tasksystem name="'..tabA[x].name..'" class="'..get.class..'" count="'..get.count..'" actprice="'..get.price..'" repeated="'..get.repeated..'" inday="'..inday..'" itemList="'..listItem..'" premdays="'..premdays..'" exppoints="'..exppoints..'" mlist="'..mlist..'"/>'
			end
		end
		doRegisterInFile(cid, "data/lib/", "_Task_System_Gesior_Info", "xml", "<task_system>\n"..reg_info.."\n</task_system>", "")
		print("> ["..os.date("%H")..":"..os.date("%M")..":"..os.date("%S").."] [GESIOR] Task System Info Updated Successfully.")
	end, 17 * 1000)
return true
end