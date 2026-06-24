local invasao = {
	[1] = {
		name = "GazHaragoth",
		type = "quinzenal",
		day1 = 13,
		day2 = 28,
		hour = 09,
		minu = 15
	},
	[2] = {
		name = "Zulazza the Corruptor",
		type = "mensal",
		day1 = 10,
		hour = 18,
		minu = 00
	},
	[3] = {
		name = "Orshabaal",
		type = "trimestral",
		day1 = 10,
		mes1 = 4,
		day2 = 20,
		mes2 = 8,
		day3 = 30,
		mes3 = 12,
		hour = 20,
		minu = 00
	},
	[4] = {
		name = "Ferumbras",
		type = "semestral",
		day1 = 11,
		mes1 = 6,
		day2 = 21,
		mes2 = 12,
		hour = 21,
		minu = 00
	},
	[5] = {
		name = "Ghazbaran",
		type = "semestral",
		day1 = 10,
		mes1 = 2,
		day2 = 20,
		mes2 = 8,
		hour = 21,
		minu = 00
	},
	[6] = {
		name = "Morgaroth",
		type = "semestral",
		day1 = 10,
		mes1 = 4,
		day2 = 20,
		mes2 = 10,
		hour = 21,
		minu = 00
	},
	[7] = {
		name = "Omrafir",
		type = "trimestral",
		day1 = 10,
		mes1 = 2,
		day2 = 20,
		mes2 = 5,
		day3 = 30,
		mes3 = 8,
		hour = 20,
		minu = 00
	},
}

local last_execsutes = {}

function onThink(interval, lastExecution, thinkInterval)
        local static_time = os.time()
        for k, raid in ipairs(raids) do
                if (raid.type == 'weekly') then
                        local day = os.date("%A", static_time):lower()
                        if isInArray(raid.days, day) then
                                local hour = tonumber(os.date("%H", static_time))
                                if (raid.hour == hour) then
                                        local minute = tonumber(os.date("%M", static_time))
                                        if (raid.minu == minute) then
                                                local day_number = tonumber(os.date("%d", static_time))
                                                if (last_execsutes[k] ~= day_number) then
                                                        last_execsutes[k] = day_number
                                                        doExecuteRaid(raid.name)
                                                end
                                        end
                                end
                        end
                elseif (raid.type == 'exact') then
                        local month = tonumber(os.date("%m", static_time))
                        if (raid.date.month == month) then
                                local day = tonumber(os.date("%d", static_time))
                                if (raid.date.day == day) then
                                        local hour = tonumber(os.date("%H", static_time))
                                        if (raid.hour == hour) then
                                                local minute = tonumber(os.date("%M", static_time))
                                                if (raid.minu == minute) then
                                                        if (last_execsutes[k] ~= day) then
                                                                last_execsutes[k] = day
                                                                doExecuteRaid(raid.name)
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
        return true
end