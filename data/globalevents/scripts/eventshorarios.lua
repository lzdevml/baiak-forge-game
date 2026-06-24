local EventsListalist = {
	    		

	    {time = "08:30", name = "SafeZone"},
		{time = "09:30", name = "Zombie Event"},			
	    {time = "10:00", name = "Snowball"},	
		{time = "11:00", name = "The Rain"},	
		{time = "11:30", name = "SafeZone"},	
		{time = "12:00", name = "Counter Strike"},
	    {time = "13:00", name = "Snowball"},	
	    {time = "14:00", name = "Counter Strike"},
		{time = "15:00", name = "Zombie Event"},	
	    {time = "16:00", name = "Bomberman"},	
	    {time = "17:00", name = "Zombie Event"}, --
		{time = "17:30", name = "The Rain"},	
	    {time = "18:00", name = "Capture The Flag"},
	    {time = "19:30", name = "Snowball"},	
	    {time = "20:00", name = "Defend The Towers"},	
	    {time = "20:30", name = "SafeZone"},	
		{time = "22:40", name = "Zombie Event"}, 
		{time = "23:30", name = "The Rain"}, 
		{time = "23:57", name = "Counter Strike"}, 
		{time = "01:00", name = "Zombie Event"}, 
		{time = "01:30", name = "SafeZone"}, 
		{time = "02:00", name = "Snowball"} 		
	}
	
	local position = {x = 165, y = 52, z = 7}
	
	
function onThink(interval, lastExecution)
		
	 local people = getPlayersOnline()
    if #people == 0 then
        return true
    end
	
	local tp = getTileItemById(position, 1387)
	if tp and tp.uid < 1 then
		for _, t in ipairs(EventsListalist) do
			local eventTime = hourToNumber(t.time)
			local realTime = hourToNumber(os.date("%H:%M:%S"))
			if eventTime >= realTime then
				doPlayerSay(people[1], "Próximo evento às {"..t.time.."h} "..t.name..", faltam "..timeString(eventTime - realTime)..".", TALKTYPE_MONSTER_SAY, false, 0, position)
				return true
			end
		end
	else
		if getGlobalStorageValue(45701) > 0 then
			countDownTeleport({x = 151, y = 43, z = 7}, 290)
			setGlobalStorageValue(45701, -1)
		end
	end
	return true
end