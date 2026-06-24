local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end
function onPlayerEndTrade(cid)              npcHandler:onPlayerEndTrade(cid)            end
function onPlayerCloseChannel(cid)          npcHandler:onPlayerCloseChannel(cid)        end

local query = db.query or db.executeQuery
local tabela = {
    [1] = {
        words = {"autoLoot doll", "autoLoot doll"},
		id_item = 13131, 
        pontos = 18 
    },
    [2] = {
        words = {"pharaot bow", "pharaot bow"},
        id_item = 13359, 
        pontos = 23 
    },  
    [3] = {
        words = {"pharaot golden bow", "pharaot golden bow"},
        id_item = 12731, 
        pontos = 23 
    },          
    [4] = {
        words = {"pharaot golden bow", "pharaot golden bow"},
        id_item = 12731, 
        pontos = 23 
    }, 
    [5] = {  
        words = {"pharaot ice bow", "pharaot ice bow"},
        id_item = 12730, 
        pontos = 23 
    }, 
    [6] = {  
        words = {"pharaot blade", "pharaot blade"},
        id_item = 13358, 
        pontos = 23 
    }, 
    [7] = {  
        words = {"pharaot hammer", "pharaot hammer"},
        id_item = 13356, 
        pontos = 23 
    },  
    [8] = {  
        words = {"pharaot axe", "pharaot axe"},
        id_item = 13357, 
        pontos = 23 
    },    
    [9] = {  
        words = {"master spellbook", "master spellbook"},
        id_item = 13388, 
        pontos = 18 
    },   
   [10] = {  
       words = {"elder spellbook", "elder spellbook"},
       id_item = 13389, 
      pontos = 18 
   },        
    [11] = {  
        words = {"royal shield", "royal shield"},
        id_item = 13383, 
        pontos = 18 
    },  
    [12] = {  
        words = {"elite shield", "elite shield"},
        id_item = 13387, 
        pontos = 18 
    },   
    [13] = {  
        words = {"pharaot wand", "pharaot wand"},
        id_item = 13355, 
        pontos = 23 
    },  
    [14] = {  
        words = {"pharaot rod", "pharaot rod"},
        id_item = 13360, 
        pontos = 23 
    },  
    [15] = {  
        words = {"pharaot boots", "pharaot boots"},
        id_item = 12692, 
       pontos = 23 
   },  
    [16] = {  
        words = {"pally helmet", "pally helmet"},
        id_item = 13386, 
        pontos = 18 
    },      
    [17] = {  
        words = {"elite helmet", "elite helmet"},
        id_item = 13384, 
        pontos = 18 
    }, 
    [18] = {  
        words = {"pharaot hat", "pharaot hat"},
        id_item = 12691, 
        pontos = 18 
    }, 
    [19] = {  
        words = {"pharaot hat", "pharaot hat"},
        id_item = 12691, 
        pontos = 18 
    },  
    [20] = {  
        words = {"brown backpack", "brown backpack"},
        id_item = 13376, 
        pontos = 23 
    },   
    [21] = {  
        words = {"deluxe backpack", "deluxe backpack"},
        id_item = 13382, 
        pontos = 23
    },                                       
    [22] = {  
        words = {"pharaotwars backpack", "pharaotwars backpack"},
        id_item = 13380, 
        pontos = 23 
    }, 
    [23] = {  
        words = {"divine amulet", "divine amulet"},
        id_item = 12956, 
        pontos = 18 
    }, 
    [24] = {  
        words = {"guardian amulet", "guardian amulet"},
        id_item = 12969, 
        pontos = 18 
    },
    [25] = {  
        words = {"necro amulet", "necro amulet"},
        id_item = 12970, 
        pontos = 18 
    },    
    [26] = {  
        words = {"mystical escriture", "mystical escriture"},
        id_item = 12828, 
        pontos = 23 
    }, 

--Soul Items

    [27] = {  
        words = {"soulcutter", "soulcutter"},
        id_item = 13091, 
        pontos = 23 
    },  
    [28] = {  
        words = {"soulcrusher", "soulcrusher"},
        id_item = 13095, 
        pontos = 23 
    },    
    [29] = {  
        words = {"soulbiter", "soulbiter"},
        id_item = 13093, 
        pontos = 23 
    },  
    [30] = {  
        words = {"soulbleeder", "soulbleeder"},
        id_item = 13097, 
        pontos = 23 
    }, 
    [31] = {  
        words = {"soulpiecer", "soulpiecer"},
        id_item = 13098, 
        pontos = 23 
    },  
    [32] = {  
        words = {"soulhexer", "soulhexer"},
        id_item = 13100, 
        pontos = 23 
    }, 
    [33] = {  
        words = {"soultainter", "soultainter"},
        id_item = 13099, 
        pontos = 23 
    }, 
    [34] = {  
        words = {"soulredder", "soulredder"},
        id_item = 13092, 
        pontos = 23 
    }, 
    [35] = {  
        words = {"soulmaimer", "soulmaimer"},
        id_item = 13096, 
        pontos = 23 
    }, 
    [36] = {  
        words = {"souleater", "souleater"},
        id_item = 13094, 
        pontos = 23 
    },  
    [37] = {  
        words = {"pairs of soulwalkers", "pairs of soulwalkers"},
        id_item = 13106, 
        pontos = 23 
    }, 
    [38] = {  
        words = {"soulbastion", "soulbastion"},
        id_item = 13108, 
        pontos = 23 
    }, 
    [39] = {  
        words = {"pairs of soulstalkers", "pairs of soulstalkers"},
        id_item = 13107, 
        pontos = 23 
    }, 
    [40] = {  
        words = {"soulshell", "soulshell"},
        id_item = 13103, 
        pontos = 23 
    }, 
    [41] = {  
        words = {"soulshanks", "soulshanks"},
        id_item = 13101, 
        pontos = 23 
    }, 
    [42] = {  
        words = {"soulmantle", "soulmantle"},
        id_item = 13104, 
        pontos = 23 
    },         
    [43] = {  
        words = {"soulstrider", "soulstrider"},
        id_item = 13102, 
        pontos = 23 
    }, 
    [44] = {  
        words = {"soulshroud", "soulshroud"},
        id_item = 13105, 
        pontos = 23 
    },   
}


function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
	end

	if msg then
		for i=1,#tabela do
			if msgcontains(msg, tabela[i].words) then
				if getPlayerItemCount(cid, tabela[i].id_item) >= 1 then
					if doPlayerRemoveItem(cid, tabela[i].id_item, 1) then
						local execute_query = query("UPDATE `accounts` SET `premium_points` = `premium_points` + '"..tabela[i].pontos.."' WHERE `id` = '"..getPlayerAccountId(cid).."'")
						if execute_query then
							npcHandler:say("Você recebeu " .. tabela[i].pontos .. " premium points de volta. Acesse o SHOP do site para comprar novamente outros itens.", cid)
						else
							npcHandler:say("WARNING: Something unexpected has occurred. Please contact the administrator. > ERROR LINE:32 <", cid)
						end
					else
						npcHandler:say("WARNING: Something unexpected has occurred. Please contact the administrator. > ERROR LINE:30 <", cid)
					end
				else
					npcHandler:say("Desculpe, você não possui o item.", cid)
				end
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Olá |PLAYERNAME|! Caso não tenha gostado do item que comprou no site, e queira receber os pontos de volta, basta dizer o nome do item. Lembre-se que terá uma taxa na troca do item de 2 pontos, e para cada item {SOUL} 25 pontos.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até logo, |PLAYERNAME|.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())