--[[
- hour should be exact SERVER hour
- to do the raid at clock 00 minutes 00
- to do the raid at exaxt date use type "exact"
- to do the raid weekly use type "weekly"
- days names are used only for weekly type and should be 
- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"
- also should be inside a array -> {}
]]

local raids =
	{
		[1] = 
			{
				name = 'the snapper',
				type = 'weekly',
				days = {'monday'},
				hour = 08,
				minu = 00
				
			},
		[2] = 
			{
				name = 'hide',
				type = 'weekly',
				days = {'monday'},
				hour = 11,
				minu = 30
			},
		[3] = 
			{
				name = 'tiquandas revenge',
				type = 'weekly',
				days = {'monday'},
				hour = 15,
				minu = 00
			},
		[4] = 
			{
				name = 'the bloodtusk',
				type = 'weekly',
				days = {'monday'},
				hour = 18,
				minu = 00
			},
		[5] = 
			{
				name = 'arachir the ancient one',
				type = 'weekly',
				days = {'monday'},
				hour = 20,
				minu = 30
			},		
		[6] = 
			{
				name = 'esmeralda',
				type = 'weekly',
				days = {'monday'},
				hour = 22,
				minu = 00
			},

		[7] = 
			{
				name = 'the old widow',
				type = 'weekly',
				days = {'monday'},
				hour = 23,
				minu = 30
			},
		[8] = 
			{
				name = 'diblis the fair',
				type = 'weekly',
				days = {'tuesday'},
				hour = 07,
				minu = 00
			},
		[9] = 
			{
				name = 'gorgo',
				type = 'weekly',
				days = {'tuesday'},
				hour = 10,
				minu = 30
			},
		[10] = 
			{
				name = 'leviathan',
				type = 'weekly',
				days = {'tuesday'},
				hour = 13,
				minu = 00
			},
		[11] = 
			{
				name = 'stonecracker',
				type = 'weekly',
				days = {'tuesday'},
				hour = 17,
				minu = 00
			},
		[12] = 

			{
				name = 'the noxious spawn',
				type = 'weekly',
				days = {'tuesday'},
				hour = 20,
				minu = 00
			},
		[13] = 
			{
				name = 'merikh the slaughterer',
				type = 'weekly',
				days = {'tuesday'},
				hour = 22,
				minu = 00
			},
		[14] = 
			{
				name = 'fahim the wise',
				type = 'weekly',
				days = {'tuesday'},
				hour = 23,
				minu = 30
			},


		[15] = 
			{
				name = 'demodras',
				type = 'weekly',
				days = {'wednesday'},
				hour = 08,
				minu = 00
			},
		[16] = 
			{
				name = 'the horned fox',
				type = 'weekly',
				days = {'wednesday'},
				hour = 11,
				minu = 00
			},
		[17] = 
			{
				name = 'necropharus',
				type = 'weekly',
				days = {'wednesday'},
				hour = 21,
				minu = 00
			},
		[18] = 
			{
				name = 'paiz the pauperizer',
				type = 'weekly',
				days = {'wednesday'},
				hour = 16,
				minu = 30
			},
		[19] = 
			{
				name = 'kerberos',
				type = 'weekly',
				days = {'wednesday'},
				hour = 19,
				minu = 30
			},
		[20] = 
			{
				name = 'zevelong duskbringer',
				type = 'weekly',
				days = {'wednesday'},
				hour = 14,				       
				minu = 00
			},		
		[21] = 
			{
				name = 'ethershreck',
				type = 'weekly',
				days = {'wednesday'},
				hour = 23,
				minu = 00
			},	
        [22] = 
			{
				name = 'zulazza the corruptor',
				type = 'weekly',
				days = {'thursday'},
				hour = 07,
				minu = 00
			},
		[23] = 
			{
				name = 'barbarian',
				type = 'weekly',
				days = {'thursday'},
				hour = 10,
				minu = 30
			},
		[24] = 
			{
				name = 'zanakeph',
				type = 'weekly',
				days = {'thursday'},
				hour = 14,
				minu = 00
			},
		[25] = 
			{
				name = 'the many',
				type = 'weekly',
				days = {'thursday'},
				hour = 16,
				minu = 20
			},
		[26] = 
			{
				name = 'thul',
				type = 'weekly',
				days = {'thursday'},
				hour = 19,
				minu = 30
			},		
		[27] = 
			{
				name = 'massacre',
				type = 'weekly',
				days = {'thursday'},
				hour = 21,
				minu = 30
			},

		[28] = 
			{
				name = 'thul',
				type = 'weekly',
				days = {'thursday'},
				hour = 23,
				minu = 40
			},


		[29] = 
			{
				name = 'esmeralda',
				type = 'weekly',
				days = {'friday'},
				hour = 8,
				minu = 00
			},
		[30] = 
			{
				name = 'the old widow',
				type = 'weekly',
				days = {'friday'},
				hour = 12,
				minu = 00
			},
		[31] = 
			{
				name = 'diblis the fair',
				type = 'weekly',
				days = {'friday'},
				hour = 15,
				minu = 00
			},
		[32] = 
			{
				name = 'gorgo',
				type = 'weekly',
				days = {'friday'},
				hour = 1,
				minu = 00
			},
		[33] = 

			{
				name = 'leviathan',
				type = 'weekly',
				days = {'friday'},
				hour = 20,
				minu = 00
			},
		[34] = 
			{
				name = 'stonecracker',
				type = 'weekly',
				days = {'friday'},
				hour = 22,
				minu = 30
			},
		[35] = 
			{
				name = 'the noxious spawn',
				type = 'weekly',
				days = {'friday'},
				hour = 18,
				minu = 00
			},


		[36] = 
			{
				name = 'merikh the slaughterer',
				type = 'weekly',
				days = {'friday'},
				hour = 22,
				minu = 00
			},


		[37] = 
			{
				name = 'horned fox',
				type = 'weekly',
				days = {'sunday'},
				hour = 08,
				minu = 00
			},
		[38] = 
			{
				name = 'paiz the pauperizer',
				type = 'weekly',
				days = {'sunday'},
				hour = 10,
				minu = 30
			},
		[39] = 
			{
				name = 'demodras',
				type = 'weekly',
				days = {'sunday'},
				hour = 14,
				minu = 00
			},
		[40] = 
			{
				name = 'necropharus',
				type = 'weekly',
				days = {'sunday'},
				hour = 16,
				minu = 20
			},
		[41] = 
			{
				name = 'the many',
				type = 'weekly',
				days = {'sunday'},
				hour = 18,
				minu = 00
			},		
		[42] = 
			{
				name = 'zulazza the corruptor',
				type = 'weekly',
				days = {'sunday'},
				hour = 20,
				minu = 00
			},	
			[43] = 
			{
				name = 'kerberos',
				type = 'weekly',
				days = {'sunday'},
				hour = 23,
				minu = 40
			},		
         [44] = 
			{
				name = 'zevelong duskbringer',
				type = 'weekly',
				days = {'saturday'},
				hour = 08,
				minu = 00
			},
		[45] = 
			{
				name = 'ethershreck',
				type = 'weekly',
				days = {'saturday'},
				hour = 10,
				minu = 00
			},
		[46] = 
			{
				name = 'zulazza the corruptor',
				type = 'weekly',
				days = {'saturday'},
				hour = 12,
				minu = 00
			},
		[47] = 
			{
				name = 'massacre',
				type = 'weekly',
				days = {'saturday'},
				hour = 15,
				minu = 00
			},
		[48] = 
			{
				name = 'the many',
				type = 'weekly',
				days = {'saturday'},
				hour = 16,
				minu = 20
			},		
		[49] = 
			{
				name = 'thul',
				type = 'weekly',
				days = {'saturday'},
				hour = 18,
				minu = 30
			},

		[50] = 
			{
				name = 'zanakeph',
				type = 'weekly',
				days = {'saturday'},
				hour = 20,
				minu = 30
			},
			[51] = 
			{
				name = 'ferumbras',
				type = 'weekly',
				days = {'saturday'},
				hour = 20,
				minu = 00
			},	
			[52] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'sunday'},
				hour = 20,
				minu = 00
			},
			[53] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'monday'},
				hour = 20,
				minu = 00
			},	
			[54] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'tuesday'},
				hour = 20,
				minu = 00
			},	
			[55] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'wednesday'},
				hour = 20,
				minu = 00
			},	
			[56] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'thursday'},
				hour = 20,
				minu = 00
			},		
			[57] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'friday'},
				hour = 20,
				minu = 00
			},	
			[58] = 
			{
				name = 'gazharagoth',
				type = 'weekly',
				days = {'saturday'},
				hour = 20,
				minu = 00
			},	

          --Abyssador--
          --Pirates--

			[59] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'monday'},
				hour = 15,
				minu = 33
			},	
			[60] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'tuesday'},
				hour = 14,
				minu = 00
			},	
			[61] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'wednesday'},
				hour = 13,
				minu = 00
			},	
			[62] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'thursday'},
				hour = 16,
				minu = 00
			},										
			[63] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'friday'},
				hour = 17,
				minu = 00
			},	
			[66] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'saturday'},
				hour = 11,
				minu = 00
			},	
			[64] = 
			{
				name = 'Pirates',
				type = 'weekly',
				days = {'sunday'},
				hour = 18,
				minu = 00
			},				

           --Pirates--
           --Abyssador--                   
			[65] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'monday'},
				hour = 18,
				minu = 00
			},	
			[67] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'wednesday'},
				hour = 22,
				minu = 18
			},
			[68] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'thursday'},
				hour = 18,
				minu = 00
			},	
			[69] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'friday'},
				hour = 18,
				minu = 00
			},
			[70] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'saturday'},
				hour = 18,
				minu = 00
			},
			[71] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'sunday'},
				hour = 18,
				minu = 00
			},

          --Abyssador--

          --Scarlett Etzel--

			[72] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'monday'},
				hour = 12,
				minu = 00
			},	
			[73] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'tuesday'},
				hour = 08,
				minu = 00
			},	
			[74] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'wednesday'},
				hour = 04,
				minu = 00
			},	
			[75] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'thursday'},
				hour = 23,
				minu = 30
			},	
			[76] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'friday'},
				hour = 20,
				minu = 00
			},	
			[77] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'saturday'},
				hour = 16,
				minu = 00
			},	
			[78] = 
			{
				name = 'scarlett etzel',
				type = 'weekly',
				days = {'sunday'},
				hour = 12,
				minu = 00
			},																

          --Scarlett Etzel fim--	

			[79] = 
			{
				name = 'gaz haragorth',
				type = 'weekly',
				days = {'sunday'},
				hour = 22,
				minu = 00
			},	
			[80] = 
			{
				name = 'alptramun',
				type = 'weekly',
				days = {'friday'},
				hour = 22,
				minu = 00
			},         	

			[81] = 
			{
				name = 'king zelos',
				type = 'weekly',
				days = {'thursday'},
				hour = 22,
				minu = 00
			},

          --Rupture--	

			[82] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'monday'},
				hour = 16,
				minu = 00
			},	
			[83] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'tuesday'},
				hour = 16,
				minu = 00
			},	
			[84] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'wednesday'},
				hour = 16,
				minu = 00
			},	
			[85] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'thursday'},
				hour = 16,
				minu = 00
			},	
			[86] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'friday'},
				hour = 16,
				minu = 00
			},										
			[87] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'saturday'},
				hour = 16,
				minu = 00
			},	
			[88] = 
			{
				name = 'rupture',
				type = 'weekly',
				days = {'sunday'},
				hour = 16,
				minu = 00
			},	

          --Rupture--	
          --dragonking zyrtarch--

			[89] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'monday'},
				hour = 15,
				minu = 00
			},
			[90] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'tuesday'},
				hour = 15,
				minu = 00
			},
			[91] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'wednesday'},
				hour = 15,
				minu = 00
			},
			[92] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'thursday'},
				hour = 15,
				minu = 00
			},
			[93] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'friday'},
				hour = 15,
				minu = 00
			},
			[94] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'saturday'},
				hour = 15,
				minu = 00
			},
			[95] = 
			{
				name = 'dragonking zyrtarch',
				type = 'weekly',
				days = {'sunday'},
				hour = 15,
				minu = 00
			},	

          --dragonking zyrtarch--
          --the last lore keeper--          

			[96] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'monday'},
				hour = 20,
				minu = 00
			},	
			[97] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'tuesday'},
				hour = 20,
				minu = 00
			},	
			[98] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'wednesday'},
				hour = 20,
				minu = 00
			},	
			[99] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'thursday'},
				hour = 20,
				minu = 00
			},	
			[100] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'friday'},
				hour = 20,
				minu = 00
			},	
			[101] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'saturday'},
				hour = 20,
				minu = 00
			},	
			[102] = 
			{
				name = 'the last lore keeper',
				type = 'weekly',
				days = {'sunday'},
				hour = 20,
				minu = 00
			},	

          --the last lore keeper-- 
																					
			[103] = 
			{
				name = 'goshnars malice',
				type = 'weekly',
				days = {'tuesday'},
				hour = 03,
				minu = 00
			},
			[104] = 
			{
				name = 'goshnars greed',
				type = 'wednesday',
				days = {'monday'},
				hour = 03,
				minu = 00
			},			

          --malofur--

			[105] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'monday'},
				hour = 13,
				minu = 00
			},	
			[106] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'tuesday'},
				hour = 13,
				minu = 00
			},	
			[107] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'wednesday'},
				hour = 20,
				minu = 30
			},	
			[108] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'thursday'},
				hour = 13,
				minu = 00
			},	
			[109] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'friday'},
				hour = 13,
				minu = 00
			},	
			[110] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'saturday'},
				hour = 13,
				minu = 00
			},																				
			[111] = 
			{
				name = 'malofur mangrinder',
				type = 'weekly',
				days = {'sunday'},
				hour = 13,
				minu = 00
			},

          --malofur--
          --mawhawk--           
			[112] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'monday'},
				hour = 08,
				minu = 30
			},
			[113] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'tuesday'},
				hour = 08,
				minu = 30
			},
			[114] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'wednesday'},
				hour = 08,
				minu = 30
			},
			[115] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'thursday'},
				hour = 08,
				minu = 30
			},
			[116] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'friday'},
				hour = 08,
				minu = 30
			},
			[117] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'saturday'},
				hour = 08,
				minu = 30
			},
			[118] = 
			{
				name = 'mawhawk',
				type = 'weekly',
				days = {'sunday'},
				hour = 08,
				minu = 30
			},																		

          --mawhawk--
                   			
			[111] = 
			{
				name = 'jaul',
				type = 'weekly',
				days = {'thursday'},
				hour = 18,
				minu = 30
			},			
			[119] = 
			{
				name = 'abyssador',
				type = 'weekly',
				days = {'tuesday'},
				hour = 18,
				minu = 00
		
		}		 
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